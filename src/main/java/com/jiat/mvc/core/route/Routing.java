package com.jiat.mvc.core.route;

//import com.jiat.ecomm.dao.UserDao;
//import com.jiat.ecomm.entity.User;
//import com.jiat.ecomm.util.Status;
import com.jiat.mvc.core.controller.Controller;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.VendorDao;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.util.Status;
//import com.jiat.mvc.core.interfaces.Authenticate;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Achintha
 */
public class Routing {

    private static HashMap<String, HashMap<String, RouteModel>> routerList;

    public Routing() {
        routerList = Router.getAllRouteList();
    }

    public void start(String url, HttpServletRequest request, HttpServletResponse response) {
        String httpRequestMethod = getHttpRequestMethod(request);
        RouteModel routeModel = routerList.get(httpRequestMethod).get(url);
        loadClass(routeModel, request, response);
    }

    public static boolean hasRoute(String requestMethod, String url) {
        return routerList.containsKey(requestMethod) && routerList.get(requestMethod).containsKey(url);
    }

    private String getHttpRequestMethod(HttpServletRequest request) {
        return request.getMethod();
    }

    private void loadClass(RouteModel routeModel, HttpServletRequest request, HttpServletResponse response) {
        try {
            Class<? extends Controller> aClass = routeModel.getController().getClass();
            Method method = aClass.getDeclaredMethod(routeModel.getMethod(), HttpServletRequest.class, HttpServletResponse.class);
            String baseUrl = request.getServletContext().getAttribute("base_url").toString();
            String path = request.getRequestURI().substring(request.getContextPath().length());
            if (path.contains("admin/")) {
                if (aClass.isAnnotationPresent(Authenticate.class)) {
                    Authenticate authenticate = aClass.getAnnotation(Authenticate.class);

                    if (!validateAuthentication(request, authenticate.value())) {
                        response.sendRedirect(request.getContextPath() + "/admin/sign-in");
                        return;
                    }

                    boolean verifyAccount = verifyAccount(request, response);
                    if (!verifyAccount) {
                        return;
                    }

                } else if (method.isAnnotationPresent(Authenticate.class)) {
                    Authenticate authenticate = method.getAnnotation(Authenticate.class);
                    if (!validateAuthentication(request, authenticate.value())) {
                        response.sendRedirect(request.getContextPath() + "/admin/sign-in");
                        return;
                    }

                    boolean verifyAccount = verifyAccount(request, response);
                    if (!verifyAccount) {
                        return;
                    }
                }

            }
            if (path.contains("seller/")) {
                if (aClass.isAnnotationPresent(Authenticate.class)) {
                    Authenticate authenticate = aClass.getAnnotation(Authenticate.class);

                    if (!validateAuthentication(request, authenticate.value())) {
                        response.sendRedirect(baseUrl + "sign-in");
                        return;
                    }

                    boolean verifyAccount = approvedAccount(request, response);
                    if (!verifyAccount) {
                        return;
                    }

                } else if (method.isAnnotationPresent(Authenticate.class)) {
                    Authenticate authenticate = method.getAnnotation(Authenticate.class);
                    if (!validateAuthentication(request, authenticate.value())) {
                        response.sendRedirect(baseUrl + "sign-in");
                        return;
                    }

                    boolean verifyAccount = approvedAccount(request, response);
                    if (!verifyAccount) {
                        return;
                    }
                }

            }
            if (aClass.isAnnotationPresent(Authenticate.class)) {
                Authenticate authenticate = aClass.getAnnotation(Authenticate.class);

                if (!validateAuthentication(request, authenticate.value())) {
                    response.sendRedirect(baseUrl + "sign-in");
                    return;
                }

                boolean verifyAccount = verifyAccount(request, response);
                if (!verifyAccount) {
                    return;
                }

            } else if (method.isAnnotationPresent(Authenticate.class)) {
                Authenticate authenticate = method.getAnnotation(Authenticate.class);
                if (!validateAuthentication(request, authenticate.value())) {
                    response.sendRedirect(baseUrl + "sign-in");
                    return;
                }

                boolean verifyAccount = verifyAccount(request, response);
                if (!verifyAccount) {
                    return;
                }
            }

            method.invoke(routeModel.getController(), request, response);

        } catch (NoSuchMethodException ex) {
            Logger.getLogger(Routing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SecurityException ex) {
            Logger.getLogger(Routing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Routing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalArgumentException ex) {
            Logger.getLogger(Routing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(Routing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Routing.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static String removeLastSlash(String url) {
        if (url != null && url.length() > 2 && url.endsWith("/")) {
            return url.substring(0, url.length() - 1);
        }
        return url;
    }

    private boolean validateAuthentication(HttpServletRequest request, String... value) {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            return false;
        }

        User user = (User) session.getAttribute("user");
        UserDao dao = new UserDao();
        user = dao.getUserById(user.getId());
        request.getSession().setAttribute("user", user);

        if (value != null && value.length == 0) {
            return true;
        }

        boolean b = false;
        for (String role : value) {
            if (role.equals(user.getRole().toString())) {
                b = true;
                break;
            }
        }

        return b;
    }

    private boolean verifyAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();

        UserDao dao = new UserDao();

        if (!dao.checkEmailVerified(user.getEmail())) {
            response.sendRedirect(baseUrl + "verify_email");
            return false;
        }
        if (!dao.checkUserStatus(user.getEmail())) {
            response.sendRedirect(baseUrl + "verify_account");
            return false;
        }
        return true;
    }

    private boolean approvedAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        VendorDao dao = new VendorDao();

        if (dao.checkVendorStatus(user, Status.inactive)) {
            response.sendRedirect(baseUrl+"seller/wait-approve");
            return false;
        }
        if (dao.checkVendorStatus(user, Status.blocked)) {
            response.sendRedirect(baseUrl+"seller/account-blocked");
            return false;
        }
        return true;
    }
}

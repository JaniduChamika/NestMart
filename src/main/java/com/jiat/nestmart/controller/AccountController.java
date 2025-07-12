/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.redirect;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.VendorDao;
import com.jiat.nestmart.entity.Order;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.mail.VerificationMail;
import com.jiat.nestmart.provider.MailServiceProvider;
import com.jiat.nestmart.service.OrderService;
import com.jiat.nestmart.util.Gender;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.nestmart.util.Role;
import com.jiat.nestmart.util.Status;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class AccountController extends Controller {

    public void index(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser(request);

        if (user == null) {
            view("user/login", request, response);
        } else {
            String baseUrl = request.getServletContext().getAttribute("base_url").toString();
            redirect(baseUrl, response);
        }

    }

    @Authenticate({"customer", "vendor"})
    public void account(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser(request);
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        if (user == null) {
            redirect(baseUrl + "sign-in", response);
        } else {
            List<Order> order = new OrderService().getOrdersByUser(user);
            request.setAttribute("orders", order);
            view("user/account", request, response);
        }

    }

    public void registerUser(HttpServletRequest request, HttpServletResponse response) {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String mobileNo = request.getParameter("mobileNo");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");

        if (firstName.isEmpty()) {
            jsonObject.replace("msg", "Enter first name");

        } else if (lastName.isEmpty()) {
            jsonObject.replace("msg", "Enter last name");

        } else if (mobileNo.isEmpty()) {
            jsonObject.replace("msg", "Enter mobile number");

        } else if (email.isEmpty()) {
            jsonObject.replace("msg", "Enter email");

        } else if (dob.isEmpty()) {
            jsonObject.replace("msg", "Enter date of birth");

        } else if (password.isEmpty()) {
            jsonObject.replace("msg", "Enter password");

        } else {

            boolean emailExists = userDao.emailExists(email);

            if (!emailExists) {
                try {
                    User user = new User();
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setEmail(email);
                    user.setPassword(password);
                    user.setMobileNo(mobileNo);
                    user.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(dob));
                    user.setGender(Gender.valueOf(gender.toLowerCase()));
                    user.setRole(Role.customer);
                    user.setStatus(Status.inactive);
                    String verificationCode = UUID.randomUUID().toString();
                    user.setVerificationCode(verificationCode);
                    userDao.createUser(user);

                    jsonObject.replace("status", 201);
                    VerificationMail mail = new VerificationMail(user.getEmail(), verificationCode);
                    MailServiceProvider.getInstance().sendMail(mail);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            } else {

                jsonObject.replace("msg", "User email already exists");
            }
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void loginUser(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remeberMe = request.getParameter("rem");
        UserDao userDao = new UserDao();
        User user = userDao.userAuthentication(email, password);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if (remeberMe.equalsIgnoreCase("true")) {
                Cookie cookieEmail = new Cookie("authenticateEm", email);
                Cookie cookiePw = new Cookie("authenticatePw", password);
                cookieEmail.setMaxAge(60 * 60 * 7 * 7);
                cookiePw.setMaxAge(60 * 60 * 7 * 7);
                response.addCookie(cookieEmail);
                response.addCookie(cookiePw);
            }
            jsonObject.replace("msg", "sucess");

        } else {
            jsonObject.replace("msg", "Incorrect credential");

        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void verifyEmail(HttpServletRequest request, HttpServletResponse response) {
        String token = request.getParameter("token");
        EntityManager em = JPAUtill.getEntityManagerFactory().createEntityManager();
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.verificationCode=:vc", User.class);
        query.setParameter("vc", token);
        try {
            User user = query.getSingleResult();
            user.setEmailVerifiedAt(new Date());
            user.setStatus(Status.active);

            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();

            redirect("sign-in", response);
        } catch (NoResultException e) {
            e.printStackTrace();
            redirect("", response);
        }

    }

    public void verifyError(HttpServletRequest request, HttpServletResponse response) {
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();

        if (request.getSession().getAttribute("user") == null) {
            redirect(baseUrl + "sign-in", response);
            return;
        } else {
            User user = getUser(request);
            UserDao dao = new UserDao();
            if (dao.checkEmailVerified(user.getEmail())) {
                redirect(baseUrl, response);
                return;

            }
        }
        view("verify_email", request, response);
    }

    public void verifyAccount(HttpServletRequest request, HttpServletResponse response) {
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();

        if (request.getSession().getAttribute("user") == null) {
            redirect(baseUrl + "sign-in", response);
            return;
        } else {
            User user = getUser(request);
            UserDao dao = new UserDao();
            if (dao.checkUserStatus(user.getEmail())) {
                redirect(baseUrl, response);
                return;
            }
        }
        view("verify_account", request, response);
    }

    public void sendVerification(HttpServletRequest request, HttpServletResponse response) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        try {
            String verificationCode = UUID.randomUUID().toString();
            UserDao userDao = new UserDao();
            User user = userDao.getUserById(getUser(request).getId());
            user.setVerificationCode(verificationCode);
            userDao.updateUser(user);
            VerificationMail mail = new VerificationMail(user.getEmail(), verificationCode);
            MailServiceProvider.getInstance().sendMail(mail);
            jsonObject.replace("msg", "sucess");
        } catch (Exception e) {
            jsonObject.replace("msg", "error");
            e.printStackTrace();
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void waitApprove(HttpServletRequest request, HttpServletResponse response) {
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();

        if (request.getSession().getAttribute("user") == null) {
            redirect("sign-in", response);
            return;
        } else {
            User user = getUser(request);
            VendorDao dao = new VendorDao();

            if (!dao.checkVendorStatus(user, Status.inactive)) {
                redirect(baseUrl + "seller/", response);
                return;
            }

        }
        view("approve-waiting", request, response);

    }

    public void accountBlocked(HttpServletRequest request, HttpServletResponse response) {
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        if (request.getSession().getAttribute("user") == null) {
            redirect("sign-in", response);
            return;
        } else {
            User user = getUser(request);
            VendorDao dao = new VendorDao();

            if (!dao.checkVendorStatus(user, Status.blocked)) {
                redirect(baseUrl + "seller/", response);
                return;

            }

        }
        view("account_block", request, response);

    }

}

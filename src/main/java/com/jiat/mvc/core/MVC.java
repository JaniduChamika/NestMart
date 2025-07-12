package com.jiat.mvc.core;


import com.jiat.nestmart.route.Web;
import com.jiat.mvc.core.interfaces.BaseRouter;
import com.jiat.mvc.core.route.Router;
import com.jiat.mvc.core.route.Routing;
import java.util.ServiceLoader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Achintha
 */
public class MVC {

    private static MVC mvc;
    private Router router;
    private Routing routing;
    private BaseRouter baseRouter;

    private MVC() {
        if (mvc == null) {
            //mvc = this;
            router = new Router();
            routing = new Routing();
            baseRouter = new Web();
            baseRouter.registerRouter();
        }
    }

    public static MVC getInstance() {
        if (mvc == null) {
            mvc = new MVC();
        }
        return mvc;
    }

    public void doRouting(String url, HttpServletRequest request, HttpServletResponse response) {
        routing.start(url, request, response);
    }

}

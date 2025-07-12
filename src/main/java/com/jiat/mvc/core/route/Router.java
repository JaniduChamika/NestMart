package com.jiat.mvc.core.route;

import com.jiat.mvc.core.controller.Controller;
import java.util.HashMap;

/**
 *
 * @author Achintha
 */
public class Router {

    private static HashMap<String, RouteModel> httpGetRouterList;
    private static HashMap<String, RouteModel> httpPostRouterList;
    private static HashMap<String, RouteModel> httpPutRouterList;

    public Router() {
        if (httpGetRouterList == null) {
            httpGetRouterList = new HashMap<>();
        }
        if (httpPostRouterList == null) {
            httpPostRouterList = new HashMap<>();
        }
        if (httpPutRouterList == null) {
            httpPutRouterList = new HashMap<>();
        }
    }

    public static void get(String urlPattern, Controller controller, String methodName) {
        httpGetRouterList.put(urlPattern, new RouteModel(controller, methodName));
    }

    public static void post(String urlPattern, Controller controller, String methodName) {
        httpPostRouterList.put(urlPattern, new RouteModel(controller, methodName));
    }
    
    public static void put(String urlPattern, Controller controller, String methodName) {
        httpPutRouterList.put(urlPattern, new RouteModel(controller, methodName));
    }

    public static HashMap<String, HashMap<String, RouteModel>> getAllRouteList() {
        HashMap<String, HashMap<String, RouteModel>> routes = new HashMap<>();
        routes.put("GET", httpGetRouterList);
        routes.put("POST", httpPostRouterList);
        routes.put("PUT", httpPutRouterList);

        return routes;

    }

}

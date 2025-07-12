package com.jiat.mvc.core.route;

import com.jiat.mvc.core.controller.Controller;

/**
 *
 * @author Achintha
 */
public class RouteModel {

    private final String method;
    private final Controller controller;

    public RouteModel(Controller controller, String method) {
        this.controller = controller;
        this.method = method;
    }

    public String getMethod() {
        return method;
    }

    public Controller getController() {
        return controller;
    }

}

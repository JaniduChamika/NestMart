package com.jiat.mvc.core;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Achintha
 */
@WebServlet(name = "Core", urlPatterns = "/app/*", loadOnStartup = 1)
public class Core extends HttpServlet{

    @Override
    public void init() throws ServletException {
       MVC.getInstance();
    }
    
    

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI().substring(request.getContextPath().length());
        MVC.getInstance().doRouting(path.substring(4), request, response);
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.mvc.core.controller;

import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ROG STRIX
 */
public class Controller {

    public static void view(String file, HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/" + file + ".jsp");
        try {
            rd.forward(request, response);
            System.out.println(file);

        } catch (ServletException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);

        } catch (IOException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public static void redirect(String url, HttpServletResponse response) {
        try {
            response.sendRedirect(url);
        } catch (IOException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUser(HttpServletRequest request) {
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            return user;
        } else {
            return null;
        }
    }

    public Vendor getVendor(HttpServletRequest request) {
        if (request.getSession().getAttribute("vendor") != null) {
            Vendor vendor = (Vendor) request.getSession().getAttribute("vendor");
            return vendor;
        } else {
            return null;
        }
    }
}

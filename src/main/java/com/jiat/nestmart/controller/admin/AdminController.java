/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller.admin;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.VendorDao;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class AdminController extends Controller {

    @Authenticate("admin")
    public void index(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("lastResource", "admin");
        view("admin/dashboard", request, response);

    }

    public void signin(HttpServletRequest request, HttpServletResponse response) {

        view("admin/login", request, response);

    }

    public void loginAdmin(HttpServletRequest request, HttpServletResponse response) {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        User user = userDao.adminAuthentication(email, password);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

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

}

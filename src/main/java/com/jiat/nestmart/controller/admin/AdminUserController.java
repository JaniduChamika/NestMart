/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller.admin;

import com.jiat.mvc.core.controller.Controller;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.VendorDao;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.util.Status;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class AdminUserController extends Controller {

    @Authenticate("admin")
    public void veiwUsers(HttpServletRequest request, HttpServletResponse response) {
        UserDao userDao = new UserDao();
        List<User> users = userDao.getAllUsers();
        request.setAttribute("users", users);
        request.setAttribute("source", "alluser");
        request.setAttribute("lastResource", "user");

        view("admin/view-user", request, response);
    }

    @Authenticate("admin")
    public void veiwblackListUsers(HttpServletRequest request, HttpServletResponse response) {
        UserDao userDao = new UserDao();
        List<User> users = userDao.getUsersByStatus(Status.blocked);
        request.setAttribute("users", users);
        request.setAttribute("source", "blcaklist");
        request.setAttribute("lastResource", "user");
        view("admin/view-user", request, response);
    }

    public void changeUserState(HttpServletRequest request, HttpServletResponse response) {
        String userid = request.getParameter("userid");
        String newStatus = request.getParameter("newStatus");
        UserDao userDao = new UserDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");

        try {
            User user = userDao.getUserById(Integer.parseInt(userid));
            user.setStatus(Status.valueOf(newStatus));
            userDao.updateUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "error");
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    @Authenticate("admin")
    public void viewPendingReq(HttpServletRequest request, HttpServletResponse response) {
        VendorDao dao = new VendorDao();
        List<Vendor> vendor = dao.getVendorsByStatus(Status.inactive);
        request.setAttribute("vendors", vendor);
        request.setAttribute("source", "pendingVendor");
        request.setAttribute("lastResource", "seller");
        view("admin/view-vendor", request, response);
    }

    @Authenticate("admin")
    public void viewActiveSeller(HttpServletRequest request, HttpServletResponse response) {
        VendorDao dao = new VendorDao();
        List<Vendor> vendor = dao.getVendorsByStatus(Status.active);
        request.setAttribute("vendors", vendor);
        request.setAttribute("source", "activeVendor");
        request.setAttribute("lastResource", "seller");
        view("admin/view-vendor", request, response);
    }

    @Authenticate("admin")
    public void viewBlockedSeller(HttpServletRequest request, HttpServletResponse response) {
        VendorDao dao = new VendorDao();
        List<Vendor> vendor = dao.getVendorsByStatus(Status.blocked);
        request.setAttribute("vendors", vendor);
        request.setAttribute("source", "BlockVendor");
        request.setAttribute("lastResource", "seller");
        view("admin/view-vendor", request, response);
    }

    public void changeVendorState(HttpServletRequest request, HttpServletResponse response) {
        String userid = request.getParameter("userid");
        String newStatus = request.getParameter("newStatus");
        VendorDao dao = new VendorDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");

        try {
            Vendor vendor = dao.getVendorById(Integer.parseInt(userid));
            vendor.setStatus(Status.valueOf(newStatus));
            dao.updateVendor(vendor);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "error");
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}

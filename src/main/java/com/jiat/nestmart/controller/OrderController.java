/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.nestmart.dao.OrderDao;
import com.jiat.nestmart.entity.OrderItem;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.util.OrderStatus;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class OrderController extends Controller {

    public void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) {

        Vendor vendor = getVendor(request);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            OrderDao orderDao = new OrderDao();
            if (vendor.getId() == orderDao.getOrderItemById(orderId).getProduct().getVendor().getId()) {
                String newStatus = request.getParameter("status");
                orderDao.updateOrderItemStatus(orderId, OrderStatus.valueOf(newStatus));
            }

        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "Error");
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            Logger.getLogger(VendorController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

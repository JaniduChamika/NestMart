/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.CartDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.SiteSettingDao;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.entity.Cart;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.SiteSetting;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.service.CartService;
import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class CartController extends Controller {

    @Authenticate({"customer", "vendor"})
    public void index(HttpServletRequest request, HttpServletResponse response) {
        SiteSetting setting = new SiteSettingDao().getSettingsByName("default_currency");
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        request.setAttribute("setting", setting);
        User user = getUser(request);
//        User user = new UserDao().getUserById(3);
        if (user != null) {
            CartDao cartDao = new CartDao();
            Cart cart = cartDao.getCartByUser(user);
            request.setAttribute("cart", cart);
            view("user/cart", request, response);
        } else {
            redirect(baseUrl + "sign-in", response);
        }

    }


    public void addItemToCart(HttpServletRequest request, HttpServletResponse response) {

        ProductDao productDao = new ProductDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        try {
            Product product = productDao.getProductById(Integer.parseInt(request.getParameter("pid")));
            int qty = Integer.parseInt(request.getParameter("qty"));

            if (product == null) {
                jsonObject.replace("msg", "product not found");

            } else if (product.getStockQuantity() < qty) {
                jsonObject.replace("msg", "Low stock");

            } else {
                CartService service = new CartService();
                User user = getUser(request);
//                User user = new UserDao().getUserById(3);
                if (service.isItemAlreadyExist(user, product)) {
                    service.updateItemQty(user, product, qty);
                } else {
                    service.addItemToCart(user, product, qty);

                }

            }
        } catch (Exception e) {
            e.printStackTrace();

            jsonObject.replace("msg", "Error occur");

        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }


    public void updateCartQty(HttpServletRequest request, HttpServletResponse response) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        try {
            User user = getUser(request);
//            User user = new UserDao().getUserById(3);
            int productId = Integer.parseInt(request.getParameter("pid"));
            int newQuantity = Integer.parseInt(request.getParameter("qty"));
            Product product = new ProductDao().getProductById(productId);
            if (product == null) {
                jsonObject.replace("msg", "Product not found");

            } else if (product.getStockQuantity() < newQuantity) {
                jsonObject.replace("msg", "Low stock");

            } else {
                CartService service = new CartService();
                service.updateItemQty(user, product, newQuantity);
                DecimalFormat df = new DecimalFormat("###,###.00");
                double shippingFee = 200;
                jsonObject.put("productTotal", df.format(product.getPrice() * newQuantity));
                jsonObject.put("cartTotal", df.format(service.getCartTotal(user)));
                jsonObject.put("GrandcartTotal", df.format(service.getCartTotal(user) + shippingFee));
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "Server error");

        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }


    public void removeFromCart(HttpServletRequest request, HttpServletResponse response) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        try {
            User user = getUser(request);
//            User user = new UserDao().getUserById(3);
            int productId = Integer.parseInt(request.getParameter("pid"));

            Product product = new ProductDao().getProductById(productId);
            if (product == null) {
                jsonObject.replace("msg", "Product not found");

            } else {
                CartService service = new CartService();
                service.removeItemFromCart(user, product);
                DecimalFormat df = new DecimalFormat("###,###.00");
                jsonObject.put("cartTotal", df.format(service.getCartTotal(user)));
                double shippingFee = 200;
                jsonObject.put("GrandcartTotal", df.format(service.getCartTotal(user) + shippingFee));

            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "Server error");

        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }
}

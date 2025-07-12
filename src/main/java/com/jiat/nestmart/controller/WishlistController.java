/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.redirect;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.CartDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.SiteSettingDao;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.WishlistDao;
import com.jiat.nestmart.entity.Cart;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.SiteSetting;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Wishlist;
import com.jiat.nestmart.service.CartService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class WishlistController extends Controller {

    @Authenticate({"customer", "vendor"})
    public void index(HttpServletRequest request, HttpServletResponse response) {
        SiteSetting setting = new SiteSettingDao().getSettingsByName("default_currency");
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        request.setAttribute("setting", setting);
        User user = getUser(request);
//        User user = new UserDao().getUserById(3);
        if (user != null) {
            List<Wishlist> list = new WishlistDao().getWishlistByUser(user);
            request.setAttribute("wishlists", list);
            view("user/wishlist", request, response);
        } else {
            redirect(baseUrl + "sign-in", response);
        }

    }

  
    public void addToWishlist(HttpServletRequest request, HttpServletResponse response) {

        ProductDao productDao = new ProductDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        try {
            Product product = productDao.getProductById(Integer.parseInt(request.getParameter("pid")));
            if (product == null) {
                jsonObject.replace("msg", "product not found");

            } else {
                WishlistDao service = new WishlistDao();
                User user = getUser(request);
//                User user = new UserDao().getUserById(3);
                if (!service.isProductInWishlist(user, product)) {
                    service.addToWishlist(user, product);
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

   
    public void removeFromWishlist(HttpServletRequest request, HttpServletResponse response) {

        ProductDao productDao = new ProductDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        try {
            Product product = productDao.getProductById(Integer.parseInt(request.getParameter("pid")));
            if (product == null) {
                jsonObject.replace("msg", "product not found");

            } else {
                WishlistDao service = new WishlistDao();
                User user = getUser(request);
//                User user = new UserDao().getUserById(3);
                service.removeFromWishlist(user, product);

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

}

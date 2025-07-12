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
import com.jiat.nestmart.dao.CityDao;
import com.jiat.nestmart.dao.DistrictDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.ProvinceDao;
import com.jiat.nestmart.dao.SiteSettingDao;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.entity.Cart;
import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.District;
import com.jiat.nestmart.entity.Order;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.Province;
import com.jiat.nestmart.entity.SiteSetting;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.mail.InvoiceMail;
import com.jiat.nestmart.mail.VerificationMail;
import com.jiat.nestmart.provider.MailServiceProvider;
import com.jiat.nestmart.service.OrderService;
import com.jiat.nestmart.util.PaymentMethod;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class CheckoutController extends Controller {

    @Authenticate({"customer", "vendor"})
    public void cartCheckout(HttpServletRequest request, HttpServletResponse response) {

        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        SiteSetting setting = new SiteSettingDao().getSettingsByName("default_currency");
        request.setAttribute("setting", setting);
        User user = getUser(request);
//        User user = new UserDao().getUserById(3);
        if (user != null) {
            CartDao cartDao = new CartDao();
            Cart cart = cartDao.getCartByUser(user);
            if (cart == null) {
                redirect(baseUrl + "sign-in", response);
                return;
            }
            request.setAttribute("cart", cart);
            List<Province> provinces = new ProvinceDao().getAllProvince();
            List<District> districts = new DistrictDao().getAllDistrict();
            List<City> city = new CityDao().getAllCity();
            request.setAttribute("provinces", provinces);
            request.setAttribute("districts", districts);
            request.setAttribute("cities", city);
            view("user/checkout", request, response);
        } else {
            redirect(baseUrl + "sign-in", response);
        }

    }

    public void placeOrder(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser(request);
        //        User user = new UserDao().getUserById(3);
        CartDao cartdao = new CartDao();
        Cart cart = cartdao.getCartByUser(user);
        String addressNo = request.getParameter("address_no");
        String addressLine1 = request.getParameter("address_line1");
        String addressLine2 = request.getParameter("address_line2");
        String method = request.getParameter("payment_method");
        String cid = request.getParameter("city");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        try {

            if (addressNo.isEmpty()) {
                jsonObject.replace("msg", "Enter address no");

            } else if (addressLine1.isEmpty()) {
                jsonObject.replace("msg", "Enter adress line1");

            } else if (cid.isEmpty()) {
                jsonObject.replace("msg", "Select City");

            } else if (method.isEmpty()) {
                jsonObject.replace("msg", "Select payment option");

            } else if (user == null) {
                jsonObject.replace("msg", "session expired");

            } else {
                City city = new CityDao().getCityById(Integer.parseInt(cid));
                OrderService service = new OrderService();
                PaymentMethod pm = PaymentMethod.valueOf(method);
                Order order = service.placeCartOrder(user, cart, addressNo, addressLine1, addressLine2, city, pm);
                if (order != null) {
                    cartdao.deleteCart(cart.getId());
                    InvoiceMail mail = new InvoiceMail(user.getEmail(), order.getOrderItems());
                    MailServiceProvider.getInstance().sendMail(mail);
                } else {
                    jsonObject.replace("msg", "faild");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "faild");
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }

    @Authenticate({"customer", "vendor"})
    public void productCheckout(HttpServletRequest request, HttpServletResponse response) {
        SiteSetting setting = new SiteSettingDao().getSettingsByName("default_currency");
        String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        request.setAttribute("setting", setting);
        User user = getUser(request);
//        User user = new UserDao().getUserById(3);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");
        if (user != null) {

            try {
                int pid = Integer.parseInt(request.getParameter("pid"));
                int qty = Integer.parseInt(request.getParameter("qty"));
                request.setAttribute("product", new ProductDao().getProductById(pid));
                request.setAttribute("qty", qty);
                List<Province> provinces = new ProvinceDao().getAllProvince();
                List<District> districts = new DistrictDao().getAllDistrict();
                List<City> city = new CityDao().getAllCity();
                request.setAttribute("provinces", provinces);
                request.setAttribute("districts", districts);
                request.setAttribute("cities", city);
                view("user/checkout", request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            redirect(baseUrl + "sign-in", response);
        }

    }

    public void productplaceOrder(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser(request);
//        User user = new UserDao().getUserById(3);
        String addressNo = request.getParameter("address_no");
        String addressLine1 = request.getParameter("address_line1");
        String addressLine2 = request.getParameter("address_line2");
        String method = request.getParameter("payment_method");
        String cid = request.getParameter("city");
        String pid = request.getParameter("pid");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        try {
            int qty = Integer.parseInt(request.getParameter("qty"));
            Product product = new ProductDao().getProductById(Integer.parseInt(pid));
            if (addressNo.isEmpty()) {
                jsonObject.replace("msg", "Enter address no");

            } else if (addressLine1.isEmpty()) {
                jsonObject.replace("msg", "Enter adress line1");

            } else if (cid.isEmpty()) {
                jsonObject.replace("msg", "Select City");

            } else if (method.isEmpty()) {
                jsonObject.replace("msg", "Select payment option");

            } else if (user == null) {
                jsonObject.replace("msg", "session expired");

            } else if (qty > product.getStockQuantity()) {
                jsonObject.replace("msg", "Low Stock");

            } else {
                City city = new CityDao().getCityById(Integer.parseInt(cid));
                OrderService service = new OrderService();
                PaymentMethod pm = PaymentMethod.valueOf(method);
                Order order = service.placeProductOrder(user, product, qty, addressNo, addressLine1, addressLine2, city, pm);
                if (order != null) {
                    InvoiceMail mail = new InvoiceMail(user.getEmail(), order.getOrderItems());
                    MailServiceProvider.getInstance().sendMail(mail);
                } else {
                    jsonObject.replace("msg", "faild");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "faild");
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }

}

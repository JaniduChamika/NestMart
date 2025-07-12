/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.redirect;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.BrandDao;
import com.jiat.nestmart.dao.CategoryDao;
import com.jiat.nestmart.dao.CityDao;
import com.jiat.nestmart.dao.DistrictDao;
import com.jiat.nestmart.dao.OrderDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.ProvinceDao;
import com.jiat.nestmart.dao.SubCategoryDao;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.VendorDao;
import com.jiat.nestmart.entity.Brand;
import com.jiat.nestmart.entity.Category;
import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.District;
import com.jiat.nestmart.entity.Order;
import com.jiat.nestmart.entity.OrderItem;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.Province;
import com.jiat.nestmart.entity.SubCategory;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.entity.VendorAddress;
import com.jiat.nestmart.util.OrderStatus;
import com.jiat.nestmart.util.Role;
import com.jiat.nestmart.util.Status;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author ROG STRIX
 */
public class VendorController extends Controller {

    @Authenticate("vendor")
    public void index(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser(request);
        try {
            Vendor vendor = new VendorDao().getVendorByUser(user);
            request.getSession().setAttribute("vendor", vendor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("lastResource", "seller");
        view("vendor/dashboard", request, response);

    }

    @Authenticate("vendor")
    public void viewProductView(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        try {
            List<Product> products = new ProductDao().getProductsByVendor(vendor, Status.active);
            request.setAttribute("products", products);
            request.setAttribute("lastResource", "product");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("products", new ArrayList<Product>());
        }
        view("vendor/view-product", request, response);

    }

    @Authenticate("vendor")
    public void viewTrashProduct(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        try {
            List<Product> products = new ProductDao().getProductsByVendor(vendor, Status.inactive);
            request.setAttribute("products", products);
            request.setAttribute("lastResource", "product");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("products", new ArrayList<Product>());
        }
        view("vendor/trash-product", request, response);

    }

    @Authenticate("vendor")
    public void viewOrder(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        try {
            List<OrderItem> orders = new OrderDao().getOrderItemsByVendor(vendor);
            request.setAttribute("orders", orders);
            request.setAttribute("lastResource", "order");
            request.setAttribute("state", "History");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("products", new ArrayList<Product>());
        }
        view("vendor/view-order", request, response);

    }

    @Authenticate("vendor")
    public void viewActiveOrder(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        try {
            List<OrderItem> orders = new OrderDao().getOrderItemsByVendor(vendor, OrderStatus.Processing);
            request.setAttribute("orders", orders);
            request.setAttribute("lastResource", "order");
            request.setAttribute("state", "Active");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("products", new ArrayList<Product>());
        }
        view("vendor/view-order", request, response);

    }

    @Authenticate("vendor")
    public void viewPendingOrder(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        try {
            List<OrderItem> orders = new OrderDao().getOrderItemsByVendor(vendor, OrderStatus.Pending);
            request.setAttribute("orders", orders);
            request.setAttribute("lastResource", "order");
            request.setAttribute("state", "Pending");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("products", new ArrayList<Product>());
        }
        view("vendor/view-order", request, response);

    }

    @Authenticate("customer")
    public void becomeSeller(HttpServletRequest request, HttpServletResponse response) {

        String baseUrl = request.getServletContext().getAttribute("base_url").toString();

        User user = getUser(request);
        if (user == null) {

            redirect(baseUrl + "sign-in", response);
        } else {
            List<Province> provinces = new ProvinceDao().getAllProvince();
            List<District> districts = new DistrictDao().getAllDistrict();
            List<City> city = new CityDao().getAllCity();
            request.setAttribute("provinces", provinces);
            request.setAttribute("districts", districts);
            request.setAttribute("cities", city);
            view("vendor/seller-register", request, response);

        }

    }

    public void addSeller(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String addressNo = request.getParameter("addressno");
        String line1 = request.getParameter("line1");
        String line2 = request.getParameter("line2");
        String city = request.getParameter("city");
//       String uid = request.getParameter("user");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        jsonObject.put("status", 401);
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
        Pattern pattern = Pattern.compile(emailRegex);

        if (name.isEmpty()) {
            jsonObject.replace("msg", "Enter business name");
        } else if (email.isEmpty()) {
            jsonObject.replace("msg", "Enter business email");
        } else if (!pattern.matcher(email).matches()) {
            jsonObject.replace("msg", "Invalid Email");
        } else if (contact.isEmpty()) {
            jsonObject.replace("msg", "Enter contact number");
        } else if (addressNo.isEmpty()) {
            jsonObject.replace("msg", "Enter address number");
        } else if (line1.isEmpty()) {
            jsonObject.replace("msg", "Enter address line 1");
        }  else if (city.isEmpty()) {
            jsonObject.replace("msg", "Select city");
        } else {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
//            UserDao userdao = new UserDao();
//            User user = userdao.getUserById(Integer.parseInt(uid));

            if (user != null) {
                try {
                    VendorDao vendorDao = new VendorDao();
                    Vendor vendor = new Vendor();
                    VendorAddress address = new VendorAddress();
                    address.setAddressNo(addressNo);
                    address.setLine1(line1);
                    address.setLine2(line2);
                    CityDao cityDao = new CityDao();
                    City cityobj = cityDao.getCityById(Integer.parseInt(city));
                    address.setCity(cityobj);
                    address.setVendor(vendor);
                    vendor.setBusinessName(name);
                    vendor.setBusinessEmail(email);
                    vendor.setBusinessContact(contact);
                    vendor.setVendorAddress(address);
                    vendor.setUser(user);

                    vendorDao.createVendor(vendor);
                    user.setRole(Role.vendor);
                    new UserDao().updateUser(user);
                    jsonObject.replace("status", 201);
                    jsonObject.replace("msg", "success");
                } catch (Exception ex) {
                    ex.printStackTrace();
                    jsonObject.replace("msg", "Error processing request");
                }
            }

        }

        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            Logger.getLogger(VendorController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

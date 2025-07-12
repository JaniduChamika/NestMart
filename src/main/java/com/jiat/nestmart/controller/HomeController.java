/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.nestmart.util.Env;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.mvc.core.interfaces.Authenticate;
import com.jiat.nestmart.dao.CategoryDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.SiteSettingDao;
import com.jiat.nestmart.dao.SubCategoryDao;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.WishlistDao;
import com.jiat.nestmart.entity.Brand;
import com.jiat.nestmart.entity.Category;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.SiteSetting;
import com.jiat.nestmart.entity.SubCategory;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.util.Status;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ROG STRIX
 */
public class HomeController extends Controller {

    public void index(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("source", "home");
        ProductDao dao = new ProductDao();

        try {
            SubCategoryDao sdao = new SubCategoryDao();
            List<Product> all = dao.getAllProducts(5);
            request.setAttribute("All", all);
            List<Product> tv = dao.getProductsBySubCategory(sdao.getSubCategoryById(17), 5);
            request.setAttribute("TV", tv);
            List<Product> laptop = dao.getProductsBySubCategory(sdao.getSubCategoryById(7), 5);
            request.setAttribute("laptop", laptop);
            List<Product> Smartphones = dao.getProductsBySubCategory(sdao.getSubCategoryById(1), 5);
            request.setAttribute("Smartphones", Smartphones);
            List<Product> Smartwatches = dao.getProductsBySubCategory(sdao.getSubCategoryById(45), 5);
            request.setAttribute("Smartwatches", Smartwatches);
            List<Product> Tablets = dao.getProductsBySubCategory(sdao.getSubCategoryById(13), 5);
            request.setAttribute("Tablets", Tablets);
        } catch (Exception e) {
            e.printStackTrace();
        }

        view("user/home", request, response);
    }

    public void productDetails(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("pid");
        ProductDao productDao = new ProductDao();
         String baseUrl = request.getServletContext().getAttribute("base_url").toString();
        if(pid==null){
            redirect(baseUrl+"shop", response);
            return;
        }
        try {
            WishlistDao service = new WishlistDao();
            User user = getUser(request);
//            User user = new UserDao().getUserById(3);

            SiteSetting setting = new SiteSettingDao().getSettingsByName("default_currency");
            request.setAttribute("setting", setting);
            Product product = productDao.getProductById(Integer.parseInt(pid));
            request.setAttribute("product", product);
            if (user != null) {
                request.setAttribute("isInwishlist", service.isProductInWishlist(user, product));
            } else {
                request.setAttribute("isInwishlist", false);
            }
            request.setAttribute("source", "shop");

            view("user/product", request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void shop(HttpServletRequest request, HttpServletResponse response) {

        try {
            SiteSetting setting = new SiteSettingDao().getSettingsByName("default_currency");
            request.setAttribute("setting", setting);

        } catch (Exception e) {
            e.printStackTrace();

        }
        ProductDao dao = new ProductDao();
        List<Product> products;
        String topic = "All Product";
        products = dao.getAllProductsByStatus(Status.active);
        String[] sid = request.getParameterValues("sub-category");
        String[] bid = request.getParameterValues("brand");
        String cid = request.getParameter("category");
        String minprice = request.getParameter("minPrice");
        String maxprice = request.getParameter("maxprice");
        String search = request.getParameter("search");
        String sortby = request.getParameter("sortby");
        Double min = null;
        Double max = null;
        List<Integer> subcategory = null;
        List<Integer> brand = null;
        Integer category = null;
        try {
            if (cid != null) {
                category = Integer.valueOf(cid);
                Category cater = new CategoryDao().getCategoryById(Integer.parseInt(cid));
                request.setAttribute("subCategory", new SubCategoryDao().getSubCategory(cater));
                topic = cater.getName();

            }
            if (minprice != null) {
                min = Double.valueOf(minprice);
            }
            if (maxprice != null) {
                max = Double.valueOf(maxprice);
            }
            if (sid != null) {
                subcategory = Arrays.stream(sid)
                        .map(Integer::parseInt)
                        .collect(Collectors.toList());
                List<Brand> brands = dao.getDistinctBrandsBySubCategories(subcategory);
                request.setAttribute("brands", brands);
            }
            if (bid != null) {
                brand = Arrays.stream(bid)
                        .map(Integer::parseInt)
                        .collect(Collectors.toList());
            }
            products = dao.searchProducts(category, subcategory, search, brand, min, max, sortby);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("topic", topic);
        request.setAttribute("products", products);
        request.setAttribute("source", "shop");

        view("user/shop", request, response);
    }

}

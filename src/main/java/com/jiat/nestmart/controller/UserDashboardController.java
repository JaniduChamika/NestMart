/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.redirect;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.nestmart.dao.BrandDao;
import com.jiat.nestmart.dao.CategoryDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.SubCategoryDao;
import com.jiat.nestmart.entity.Brand;
import com.jiat.nestmart.entity.Category;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.SubCategory;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ROG STRIX
 */
public class UserDashboardController extends Controller {

    public void index(HttpServletRequest request, HttpServletResponse response) {
        
        view("user/dashboard", request, response);
    }

   
}

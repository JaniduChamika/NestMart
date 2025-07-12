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
import com.jiat.nestmart.dao.DistrictDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.dao.ProvinceDao;
import com.jiat.nestmart.dao.SubCategoryDao;
import com.jiat.nestmart.dao.UserDao;
import com.jiat.nestmart.dao.WishlistDao;
import com.jiat.nestmart.entity.Brand;
import com.jiat.nestmart.entity.Category;
import com.jiat.nestmart.entity.District;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.Province;
import com.jiat.nestmart.entity.SubCategory;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.util.FileUploadUtil;
import com.jiat.nestmart.util.Status;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ROG STRIX
 */
public class ProductController extends Controller {

    @Authenticate("vendor")
    public void addProductView(HttpServletRequest request, HttpServletResponse response) {

        String baseUrl = request.getServletContext().getAttribute("base_url").toString();

        User user = getUser(request);
        if (user == null || user.getVendor() == null) {
            redirect(baseUrl + "sign-in", response);
        } else {
            List<Category> category = new CategoryDao().getAllCategory();
            List<SubCategory> subcategory = new SubCategoryDao().getAllSubCategory();
            List<Brand> brand = new BrandDao().getAllBrand();

            request.setAttribute("categories", category);
            request.setAttribute("subcategories", subcategory);
            request.setAttribute("brands", brand);
            request.setAttribute("lastResource", "product");

            view("vendor/add-product", request, response);
        }

    }

    public void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String subcategoryId = request.getParameter("subcategory");
        String brandId = request.getParameter("brand");
        String price = request.getParameter("price");
        String qty = request.getParameter("qty");
        String descrition = request.getParameter("descrition");

        ProductDao productDao = new ProductDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");

        if (title.isEmpty()) {
            jsonObject.replace("msg", "Enter Title");

        } else if (subcategoryId.isEmpty()) {
            jsonObject.replace("msg", "Select Sub category");

        } else if (brandId.isEmpty()) {
            jsonObject.replace("msg", "Select Brand");

        } else if (price.isEmpty()) {
            jsonObject.replace("msg", "Enter Price");

        } else if (qty.isEmpty()) {
            jsonObject.replace("msg", "Enter Quantity");

        } else {
            try {

                User user = getUser(request);
                Brand brand = new BrandDao().getBrandById(Integer.parseInt(brandId.trim()));
                SubCategory subcategory = new SubCategoryDao().getSubCategoryById(Integer.parseInt(subcategoryId.trim()));
                if (user == null) {
                    jsonObject.replace("msg", "Session Timeout");

                } else if (brand == null) {

                    jsonObject.replace("msg", "brand not found");
                } else if (subcategory == null) {

                    jsonObject.replace("msg", "subcategory not found");
                } else {
                    Product product = new Product();
                    product.setName(title);
                    product.setSubCategory(subcategory);
                    product.setBrand(brand);
                    product.setPrice(Double.parseDouble(price));
                    product.setStockQuantity(Integer.parseInt(qty));
                    product.setDescription(descrition);
                    product.setStatus(Status.active);
                    product.setVendor(user.getVendor());
                    productDao.createProduct(product);

                    jsonObject.replace("status", 201);
                    jsonObject.replace("msg", "Success");
                    jsonObject.put("productId", product.getId());
                }
            } catch (Exception e) {
                e.printStackTrace();
                jsonObject.replace("msg", "Error");
            }
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void uploadProductImages(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("pid");

        ProductDao productDao = new ProductDao();
        Product product = productDao.getProductById(Integer.parseInt(pid));

        FileUploadUtil util = new FileUploadUtil("product");
        List<FileUploadUtil.FileItem> upload = util.upload(request);
        upload.forEach(fi -> {
            System.out.println(fi.getPath());
            product.getImages().add(fi.getPath());
        });

        productDao.updateProduct(product);
    }

    public void getSubCategory(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("cid");
        JSONObject jsonObject = new JSONObject();
        String content = "";
        jsonObject.put("msg", "success");
        jsonObject.put("status", 401);
        try {
            if (!id.isEmpty()) {
                Category category = new CategoryDao().getCategoryById(Integer.parseInt(id.trim()));
                if (category != null) {

                    content = getSubCategoryContent(category.getSubCategory());
                } else {
                    content = getSubCategoryContent(new SubCategoryDao().getAllSubCategory());

                }
            } else {

                content = getSubCategoryContent(new SubCategoryDao().getAllSubCategory());

            }
            jsonObject.put("content", content);
            jsonObject.put("status", 200);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.replace("msg", "failed");
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            Logger.getLogger(VendorController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private String getSubCategoryContent(List<SubCategory> list) {
        String content = "<option value=\"\">Select Sub Category</option> ";
        for (SubCategory subcategory : list) {
            content = content + "<option value=\"" + subcategory.getId() + "\">" + subcategory.getName() + "</option>";
        }
        return content;
    }

    public void moveTrashProduct(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));
            ProductDao productDao = new ProductDao();
            if (vendor.getId() == productDao.getProductById(pid).getVendor().getId()) {
                productDao.updateProductStatus(pid, Status.inactive);
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

    public void recycleTrashProduct(HttpServletRequest request, HttpServletResponse response) {
        Vendor vendor = getVendor(request);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));
            ProductDao productDao = new ProductDao();
            if (vendor.getId() == productDao.getProductById(pid).getVendor().getId()) {
                productDao.updateProductStatus(pid, Status.active);
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

    @Authenticate("vendor")
    public void editProductView(HttpServletRequest request, HttpServletResponse response) {
        try {
            Vendor vendor = getVendor(request);
            int pid = Integer.parseInt(request.getParameter("pid"));
            ProductDao productDao = new ProductDao();
            if (vendor.getId() == productDao.getProductById(pid).getVendor().getId()) {
                List<Category> category = new CategoryDao().getAllCategory();
                List<SubCategory> subcategory = new SubCategoryDao().getAllSubCategory();
                List<Brand> brand = new BrandDao().getAllBrand();

                request.setAttribute("categories", category);
                request.setAttribute("subcategories", subcategory);
                request.setAttribute("brands", brand);
                request.setAttribute("lastResource", "product");

                request.setAttribute("product", productDao.getProductById(pid));
                request.setAttribute("lastResource", "product");
                view("vendor/edit-product", request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("pid");
        String title = request.getParameter("title");
        String subcategoryId = request.getParameter("subcategory");
        String brandId = request.getParameter("brand");
        String price = request.getParameter("price");
        String qty = request.getParameter("qty");
        String descrition = request.getParameter("descrition");

        ProductDao productDao = new ProductDao();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "sucess");

        if (title.isEmpty()) {
            jsonObject.replace("msg", "Enter Title");

        } else if (subcategoryId.isEmpty()) {
            jsonObject.replace("msg", "Select Sub category");

        } else if (brandId.isEmpty()) {
            jsonObject.replace("msg", "Select Brand");

        } else if (price.isEmpty()) {
            jsonObject.replace("msg", "Enter Price");

        } else if (qty.isEmpty()) {
            jsonObject.replace("msg", "Enter Quantity");

        } else {
            try {

                Vendor vendor = getVendor(request);
                Brand brand = new BrandDao().getBrandById(Integer.parseInt(brandId.trim()));
                SubCategory subcategory = new SubCategoryDao().getSubCategoryById(Integer.parseInt(subcategoryId.trim()));
                if (vendor == null) {
                    jsonObject.replace("msg", "Session Timeout");

                } else if (brand == null) {

                    jsonObject.replace("msg", "brand not found");
                } else if (subcategory == null) {

                    jsonObject.replace("msg", "subcategory not found");
                } else {
                    Product product = productDao.getProductById(Integer.parseInt(pid));
                    product.setName(title);
                    product.setSubCategory(subcategory);
                    product.setBrand(brand);
                    product.setPrice(Double.parseDouble(price));
                    product.setStockQuantity(Integer.parseInt(qty));
                    product.setDescription(descrition);
                    product.setStatus(Status.active);
                    product.setVendor(vendor);
                    productDao.updateProduct(product);

                    jsonObject.replace("status", 201);
                    jsonObject.replace("msg", "Success");
                    jsonObject.put("productId", product.getId());
                }
            } catch (Exception e) {
                e.printStackTrace();
                jsonObject.replace("msg", "Error");
            }
        }
        try {
            response.getWriter().write(jsonObject.toJSONString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public void updateProductImages(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("pid");
        String existingImagesStr = request.getParameter("existingImages");
        List<String> existingImages = new ArrayList<>();
        JSONParser parser = new JSONParser();
        JSONArray jsonArray;
        try {
            jsonArray = (JSONArray) parser.parse(existingImagesStr);
            existingImages = new ArrayList<>(jsonArray);

            ProductDao productDao = new ProductDao();
            Product product = productDao.getProductById(Integer.parseInt(pid));
            product.setImages(existingImages);
            FileUploadUtil util = new FileUploadUtil("product");
            List<FileUploadUtil.FileItem> upload = util.upload(request);
            upload.forEach(fi -> {
                System.out.println(fi.getPath());
                product.getImages().add(fi.getPath());
            });

            productDao.updateProduct(product);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
    }
}

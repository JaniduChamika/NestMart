/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.controller;

import com.jiat.mvc.core.controller.Controller;
import static com.jiat.mvc.core.controller.Controller.view;
import com.jiat.nestmart.dao.CityDao;
import com.jiat.nestmart.dao.DistrictDao;
import com.jiat.nestmart.dao.ProvinceDao;
import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.District;
import com.jiat.nestmart.entity.Province;
import java.io.IOException;
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
public class AddressController extends Controller {

    public void getDistrict(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("province");
        JSONObject jsonObject = new JSONObject();
        String content = "";
        jsonObject.put("msg", "success");
        jsonObject.put("status", 401);
        try {
            if (!pid.isEmpty()) {
                Province province = new ProvinceDao().getProvinceById(Integer.parseInt(pid.trim()));
                if (province != null) {

                    content = getDistricContent(province.getDistrict());
                } else {
                    content = getDistricContent(new DistrictDao().getAllDistrict());
                }
            } else {

                content = getDistricContent(new DistrictDao().getAllDistrict());

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

    private String getDistricContent(List<District> districts) {
        String content = "<option value=\"\">Select District</option> ";
        for (District district : districts) {
            content = content + "<option value=\"" + district.getId() + " \">" + district.getNameEn() + "</option>";
        }
        return content;
    }

    public void getCity(HttpServletRequest request, HttpServletResponse response) {
        String did = request.getParameter("district");

        JSONObject jsonObject = new JSONObject();
        String content = "";
        jsonObject.put("msg", "success");
        jsonObject.put("status", 401);
        try {
            if (!did.isEmpty()) {
                District district = new DistrictDao().getDistrictById(Integer.parseInt(did.trim()));
                if (district != null) {
                    content = getCityContent(district.getCity());
                } else {
                    content = getCityContent(new CityDao().getAllCity());
                }
            } else {
                content = getCityContent(new CityDao().getAllCity());
            }
            jsonObject.put("content", content);
            jsonObject.replace("status", 200);
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

    private String getCityContent(List<City> cities) {
        String content = "<option value=\"\">Select City</option> ";
        for (City city : cities) {
            content = content + "<option value=\"" + city.getCityId() + "\">" + city.getCityName() + "</option>";
        }
        return content;
    }
     public void getPostCode(HttpServletRequest request, HttpServletResponse response) {
        String did = request.getParameter("city");

        JSONObject jsonObject = new JSONObject();
        String postcode = "";
        jsonObject.put("msg", "success");
        jsonObject.put("status", 401);
        try {
            if (!did.isEmpty()) {
                City city = new CityDao().getCityById(Integer.parseInt(did.trim()));
                if (city != null) {
                    postcode = city.getPostCode();
                } 
            } 
            jsonObject.put("postcode", postcode);
            jsonObject.replace("status", 200);
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
    
}

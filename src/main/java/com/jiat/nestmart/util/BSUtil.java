package com.jiat.nestmart.util;

import javax.servlet.ServletContext;
import org.apache.commons.text.StringEscapeUtils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
public class BSUtil {
    private static Map<String, Object> businessSettings = new HashMap<>();
    private static ServletContext context;

    static {
        load();
    }

    public BSUtil(){

    }

    public BSUtil(ServletContext ctx){
        context = ctx;
    }

    public static void setServletContext(ServletContext ctx){
        context = ctx;
    }

    public static ServletContext getServletContext(){
        return context;
    }


    private static void load() {
        businessSettings.clear();
        EntityManager em = JPAUtill.getEntityManagerFactory().createEntityManager();
        List<Object[]> list = em.createQuery("SELECT s.name,s.value FROM SiteSetting s").getResultList();
        list.forEach(o -> {
            businessSettings.put(o[0].toString(), o[1].toString());
        });
        em.close();
        System.out.println("loaded...");
    }

    public static void reload() {
        load();
    }

    public static Object get(String key) {
        return businessSettings.get(key);
    }

    public static String getString(String key) {
        return businessSettings.get(key).toString();
    }

    public static String getEscape(String value){
        return StringEscapeUtils.escapeHtml4(value);
    }
    public static String getUnescape(String key){
        String s = getString(key);
        return StringEscapeUtils.unescapeHtml4(s);
    }
    public static List getUnescapeArray(String key){
        String s = getString(key);
        String us = StringEscapeUtils.unescapeHtml4(s);
        //String substring = us.substring(1, us.length() - 1);
        String[] strings = us.split(",");
        return Arrays.asList(strings);
    }

    public static List getArray(String key){
        String s = getString(key);
        //String substring = s.substring(1, s.length() - 1);
        String[] strings = s.split(",");
        return Arrays.asList(strings);
    }

    public static String url(String path){
        StringBuilder sb = new StringBuilder();
        sb.append(context.getAttribute("base_url"))
                .append(path);
        return sb.toString();
    }

}

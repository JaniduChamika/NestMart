/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.util;

import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author ROG STRIX
 */
public class Env {
    private static Properties properties=new Properties();
    static{
        try {
            InputStream is=  Env.class.getClassLoader().getResourceAsStream("application.properties");
            properties.load(is);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String get(String key){
        return properties.getProperty(key);
    }
}

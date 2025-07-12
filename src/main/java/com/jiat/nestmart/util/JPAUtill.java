/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author ROG STRIX
 */
public class JPAUtill {
    private static EntityManagerFactory factory;
    
    static {
        if (factory == null) {
            factory = Persistence.createEntityManagerFactory("App");
        }
    }
    
    public static EntityManagerFactory getEntityManagerFactory(){
        return factory;
    }
    
    public static void close(){
        if (factory.isOpen()) {
            factory.close();
        }
    }
    
}

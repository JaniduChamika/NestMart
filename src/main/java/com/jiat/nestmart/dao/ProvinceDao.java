/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.Province;
import com.jiat.nestmart.util.JPAUtill;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class ProvinceDao {
    private EntityManager em;

    public ProvinceDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public Province getProvinceById(int id) {
        return em.find(Province.class, id);

    }

    public List<Province> getAllProvince() {
        try {
            TypedQuery<Province> query = em.createQuery("SELECT p FROM Province p", Province.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }
    
    
}

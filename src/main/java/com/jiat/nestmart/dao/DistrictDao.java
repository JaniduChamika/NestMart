/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.District;
import com.jiat.nestmart.util.JPAUtill;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class DistrictDao {
    private EntityManager em;

    public DistrictDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public District getDistrictById(int id) {
        return em.find(District.class, id);

    }

    public List<District> getAllDistrict() {
        try {
            TypedQuery<District> query = em.createQuery("SELECT d FROM District d", District.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    
}

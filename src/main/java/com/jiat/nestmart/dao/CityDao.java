/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.District;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.util.JPAUtill;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class CityDao {

    private EntityManager em;

    public CityDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public City getCityById(int id) {
        return em.find(City.class, id);

    }

    public List<City> getAllCity() {
        try {
            TypedQuery<City> query = em.createQuery("SELECT u FROM City u", City.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    
}

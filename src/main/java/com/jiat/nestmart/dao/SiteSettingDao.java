/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.Province;
import com.jiat.nestmart.entity.SiteSetting;
import com.jiat.nestmart.util.JPAUtill;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class SiteSettingDao {

    private EntityManager em;

    public SiteSettingDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public Province getProvinceById(int id) {
        return em.find(Province.class, id);

    }

    public List<SiteSetting> getAllSettings() {
        try {
            TypedQuery<SiteSetting> query = em.createQuery("SELECT s FROM SiteSetting s", SiteSetting.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public SiteSetting getSettingsByName(String name) {
        try {
            TypedQuery<SiteSetting> query = em.createQuery("SELECT s FROM SiteSetting s WHERE s.name = :name", SiteSetting.class);
            query.setParameter("name", name);
            return query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

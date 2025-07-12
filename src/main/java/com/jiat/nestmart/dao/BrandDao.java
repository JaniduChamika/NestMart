/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.Brand;
import com.jiat.nestmart.util.JPAUtill;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class BrandDao {
     private EntityManager em;

    public BrandDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public void createBrand(Brand brand) {
        try {
            if (brand.getCreatedAt() == null) {
                brand.setCreatedAt(new Date());
            }
            em.getTransaction().begin();
            em.persist(brand);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public Brand getBrandById(int id) {
        return em.find(Brand.class, id);
    }

    public void updateBrand(Brand brand) {

        try {
            em.getTransaction().begin();
            em.merge(brand);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void deleteBrand(int id) {

        try {
            em.getTransaction().begin();
            Brand brand = em.find(Brand.class, id);
            if (brand != null) {
                em.remove(brand);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }

    }

    public List<Brand> getAllBrand() {
        try {
            TypedQuery<Brand> query = em.createQuery("SELECT b FROM Brand b", Brand.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }
}

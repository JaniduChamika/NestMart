/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.Category;
import com.jiat.nestmart.entity.SubCategory;
import com.jiat.nestmart.util.JPAUtill;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class SubCategoryDao {

    private EntityManager em;

    public SubCategoryDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public void createSubCategory(SubCategory subCategory) {
        try {
            if (subCategory.getCreatedAt() == null) {
                subCategory.setCreatedAt(new Date());
            }
            em.getTransaction().begin();
            em.persist(subCategory);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public SubCategory getSubCategoryById(int id) {
        return em.find(SubCategory.class, id);
    }

    public void updateSubCategory(SubCategory subCategory) {

        try {
            em.getTransaction().begin();
            em.merge(subCategory);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void deleteSubCategory(int id) {

        try {
            em.getTransaction().begin();
            SubCategory subCategory = em.find(SubCategory.class, id);
            if (subCategory != null) {
                em.remove(subCategory);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }

    }

    public List<SubCategory> getAllSubCategory() {
        try {
            TypedQuery<SubCategory> query = em.createQuery("SELECT c FROM SubCategory c", SubCategory.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public List<SubCategory> getSubCategory(Category category) {
        try {
            TypedQuery<SubCategory> query = em.createQuery("SELECT c FROM SubCategory c WHERE c.category = :category", SubCategory.class);
            query.setParameter("category", category);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }
}

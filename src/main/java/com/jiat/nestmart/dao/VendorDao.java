/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.nestmart.util.Status;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class VendorDao {

    private EntityManager em;

    public VendorDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public void createVendor(Vendor vendor) {
        try {
            if (vendor.getCreatedAt() == null) {
                vendor.setCreatedAt(new Date());
            }
            vendor.setStatus(Status.inactive);
            em.getTransaction().begin();
            em.persist(vendor);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public Optional<Vendor> getVendorByEmail(String email) {
        TypedQuery<Vendor> query = em.createQuery("SELECT u FROM Vendor u WHERE u.business_email = :email", Vendor.class);
        query.setParameter("email", email);

        try {
            return Optional.of(query.getSingleResult());
        } catch (Exception e) {
//            e.printStackTrace();

            return Optional.empty();
        }

    }

    public Vendor getVendorById(int id) {
        return em.find(Vendor.class, id);
    }

    public void updateVendor(Vendor vendor) {

        try {
            em.getTransaction().begin();
            em.merge(vendor);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void deleteVendor(int id) {

        try {
            em.getTransaction().begin();
            Vendor vendor = em.find(Vendor.class, id);
            if (vendor != null) {
                em.remove(vendor);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }

    }

    public List<Vendor> getAllVendors() {

        try {
            TypedQuery<Vendor> query = em.createQuery("SELECT u FROM Vendor u", Vendor.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public Vendor getVendorByUser(User user) {
        try {
            TypedQuery<Vendor> query = em.createQuery(
                    "SELECT v FROM Vendor v WHERE v.user = :user", Vendor.class);
            query.setParameter("user", user);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null; // No vendor exists for this user
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Handle other unexpected errors
        }
    }

    public List<Vendor> getVendorsByStatus(Status status) {
        TypedQuery<Vendor> query = em.createQuery(
                "SELECT v FROM Vendor v WHERE v.status = :status",
                Vendor.class
        );
        query.setParameter("status", status);

        try {
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public boolean checkVendorStatus(User user, Status status) {
        TypedQuery<Vendor> query = em.createQuery(
                "SELECT v FROM Vendor v WHERE v.user = :user AND v.status = :status",
                Vendor.class
        );
        query.setParameter("user", user);
        query.setParameter("status", status);

        try {
            Vendor vendor = query.getSingleResult();
            return vendor != null; // True if vendor exists with the given status
        } catch (Exception e) {
            return false; // False if no match or error occurs
        }
    }

}

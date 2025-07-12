/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Wishlist;
import com.jiat.nestmart.util.JPAUtill;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class WishlistDao {

    private EntityManager em;

    public WishlistDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public Wishlist addToWishlist(User user, Product product) {
        try {
            Wishlist wishlist = new Wishlist();
            wishlist.setUser(user);
            wishlist.setProduct(product);
            em.getTransaction().begin();
            em.persist(wishlist);
            em.getTransaction().commit();
            return wishlist;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
    }

    // Remove a product from wishlist
    public void removeFromWishlist(User user, Product product) {
        try {
            em.getTransaction().begin();
            TypedQuery<Wishlist> query = em.createQuery(
                    "SELECT w FROM Wishlist w WHERE w.user = :user AND w.product = :product", Wishlist.class);
            query.setParameter("user", user);
            query.setParameter("product", product);
            Wishlist wishlist = query.getSingleResult();
            if (wishlist != null) {
                em.remove(wishlist);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Get wishlist by ID
    public Wishlist getWishlistById(int id) {
        return em.find(Wishlist.class, id);
    }

    // Get all wishlist items for a user
    public List<Wishlist> getWishlistByUser(User user) {
        try {
            TypedQuery<Wishlist> query = em.createQuery(
                    "SELECT w FROM Wishlist w WHERE w.user = :user", Wishlist.class);
            query.setParameter("user", user);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    // Check if a product is in the user's wishlist
    public boolean isProductInWishlist(User user, Product product) {
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(w) FROM Wishlist w WHERE w.user = :user AND w.product = :product", Long.class);
            query.setParameter("user", user);
            query.setParameter("product", product);
            return query.getSingleResult() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete all wishlist items for a user
    public void deleteWishlistByUser(User user) {
        try {
            em.getTransaction().begin();
            TypedQuery<Wishlist> query = em.createQuery(
                    "SELECT w FROM Wishlist w WHERE w.user = :user", Wishlist.class);
            query.setParameter("user", user);
            List<Wishlist> wishlists = query.getResultList();
            for (Wishlist wishlist : wishlists) {
                em.remove(wishlist);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}

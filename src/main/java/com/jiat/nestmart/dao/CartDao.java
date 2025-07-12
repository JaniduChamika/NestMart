/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.Cart;
import com.jiat.nestmart.entity.CartItem;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.util.JPAUtill;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class CartDao {

    private EntityManager em;

    public CartDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public Cart createCart(User user) {
        try {
            Cart cart = new Cart(user);
            if (cart.getCreatedAt() == null) {
                cart.setCreatedAt(new Date());
            }
            em.getTransaction().begin();
            em.persist(cart);
            em.getTransaction().commit();
            return cart;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
    }

    // Get cart by ID
    public Cart getCartById(int id) {
        return em.find(Cart.class, id);
    }

    // Update cart (e.g., add/remove items)
    public void updateCart(Cart cart) {
        try {
            em.getTransaction().begin();
            cart.setUpdatedAt(new Date());
            em.merge(cart);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Delete cart
    public void deleteCart(int id) {
        try {
            em.getTransaction().begin();
            Cart cart = em.find(Cart.class, id);
            if (cart != null) {
                em.remove(cart);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Get all carts
    public List<Cart> getAllCarts() {
        try {
            TypedQuery<Cart> query = em.createQuery("SELECT c FROM Cart c", Cart.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }
    // Get cart by user ID

    public Cart getCartByUser(User user) {
        try {
            TypedQuery<Cart> query = em.createQuery(
                    "SELECT c FROM Cart c WHERE c.user=:user", Cart.class);
            query.setParameter("user", user);

            return query.getSingleResult();
        } catch (NoResultException e) {
            return null; // No vendor exists for this user
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Return null if no cart exists
        }
    }

    public void updateCartItem(CartItem item) {
        try {
            em.getTransaction().begin();
            em.merge(item);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void removeCartItem(CartItem item) {
        try {
            em.getTransaction().begin();
            em.remove(item);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

}

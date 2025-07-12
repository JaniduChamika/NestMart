/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.Order;
import com.jiat.nestmart.entity.OrderAddress;
import com.jiat.nestmart.entity.OrderItem;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.nestmart.util.OrderStatus;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class OrderDao {

    private EntityManager em;

    public OrderDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    // Create a new order
    public Order createOrder(Order order) {
        try {
            em.getTransaction().begin();
            em.persist(order);
            em.getTransaction().commit();
            return order;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
    }

    // Get order by ID
    public Order getOrderById(int id) {
        return em.find(Order.class, id);
    }

    // Get orders by user
    public List<Order> getOrdersByUser(User user) {
        try {
            TypedQuery<Order> query = em.createQuery(
                    "SELECT o FROM Order o WHERE o.user = :user", Order.class);
            query.setParameter("user", user);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    // Delete order
    public void deleteOrder(int id) {
        try {
            em.getTransaction().begin();
            Order order = em.find(Order.class, id);
            if (order != null) {
                em.remove(order);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
    // Update order item status

    public void updateOrderItemStatus(int itemId, OrderStatus status) {
        try {
            em.getTransaction().begin();
            OrderItem item = em.find(OrderItem.class, itemId);
            if (item != null) {
                item.setStatus(status);
                em.merge(item);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public OrderAddress saveOrderAddress(OrderAddress address) {
        try {
            em.getTransaction().begin();
            if (address.getId() == 0) {
                em.persist(address);
            } else {
                em.merge(address);
            }
            em.getTransaction().commit();
            return address;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
    }

    // Get address by ID
    public OrderAddress getOrderAddressById(int id) {
        return em.find(OrderAddress.class, id);
    }

    public OrderAddress findExistingOrderAddress(String addressNo, String addressLine1, String addressLine2, City city) {
        try {
            TypedQuery<OrderAddress> query = em.createQuery(
                    "SELECT oa FROM OrderAddress oa "
                    + "WHERE oa.addressNo = :addressNo "
                    + "AND oa.addressLine1 = :addressLine1 "
                    + "AND (oa.addressLine2 = :addressLine2 OR (oa.addressLine2 IS NULL AND :addressLine2 IS NULL)) "
                    + "AND oa.city = :city", OrderAddress.class);

            query.setParameter("addressNo", addressNo);
            query.setParameter("addressLine1", addressLine1);
            query.setParameter("addressLine2", addressLine2); // Handles null comparison
            query.setParameter("city", city);

            return query.getSingleResult(); // Returns the matching OrderAddress or throws NoResultException
        } catch (NoResultException e) {
            return null; // No matching address found
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public OrderItem getOrderItemById(int id) {
        try {
            return em.find(OrderItem.class, id);

        } catch (Exception e) {
            e.printStackTrace();
            return null; // Return empty list on error
        }
    }

    public List<OrderItem> getOrderItemsByVendor(Vendor vendor) {
        try {
            TypedQuery<OrderItem> query = em.createQuery(
                    "SELECT oi FROM OrderItem oi "
                    + "JOIN oi.product p "
                    + "WHERE p.vendor = :vendor",
                    OrderItem.class);
            query.setParameter("vendor", vendor);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return empty list on error
        }
    }

    public List<OrderItem> getOrderItemsByVendor(Vendor vendor, OrderStatus orderStatus) {
        try {
            TypedQuery<OrderItem> query = em.createQuery(
                    "SELECT oi FROM OrderItem oi "
                    + "JOIN oi.product p "
                    + "JOIN oi.order o "
                    + "WHERE p.vendor = :vendor AND oi.status = :status",
                    OrderItem.class);
            query.setParameter("vendor", vendor);
            query.setParameter("status", orderStatus);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return empty list on error
        }
    }

}

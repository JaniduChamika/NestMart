/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.service;

import com.jiat.nestmart.dao.OrderDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.entity.Cart;
import com.jiat.nestmart.entity.CartItem;
import com.jiat.nestmart.entity.City;
import com.jiat.nestmart.entity.Order;
import com.jiat.nestmart.entity.OrderAddress;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.nestmart.util.PaymentMethod;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author ROG STRIX
 */
public class OrderService {

    private OrderDao orderDao = new OrderDao();
    ProductDao productdao = new ProductDao();
    private EntityManager em = JPAUtill.getEntityManagerFactory().createEntityManager();

    public Order placeCartOrder(User user, Cart cart, String addressNo, String addressLine1, String addressLine2, City city, PaymentMethod method) {
        EntityTransaction transaction = em.getTransaction();
        try {

            transaction.begin();
            OrderAddress orderAddress = orderDao.findExistingOrderAddress(addressNo, addressLine1, addressLine2, city);
            if (orderAddress == null) {
                // Create new address if no match found
                orderAddress = new OrderAddress();
                orderAddress.setAddressNo(addressNo);
                orderAddress.setAddressLine1(addressLine1);
                orderAddress.setAddressLine2(addressLine2);
                orderAddress.setCity(city);
                orderAddress = orderDao.saveOrderAddress(orderAddress);
            }

            Order order = new Order(user, orderAddress, method);

            // Convert CartItems to OrderItems
            for (CartItem cartItem : cart.getCartItems()) {
                Product product = cartItem.getProduct();
                int quantity = cartItem.getQuantity();
                product.setStockQuantity(product.getStockQuantity() - quantity);
                productdao.updateProduct(product);
                order.addOrderItem(product, quantity);

            }
            orderDao.createOrder(order);
            transaction.commit();
              return order;
        } catch (Exception e) {
            e.printStackTrace();
                 return null;
        }
    }

    public Order placeProductOrder(User user, Product product, int qty, String addressNo, String addressLine1, String addressLine2, City city, PaymentMethod method) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Check for existing address
            OrderAddress orderAddress = orderDao.findExistingOrderAddress(addressNo, addressLine1, addressLine2, city);
            if (orderAddress == null) {
                // Create new address if no match found
                orderAddress = new OrderAddress();
                orderAddress.setAddressNo(addressNo);
                orderAddress.setAddressLine1(addressLine1);
                orderAddress.setAddressLine2(addressLine2);
                orderAddress.setCity(city);
                orderAddress = orderDao.saveOrderAddress(orderAddress);
            }

            Order order = new Order(user, orderAddress, method);
            product.setStockQuantity(product.getStockQuantity() - qty);
            productdao.updateProduct(product);
            // Convert CartItems to OrderItems
            order.addOrderItem(product, qty);

            orderDao.createOrder(order);
            transaction.commit();
            return order;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Order> getOrdersByUser(User user) {
        // Delegate the retrieval to the DAO layer
        return orderDao.getOrdersByUser(user);
    }

}

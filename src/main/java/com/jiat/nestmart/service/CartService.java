/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.service;

import com.jiat.nestmart.dao.CartDao;
import com.jiat.nestmart.dao.ProductDao;
import com.jiat.nestmart.entity.Cart;
import com.jiat.nestmart.entity.CartItem;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.User;
import java.util.List;

/**
 *
 * @author ROG STRIX
 */
public class CartService {

    CartDao cartdao = new CartDao();

    public void addItemToCart(User user, Product product, int quantity) {
        try {

            // Find or create cart for the user
            Cart cart = cartdao.getCartByUser(user);
            if (cart == null) {
                cart = cartdao.createCart(user);

            }
            List<CartItem> items = cart.getCartItems();

            for (CartItem item : items) {
                if (item.getProduct().getId() == product.getId()) {

                    item.setQuantity(item.getQuantity() + quantity);
                    cartdao.updateCartItem(item);
                    System.out.println("updated");
                    return;
                }
            }

            CartItem item = new CartItem(cart, product, quantity);
            items.add(item);
            cart.setCartItems(items);
            cartdao.updateCart(cart);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isItemAlreadyExist(User user, Product product) {
        Cart cart = cartdao.getCartByUser(user);
        if (cart == null) {
            return false;
        } else {
            List<CartItem> items = cart.getCartItems();
            for (CartItem item : items) {
                if (item.getProduct().getId() == product.getId()) {
                    return true;
                }
            }
            return false;
        }
    }

    // Remove item from cart
    public void removeItemFromCart(User user, Product product) {
        try {

            // Find or create cart for the user
            Cart cart = cartdao.getCartByUser(user);
            if (cart != null) {

                List<CartItem> items = cart.getCartItems();
                for (CartItem item : items) {
                    if (item.getProduct().getId() == product.getId()) {
                        items.remove(item);
                        cartdao.removeCartItem(item);
                        return;
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  

    public void updateItemQty(User user, Product product, int quantity) {
        try {
            Cart cart = cartdao.getCartByUser(user);

            if (cart != null) {
                List<CartItem> items = cart.getCartItems();
                for (CartItem item : items) {
                    if (item.getProduct().getId() == product.getId()) {
                        item.setQuantity(quantity);
                        cartdao.updateCartItem(item);
                        return;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double getCartTotal(User user) {
        double total = 0;
        try {
            Cart cart = cartdao.getCartByUser(user);

            if (cart != null) {
                List<CartItem> items = cart.getCartItems();
                for (CartItem item : items) {
                    total = total + item.getProduct().getPrice() * item.getQuantity();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
}

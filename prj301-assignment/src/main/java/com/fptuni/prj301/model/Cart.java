/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.fptuni.prj301.model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LucasBV
 */
public class Cart {
    private Map<Integer, Product> cart;

    public Cart() {
        cart = new HashMap<>();
    }

    public Cart(Map<Integer, Product> cart) {
        this.cart = cart;
    }

    public Map<Integer,Product> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, Product> cart) {
        this.cart = cart;
    }

    public void add(Product pro) {
        if (this.cart == null) {
            this.cart = new HashMap<>();                       
        }
        if (this.cart.containsKey(pro.getProductID())) {
            int currentQuantity = this.cart.get(pro.getProductID()).getQuantity();
            pro.setQuantity(currentQuantity + pro.getQuantity());
        }
        cart.put(pro.getProductID(), pro);
    }

    public void delete(int id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(int id, Product newPro) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newPro);
        }
    }
}

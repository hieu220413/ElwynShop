/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.fptuni.prj301.model;

/**
 *
 * @author LucasBV
 */
public class OrderDetails {
    private Order orderID;
    private Product productID;

    public Order getOrderID() {
        return orderID;
    }

    public void setOrderID(Order orderID) {
        this.orderID = orderID;
    }

    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    public OrderDetails(Order orderID, Product productID) {
        this.orderID = orderID;
        this.productID = productID;
    }


    
}

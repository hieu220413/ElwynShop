/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.fptuni.prj301.model;

import java.util.Date;

/**
 *
 * @author LucasBV
 */
public class Product {
    //product_ID,category_ID,gender,price,short_details,long_details,images_path,publish_date,quantity,name
    private int productID;
    private String gender;
    private int price;
    private String shortDetails;
    private String longDetails;
    private String imagesPath;
    private Date publishDate;
    private int quantity;
    private String name;
    private Category category;

    public Product() {
    }

    public Product(int productID, String gender, int price, String shortDetails, String longDetails, String imagesPath, Date publishDate, int quantity, String name, Category category) {
        this.productID = productID;
        this.gender = gender;
        this.price = price;
        this.shortDetails = shortDetails;
        this.longDetails = longDetails;
        this.imagesPath = imagesPath;
        this.publishDate = publishDate;
        this.quantity = quantity;
        this.name = name;
        this.category = category;
    }
    
    public Product(int productID,int price, String shortDetails, String longDetails, String imagesPath, int quantity, String name) {
        this.productID = productID;
        this.price = price;
        this.shortDetails = shortDetails;
        this.longDetails = longDetails;
        this.imagesPath = imagesPath;
        this.quantity = quantity;
        this.name = name;
    } 

    public Product(int price, String shortDetails, String longDetails, String imagesPath, int quantity, String name) {
        this.price = price;
        this.shortDetails = shortDetails;
        this.longDetails = longDetails;
        this.imagesPath = imagesPath;
        this.quantity = quantity;
        this.name = name;
    }        

    public Product(int productID, String name, int price, String imagesPath, int quantity) {
        this.productID = productID;
        this.price = price;
        this.name= name;
        this.imagesPath = imagesPath;
        this.quantity = quantity;
        
    }



    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getShortDetails() {
        return shortDetails;
    }

    public void setShortDetails(String shortDetails) {
        this.shortDetails = shortDetails;
    }

    public String getLongDetails() {
        return longDetails;
    }

    public void setLongDetails(String longDetails) {
        this.longDetails = longDetails;
    }

    public String getImagesPath() {
        return imagesPath;
    }

    public void setImagesPath(String imagesPath) {
        this.imagesPath = imagesPath;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    
    
}
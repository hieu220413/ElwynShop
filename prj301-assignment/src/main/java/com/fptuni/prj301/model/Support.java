/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuni.prj301.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LucasBV
 */
public class Support {

    private int supportId;
    private int adminId;
    private int userId;
    private String details;
    private Date dates;
    private User user;

    public Support() {
    }

    public Support(int adminId, int userId, String details, Date dates) {
        this.adminId = adminId;
        this.userId = userId;
        this.details = details;
        this.dates = dates;
    }

    public Support(int supportId, int adminId, int userId, String details, Date dates, User user) {
        this.supportId = supportId;
        this.adminId = adminId;
        this.userId = userId;
        this.details = details;
        this.dates = dates;
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getSupportId() {
        return supportId;
    }

    public void setSupportId(int supportId) {
        this.supportId = supportId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getDates() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String date = sdf.format(dates);
        return date;
//        return dates;
    }

    public void setDates(Date dates) {
        this.dates = dates;
    }

}

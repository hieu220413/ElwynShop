/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuni.prj301.dbmanager;

import com.fptuni.prj301.model.Category;
import com.fptuni.prj301.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LucasBV
 */
public class CategoryManager {

    public Category load(String name) {
        Category category = null;
        List<Category> list = new ArrayList<>();
        String sql = "select category_ID,name from Category where name = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category = new Category(rs.getInt("category_ID"), rs.getString("name"));
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return category;
    }

    public List<Category> list() {
        List<Category> list = new ArrayList<>();
        String sql = "select category_ID,name from Category";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("category_ID"), rs.getString("name")));
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return list;
    }

    public String ConvertStringtoName(String message) {
        char[] charArray = message.toCharArray();
        boolean f = true;
        //sử dụng vòng lặp for để duyệt các phần tử trong charArray
        for (int i = 0; i < charArray.length; i++) {
            // nếu phần tử trong mảng là một chữ cái
            if (Character.isLetter(charArray[i])) {
                // kiểm tra khoảng trắng có trước chữ cái
                if (f) {
                    //đổi chữ cái thành chữ in hoa bằng phương thức toUpperCase()
                    charArray[i] = Character.toUpperCase(charArray[i]);
                    f = false;
                }
            } else {
                f = true;
            }
        }
        // chuyển đổi mảng char thành string
        message = String.valueOf(charArray);
        return message;
    }
}

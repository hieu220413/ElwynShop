/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuni.prj301.dbmanager;

import com.fptuni.prj301.model.Category;
import com.fptuni.prj301.model.Order;
import com.fptuni.prj301.model.Product;
import com.fptuni.prj301.model.User;
import com.fptuni.prj301.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

/**
 *
 * @author LucasBV
 */
public class OrderManager {

    public List<Order> list() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method \n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Boolean Payment(int accid, HashMap<String, Integer> cart, String paymethod, int total) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                int orderid = 0;
                cn.setAutoCommit(false);

                Date d = new Date(System.currentTimeMillis());
                String sql = "insert Orders( user_ID, date, "
                        + " total_amount, payment_method) values(?,?,?,?)";
                PreparedStatement ps = cn.prepareStatement(sql);

                ps = cn.prepareStatement(sql);
                ps.setInt(1, 1);
                ps.setDate(2, d);
                ps.setInt(3, total);
                ps.setString(4, paymethod);

                ps.executeUpdate();

                sql = "select top 1 order_ID from Orders order by order_ID desc";
                ps = cn.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("order_ID");
                }
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert Order_product values(?,?,?)";
                    ps = cn.prepareStatement(sql);
                    ps.setInt(1, orderid);
                    ps.setInt(2, Integer.parseInt(pid));
                    ps.setInt(3, cart.get(pid));

                    ps.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }

                for (String pid : pids) {
                    sql = "UPDATE Product\n"
                            + "SET quantity = quantity - ?\n"
                            + "WHERE product_ID = ?";
                    ps = cn.prepareStatement(sql);
                    ps.setInt(1, cart.get(pid));
                    ps.setInt(2, Integer.parseInt(pid));

                    ps.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;

    }

    public ArrayList<Order> paging(int indexPage) {
        ArrayList<Order> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method \n"
                        + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                        + "WHERE Users.user_ID = Orders.user_ID \n"
                        + "ORDER BY order_ID\n"
                        + "OFFSET ? ROWS FETCH NEXT 5 ROW ONLY";
                ps = con.prepareStatement(sql);
                /*
                page 1: offset = 0
                page 2: offset = 5
                page 3: offset = 10
                 */
                ps.setInt(1, (indexPage - 1) * 5);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Order(rs.getInt("order_ID"),
                            new User(rs.getInt("user_ID"), rs.getString("username")),
                            rs.getDate("date"),
                            rs.getInt("total_amount"),
                            rs.getString("payment_method")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Order> search(String username) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method\n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID and Users.username like ? ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> sortAmount(String sortOrderType, int page) {
        sortOrderType = sortOrderType.toUpperCase();
        if (!sortOrderType.equals("ASC") && !sortOrderType.equals("DESC")) {
            return null;
        }
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method\n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID \n"
                + "ORDER BY total_amount " + sortOrderType + "\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROW ONLY";;
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ((page - 1) * 5));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> sortDate(String sortOrderType, int page) {
        sortOrderType = sortOrderType.toUpperCase();
        if (!sortOrderType.equals("ASC") && !sortOrderType.equals("DESC")) {
            return null;
        }
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method\n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID\n"
                + "ORDER BY date " + sortOrderType + "\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROW ONLY";;
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ((page - 1) * 5));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> searchDate(Date date) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method\n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID and date = ? ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> listMonth(int month) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method\n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID AND MONTH(date) = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> listYear(int year) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT order_ID,Orders.user_ID,Users.username,date,total_amount,payment_method\n"
                + "FROM Orders,(SELECT user_ID,username FROM Users) as Users\n"
                + "WHERE Users.user_ID = Orders.user_ID AND YEAR(date) = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, year);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_ID"),
                        new User(rs.getInt("user_ID"), rs.getString("username")),
                        rs.getDate("date"),
                        rs.getInt("total_amount"),
                        rs.getString("payment_method")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> listProduct(int orderId) {
        List<Product> list = new ArrayList<>();
        String sql = "Select order_ID,p.*, Order_product.quantity AS quantity_order \n"
                + "from Order_product,(select product_ID,Product.category_ID,TEMPORARY.category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,name\n"
                + "from Product,(select category_ID,name AS category_name from Category) as TEMPORARY\n"
                + "WHERE TEMPORARY.category_ID = Product.category_ID) as p\n"
                + "WHERE Order_product.product_ID = p.product_ID AND Order_product.order_ID = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                        rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                        rs.getDate("publish_date"), rs.getInt("quantity_order"), rs.getString("name"),
                        new Category(rs.getInt("category_ID"), rs.getString("category_name"))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuni.prj301.dbmanager;

import com.fptuni.prj301.model.Product;
import com.fptuni.prj301.model.Support;
import com.fptuni.prj301.model.User;
import com.fptuni.prj301.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LucasBV
 */
public class UserManager {

    public List<User> list() {

        ArrayList<User> list = new ArrayList<>();

        String sql = "select user_ID, username, password, phone, name, email from Users";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt("user_ID"), rs.getString("name"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("phone")));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public User login(String username, String password) {
        if ((username == null) || (username.equalsIgnoreCase(""))) {
            return null;
        }
        String sql = "select username, password from Users";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (username.equalsIgnoreCase(rs.getString("username")) && password.equalsIgnoreCase(rs.getString("password"))) {
                    User us = new User();
                    us.setUsername(username);
                    us.setPassword(password);
                    return us;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User loginAdmin(String username, String password) {
        if ((username == null) || (username.equalsIgnoreCase(""))) {
            return null;
        }
        String sql = "select username, password from Admin";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (username.equalsIgnoreCase(rs.getString("username")) && password.equalsIgnoreCase(rs.getString("password"))) {
                    User us = new User();
                    us.setUsername(username);
                    us.setPassword(password);
                    return us;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean insert(User user) {
        if (user == null) {
            return false;
        }
        int id = lastStudentId() + 1;
        String sql = "INSERT INTO Users ( user_ID , username ,password ,phone ,email) VALUES  ( ? , ? , ? , ? , ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getEmail());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private int lastStudentId() {
        String sqlID = "SELECT TOP 1 * FROM Users ORDER BY user_ID DESC";
        int lastId = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int lastid = rs.getInt("user_ID");
                lastId = Integer.valueOf(lastid);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lastId;
    }

    public User load(String username) {
        String sql = "select user_ID, username, password, phone, name, email from Users where username = ?";
        User user = null;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();

                user.setUserId(rs.getInt("user_ID"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }
    
    public void Update(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Users\n"
                        + " SET username = ?,\n"
                        + " name=?,\n"
                        + " phone =?,\n"
                        + " email=?\n"
                        + " WHERE username like ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getName());
                ps.setString(3, user.getPhone());            
                ps.setString(4, user.getEmail());
                ps.setString(5, user.getUsername());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
        }
    }

    public void UpdatePassword(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Users\n"
                        + " SET password = ?\n"
                        + " WHERE username like ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, user.getPassword());
                ps.setString(2, user.getUsername());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
        }
    }
    
    public boolean isAdmin(String username, String password) throws SQLException {
        boolean isAdmin = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT admin_ID FROM Admin\n"
                        + " WHERE username LIKE ? AND password = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    isAdmin = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return isAdmin;
    }

    public List<User> getListUser(String keyword) throws SQLException {
        List<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                String sql = "  SELECT user_ID, username, password, phone, name, email \n"
                        + " FROM Users\n"
                        + " WHERE username LIKE ? OR phone LIKE ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + keyword + "%");
                ps.setString(2, "%" + keyword + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    int userID = rs.getInt("user_ID");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    User user = new User(userID, name, username, password, email, phone);
                    list.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return list;
    }

    public User getUser(int userID) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT user_ID, username, password, phone, name, email \n"
                        + "    FROM Users\n"
                        + "    WHERE user_ID = ? ";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, userID);

                rs = ps.executeQuery();
                if (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    user = new User(userID, name, username, password, email, phone);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return user;
    }

    public void editUser(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Users\n"
                        + " SET username = ?,\n"
                        + " password = ?,\n"
                        + " phone =?,\n"
                        + " name=?,\n"
                        + " email=?\n"
                        + " WHERE user_ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getPhone());
                ps.setString(4, user.getName());
                ps.setString(5, user.getEmail());
                ps.setInt(6, user.getUserId());

                ps.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
        }
    }

    public boolean removeUser(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM Users\n"
                        + " WHERE user_ID = ?";
                ps = conn.prepareStatement(sql);

                ps.setInt(1, id);

                ps.executeUpdate();
                removed = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
        }
        return removed;
    }

    public int countTotalUser() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(user_ID) FROM Users";

                ps = conn.prepareStatement(sql);

                rs = ps.executeQuery();
                if (rs.next()) {
                    total = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return total;
    }

    public ArrayList<User> pagingUser(int indexPage, String search) throws Exception {
        ArrayList<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT user_ID, username, password, phone, name, email FROM Users\n"
                        + " WHERE username LIKE ? OR phone LIKE ? \n"
                        + " ORDER BY user_ID ASC\n"
                        + " OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
                ps = conn.prepareStatement(sql);
                /*
                page 1: offset = 0
                page 2: offset = 5
                page 3: offset = 10
                 */
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");
                
                ps.setInt(3, (indexPage - 1) * 5);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int userID = rs.getInt("user_ID");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    User user = new User(userID, name, username, password, email, phone);
                    list.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return list;
    }
}

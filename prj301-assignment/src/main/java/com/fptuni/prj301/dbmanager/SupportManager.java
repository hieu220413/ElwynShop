/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuni.prj301.dbmanager;

import com.fptuni.prj301.model.Support;
import com.fptuni.prj301.model.User;
import com.fptuni.prj301.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LucasBV
 */
public class SupportManager {

    public List<Support> getListSupport(String search) throws SQLException {
        List<Support> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
//                String sql = "  SELECT s.support_ID, s.user_ID, s.details, s.admin_ID, s.dates, u.username, u.[password], u.email, u.name, u.phone\n"
//                        + " FROM Support s\n"
//                        + " JOIN Users u ON u.user_ID = s.user_ID";

                String sql = "SELECT s.support_ID, s.user_ID, s.details, s.admin_ID, s.dates, u.username, u.[password], u.email, u.name, u.phone\n"
                        + "FROM Support s\n"
                        + "JOIN Users u ON u.user_ID = s.user_ID\n"
                        + "WHERE u.name LIKE ? OR phone LIKE ? ";

                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");

                rs = ps.executeQuery();
                while (rs.next()) {
                    int supportID = rs.getInt("support_ID");
                    int userID = rs.getInt("user_ID");
                    String details = rs.getString("details");
                    int admin_ID = rs.getInt("admin_ID");
                    Date date = rs.getDate("dates");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");

                    User user = new User(userID, name, username, password, email, phone);
                    Support support = new Support(supportID, admin_ID, userID, details, date, user);
                    list.add(support);
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

    public List<Support> searchSupport(String search) throws SQLException {
        List<Support> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT s.support_ID, s.user_ID, s.details, s.admin_ID, s.dates, u.username, u.[password], u.email, u.name, u.phone\n"
                        + "FROM Support s\n"
                        + "JOIN Users u ON u.user_ID = s.user_ID\n"
                        + "WHERE u.name LIKE  OR phone LIKE ? ";

                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");

                rs = ps.executeQuery();
                while (rs.next()) {
                    int supportID = rs.getInt("support_ID");
                    int userID = rs.getInt("user_ID");
                    String details = rs.getString("details");
                    int admin_ID = rs.getInt("admin_ID");
                    Date date = rs.getDate("dates");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");

                    User user = new User(userID, name, username, password, email, phone);
                    Support support = new Support(supportID, admin_ID, userID, details, date, user);
                    list.add(support);
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

    public int countTotalSupport() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT COUNT(support_ID) FROM Support";

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

    public ArrayList<Support> pagingSupport(int indexPage, String search, String sort) throws Exception {
        ArrayList<Support> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT s.support_ID, s.user_ID, s.details, s.admin_ID, s.dates, u.username, u.[password], u.email, u.name, u.phone\n"
                        + " FROM Support s\n"
                        + " JOIN Users u ON u.user_ID = s.user_ID\n"
                        + " WHERE u.name LIKE ? OR phone LIKE ? \n";
                //                     + " ORDER BY s.support_ID\n"
                //                        + " OFFSET ? ROWS FETCH NEXT 5 ROW ONLY";

                if (sort == null) {
                    sql += " ORDER BY s.support_ID\n";
                } else {
                    if (sort.equals("")) {
                        sql += " ORDER BY s.support_ID\n";
                    } else if (sort.equals("desc")) {
                        sql += " ORDER BY dates DESC ";
                    } else if (sort.equals("asc")) {
                        sql += " ORDER BY dates ASC ";
                    }
                }

                sql += " OFFSET ? ROWS FETCH NEXT 5 ROW ONLY";
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
                    int supportID = rs.getInt("support_ID");
                    int userID = rs.getInt("user_ID");
                    String details = rs.getString("details");
                    int admin_ID = rs.getInt("admin_ID");
                    Date date = rs.getDate("dates");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");

                    User user = new User(userID, name, username, password, email, phone);
                    Support support = new Support(supportID, admin_ID, userID, details, date, user);
                    list.add(support);
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

    public void removeSupport(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM Support\n"
                        + " WHERE support_ID = ?";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();

        }
    }

    public boolean insert(Support support) {
        if (support == null) {
            return false;
        }
        int id = lastSupportId() + 1;
        String sql = "insert into Support(support_ID,admin_ID,user_ID,details,dates)"
                + " values (?,?,?,?,?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, support.getAdminId());
            ps.setInt(3, support.getUserId());
            ps.setString(4, support.getDetails());
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date date = sdf.parse(support.getDates());
            java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
            ps.setDate(5, sqlStartDate);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    private int lastSupportId() {
        String sqlID = "SELECT TOP 1 * FROM Support ORDER BY support_ID DESC";
        int lastId = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int lastid = rs.getInt("support_ID");
                lastId = lastid;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lastId;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuni.prj301.dbmanager;

import com.fptuni.prj301.model.Category;
import com.fptuni.prj301.model.Product;
import com.fptuni.prj301.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LucasBV
 */
public class ProductManager {

    public List<Product> search(String i) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details,p.long_details "
                + "from Product p join Category c "
                + "on p.category_ID = c.category_ID "
                + "where p.name like ? ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + i + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public List<Product> list() {
        ArrayList<Product> list = new ArrayList<Product>();

        String sql = "select product_ID,Product.category_ID,TEMPORARY.category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,name"
                + " from Product,(select category_ID,name AS category_name from Category) as TEMPORARY"
                + " WHERE TEMPORARY.category_ID = Product.category_ID";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                        rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                        rs.getDate("publish_date"), rs.getInt("quantity"), rs.getString("name"),
                        new Category(rs.getInt("category_ID"), rs.getString("category_name"))));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public boolean insert(Product product) {
        String sql = "insert into Product(product_ID,category_ID,gender,price,short_details,long_details,images_path,publish_date,quantity,name)"
                + " values (?,?,?,?,?,?,?,?,?,?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, product.getProductID());
            ps.setInt(2, product.getCategory().getCategoryID());
            ps.setString(3, product.getGender());
            ps.setInt(4, product.getPrice());
            ps.setString(5, product.getShortDetails());
            ps.setString(6, product.getLongDetails());
            ps.setString(7, product.getImagesPath());
            ps.setDate(8, (Date) product.getPublishDate());
            ps.setInt(9, product.getQuantity());
            ps.setString(10, product.getName());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public boolean delete(int id) {
        String sql = "delete from Product where product_ID = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public boolean update(Product product) {
        String sql = "update Product"
                + " set category_ID = ? , gender = ? ,price = ? , short_details = ? ,"
                + " long_details = ? , images_path = ? , publish_date = ? , quantity = ? , name = ?"
                + " where product_ID = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, product.getCategory().getCategoryID());
            ps.setString(2, product.getGender());
            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getShortDetails());
            ps.setString(5, product.getLongDetails());
            ps.setString(6, product.getImagesPath());
            ps.setDate(7, (Date) product.getPublishDate());
            ps.setInt(8, product.getQuantity());
            ps.setString(9, product.getName());
            ps.setInt(10, product.getProductID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public Product load(int id) {
        String sql = "select product_ID,Product.category_ID,TEMPORARY.category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,name"
                + " from Product,(select category_ID,name AS category_name from Category) as TEMPORARY\n"
                + " WHERE TEMPORARY.category_ID = Product.category_ID AND product_ID = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                        rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                        rs.getDate("publish_date"), rs.getInt("quantity"), rs.getString("name"),
                        new Category(rs.getInt("category_ID"), rs.getString("category_name")));
                if (product != null) {
                    return product;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> listproductWomen() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details,p.long_details "
                + "from Product p "
                + "where p.gender like 'female' ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductWomenPriceDesc() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'female' "
                + "order by price desc ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductWomenDateDesc() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'female' "
                + "order by p.publish_date desc ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductWomenCom() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 3 "
                + "p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'female' ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductMen() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'male' ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductMenPriceDesc() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'male' "
                + "order by price desc ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductMenDateDesc() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'male' "
                + "order by p.publish_date desc ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductMenCom() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 3 "
                + "p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'male' ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductKid() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'boy' or p.gender like 'girl' ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductKidPriceDesc() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'boy' or p.gender like 'girl' "
                + "order by price desc ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductKidDateDesc() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'boy' or p.gender like 'girl' "
                + "order by p.publish_date desc ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> listproductKidCom() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 3 "
                + "p.product_ID,p.price,p.images_path,p.quantity,p.name,p.short_details, p.long_details "
                + "from Product p "
                + "where p.gender like 'boy' or p.gender like 'girl' ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("product_ID"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setImagesPath(rs.getString("images_path"));
                pro.setShortDetails(rs.getString("short_details"));
                pro.setLongDetails(rs.getString("long_details"));
                list.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> paging(int indexPage) {
        ArrayList<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT product_ID,Product.category_ID,TEMPORARY.category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,name\n"
                        + "FROM Product,(select category_ID,name AS category_name from Category) as TEMPORARY \n"
                        + "WHERE TEMPORARY.category_ID = Product.category_ID\n"
                        + "ORDER BY product_ID\n"
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
                    Product product = new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                            rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                            rs.getDate("publish_date"), rs.getInt("quantity"), rs.getString("name"),
                            new Category(rs.getInt("category_ID"), rs.getString("category_name")));
                    list.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> searchAdmin(String i) {
        List<Product> list = new ArrayList<>();
        String sql = "select product_ID,Product.category_ID,TEMPORARY.name as category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,Product.name\n"
                + " from Product join Category as TEMPORARY\n"
                + " ON Product.category_ID = TEMPORARY.category_ID\n"
                + " where Product.name like ? or Product.gender like ? or TEMPORARY.name like ? ";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, i + "%");
            ps.setString(2, i + "%");
            ps.setString(3, i + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                        rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                        rs.getDate("publish_date"), rs.getInt("quantity"), rs.getString("name"),
                        new Category(rs.getInt("category_ID"), rs.getString("category_name")));
                if (product != null) {
                    list.add(product);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int lastProductId() {
        String sqlID = "SELECT TOP 1 * FROM Product ORDER BY product_ID DESC";
        int lastId = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int lastid = rs.getInt("product_ID");
                lastId = Integer.valueOf(lastid);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lastId;
    }

    public List<Product> sortCategory(String categoryName, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select product_ID,Product.category_ID,TEMPORARY.name as category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,Product.name\n"
                + "FROM Product join Category as TEMPORARY\n"
                + "ON Product.category_ID = TEMPORARY.category_ID\n"
                + "WHERE TEMPORARY.name like ? \n"
                + "Order by product_ID ASC \n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROW ONLY";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, categoryName + "%");
            ps.setInt(2, ((page - 1) * 5));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                        rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                        rs.getDate("publish_date"), rs.getInt("quantity"), rs.getString("name"),
                        new Category(rs.getInt("category_ID"), rs.getString("category_name")));
                if (product != null) {
                    list.add(product);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> listCategory(String categoryName) {
        List<Product> list = new ArrayList<>();
        String sql = "select product_ID,Product.category_ID,TEMPORARY.name as category_name,gender,price,short_details,long_details,images_path,publish_date,quantity,Product.name\n"
                + "FROM Product join Category as TEMPORARY\n"
                + "ON Product.category_ID = TEMPORARY.category_ID\n"
                + "WHERE TEMPORARY.name like ? \n";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, categoryName + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("product_ID"), rs.getString("gender"), rs.getInt("price"),
                        rs.getString("short_details"), rs.getString("long_details"), rs.getString("images_path"),
                        rs.getDate("publish_date"), rs.getInt("quantity"), rs.getString("name"),
                        new Category(rs.getInt("category_ID"), rs.getString("category_name")));
                if (product != null) {
                    list.add(product);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product productDetail(int path) {
        String sql = "select p.product_ID,p.price,p.images_path,p.quantity,c.name,p.short_details,long_details "
                + "from Product p join Category c "
                + "on p.category_ID = c.category_ID "
                + "where p.product_ID = ? ";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, path);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product pr = new Product(rs.getInt("product_ID"), rs.getInt("price"), rs.getString("short_details"), rs.getString("long_details"),
                        rs.getString("images_path"), rs.getInt("quantity"), rs.getString("name"));
                if (pr != null) {
                    return pr;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean changeImgPath(int productId, String imgPath) {
        String sql = "update Product"
                + " set images_path = ?"
                + " where product_ID = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, imgPath);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}

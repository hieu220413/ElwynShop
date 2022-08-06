/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuni.prj301.controller;

import com.fptuni.prj301.dbmanager.CategoryManager;
import com.fptuni.prj301.dbmanager.ProductManager;
import com.fptuni.prj301.model.Category;
import com.fptuni.prj301.model.Product;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author LucasBV
 */
@MultipartConfig
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();
        System.out.println(path);

        if (path.equals("/search")) {
            String index = "";
            if (request.getParameter("search") != null || !request.getParameter("search").trim().equals("")) {
                index = request.getParameter("search");
            }
            ProductManager sm = new ProductManager();

            List<Product> list = sm.search(index);

            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/search.jsp");
            re.forward(request, response);

        } else if (path.equals("/list")) {
            if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
                int page = 1;
                ProductManager manager = new ProductManager();
                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                List<Product> list = manager.paging(page);
                request.setAttribute("number_of_product", manager.list().size());
                request.setAttribute("listProduct", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", page);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/productList.jsp");
                re.forward(request, response);
            } else {
                int page = Integer.valueOf(request.getParameter("page"));
                ProductManager manager = new ProductManager();
                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                List<Product> list = manager.paging(page);
                request.setAttribute("listProduct", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", request.getParameter("page"));
                RequestDispatcher re = request.getRequestDispatcher("/Admin/productList.jsp");
                re.forward(request, response);
            }

        } else if (path.equals("/detail")) {
            int productID = Integer.valueOf(request.getParameter("id"));
            ProductManager manager = new ProductManager();
            Product productDetail = manager.load(productID);
            request.setAttribute("productDetail", productDetail);
            RequestDispatcher re = request.getRequestDispatcher("/Admin/productDetail.jsp");
            re.forward(request, response);

        } else if (path.equals("/edit")) {
            int productID = Integer.valueOf(request.getParameter("id"));
            ProductManager pmanager = new ProductManager();
            Product productEdit = pmanager.load(productID);
            CategoryManager cmanager = new CategoryManager();
            List<Category> listCategory = cmanager.list();
            request.setAttribute("category", listCategory);
            request.setAttribute("productEdit", productEdit);
            RequestDispatcher re = request.getRequestDispatcher("/Admin/productEdit.jsp");
            re.forward(request, response);

        } else if (path.equals("/listWomen")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductWomen();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/womenPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listWomenPriceOder")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductWomenPriceDesc();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/womenPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listWomenDateOder")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductWomenDateDesc();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/womenPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listWomenCom")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductWomenCom();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/womenPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listMen")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductMen();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/menPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listMenPriceOder")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductMenPriceDesc();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/menPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listMenDateOder")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductMenDateDesc();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/menPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listMenCom")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductMenCom();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/menPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listKid")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductKid();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/kidPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listKidPriceOder")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductKidPriceDesc();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/kidPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listKidDateOder")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductKidDateDesc();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/kidPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/listKidCom")) {
            ProductManager manager = new ProductManager();
            List<Product> list = manager.listproductKidCom();
            request.setAttribute("list", list);
            RequestDispatcher re = request.getRequestDispatcher("/User/kidPage.jsp");
            re.forward(request, response);

        } else if (path.equals("/productdetail")) {
            //String img = request.getParameter("imagesPath");   
            String group = request.getParameter("group");
            int i = Integer.valueOf(request.getParameter("id"));
            try {
                ProductManager manager = new ProductManager();
                Product productDetail = manager.productDetail(i);
                request.setAttribute("describe", productDetail);
                request.setAttribute("group", group);
                RequestDispatcher re = request.getRequestDispatcher("/User/describe.jsp");
                re.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (path.equals("/save")) {
            int productID = Integer.valueOf(request.getParameter("idEdit"));
            java.sql.Date publishDate;
            publishDate = Date.valueOf(request.getParameter("publishDate"));
            CategoryManager cmanager = new CategoryManager();
            Category categoryUpdate = cmanager.load(request.getParameter("category"));
            ProductManager pmanager = new ProductManager();
            Product productEdit = pmanager.load(productID);
            Product productUpdate;
            productUpdate = new Product(productID, request.getParameter("gender"),
                    Integer.valueOf(request.getParameter("price")),
                    request.getParameter("shortDetails"),
                    request.getParameter("longDetails"),
                    productEdit.getImagesPath(), publishDate,
                    Integer.valueOf(request.getParameter("quantity")),
                    request.getParameter("name"),
                    categoryUpdate);
            if (pmanager.update(productUpdate)) {
                System.out.println("Update successfully!");
            }
            request.setAttribute("productDetail", pmanager.load(productUpdate.getProductID()));
            RequestDispatcher re = request.getRequestDispatcher("/Admin/productDetail.jsp");
            re.forward(request, response);

        } else if (path.equals("/insert")) {
            CategoryManager cmanager = new CategoryManager();
            ProductManager pmanager = new ProductManager();
            List<Category> listCategory = cmanager.list();
            int lastId = pmanager.lastProductId();
            lastId++;
            request.setAttribute("id", lastId);
            request.setAttribute("category", listCategory);
            RequestDispatcher re = request.getRequestDispatcher("/Admin/productInsert.jsp");
            re.forward(request, response);

        } else if (path.equals("/delete")) {
            ProductManager manager = new ProductManager();
            int productID = Integer.valueOf(request.getParameter("id"));
            if (manager.delete(productID)) {
                System.out.println("Update successfully!");
            }
            RequestDispatcher re = request.getRequestDispatcher("/ProductController/list");
            re.forward(request, response);
        } else if (path.equals("/searchAdmin")) {
            if (request.getParameter("index") == null || request.getParameter("index").equals("")) {
                response.sendRedirect(request.getContextPath() + "/ProductController/list");
            } else {
                int page = 1;
                ProductManager manager = new ProductManager();
                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                String index = request.getParameter("index");
                ProductManager sm = new ProductManager();
                List<Product> list = sm.searchAdmin(index);
                if (list == null || list.isEmpty()) {
                    request.setAttribute("search_message", "Not found any results");
                }
                request.setAttribute("disableNav", 0);
                request.setAttribute("listProduct", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", page);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/productList.jsp");
                re.forward(request, response);
            }
        } else if (path.equals("/sort")) {
            String categorySort = request.getParameter("sortCategory");
            int page = 1;

            if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
                page = Integer.valueOf(request.getParameter("page"));
            }

            ProductManager pmanager = new ProductManager();
            List<Product> listCategoryPaging = pmanager.sortCategory(categorySort, page);
            List<Product> listCategory = pmanager.listCategory(categorySort);
            int endPage = listCategory.size() / 5;
            if (listCategory.size() % 5 != 0) {
                endPage++;
            }
            request.setAttribute("sorted", "1");
            request.setAttribute("sort", categorySort);
            request.setAttribute("disableNav", 0);
            request.setAttribute("listProduct", listCategoryPaging);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", page);
            RequestDispatcher re = request.getRequestDispatcher("/Admin/productList.jsp");
            re.forward(request, response);
        } else if (path.equals("/saveInsert")) {
            //create variable for insert
            int productID = 0;
            String gender = "";
            int price = 0;
            String shortDetails = "";
            String longDetails = "";
            String imagesPath = "";
            java.util.Date publishDate = null;
            int quantity = 0;
            String name = "";
            String category = "";
            String group = "";
            CategoryManager cmanager = new CategoryManager();
            ProductManager pmanager = new ProductManager();
            Product productInsert;

            //write img file to disk
            String imgPathTmp = null;
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("E:/FPT/SEM4_PRJ301/prj301-se1615-02/prj301-assignment/src/main/webapp/images/"));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);

                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (fi.isFormField()) {
                            // get the uploaded file's fields
                            if (fi.getFieldName().equals("id")) {
                                productID = Integer.valueOf(fi.getString());
                            }
                            if (fi.getFieldName().equals("gender")) {
                                gender = fi.getString();
                            }
                            if (fi.getFieldName().equals("price")) {
                                price = Integer.valueOf(fi.getString());
                            }
                            if (fi.getFieldName().equals("shortDetails")) {
                                shortDetails = fi.getString();
                            }
                            if (fi.getFieldName().equals("longDetails")) {
                                longDetails = fi.getString();
                            }
                            if (fi.getFieldName().equals("publishDate")) {
                                publishDate = Date.valueOf(fi.getString());
                            }
                            if (fi.getFieldName().equals("quantity")) {
                                quantity = Integer.valueOf(fi.getString());
                            }
                            if (fi.getFieldName().equals("name")) {
                                name = fi.getString();
                            }
                            if (fi.getFieldName().equals("category")) {
                                category = fi.getString();
                            }
                            if (fi.getFieldName().equals("group")) {
                                group = fi.getString();
                            }
                        } else {
                            //process write file to disk
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            filePath += group + "/" + cmanager.ConvertStringtoName(category) + "/";
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();

                            // Write the file
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }
                            //get the img path for saving to database
                            imgPathTmp = file.getAbsolutePath();
                            fi.write(file);
                        }

                    }

                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }
            //create imgpath
            String tmp[] = imgPathTmp.split("\\" + "\\");
            imagesPath = "..\\" + tmp[tmp.length - 4] + "\\" + tmp[tmp.length - 3] + "\\" + tmp[tmp.length - 2] + "\\" + tmp[tmp.length - 1];


            /*
            try {

                Part part = request.getPart("file");

                String realPart = request.getServletContext().getRealPath("");
                realPart = realPart.replace("\\", "/");

                String detail = "images";// + "/gender" + "/category"
                String savePath = realPart + detail;
                String filename = part.getSubmittedFileName();
                String imgPath = "../" + detail + "/" + filename;

                File fileSavedDir = new File(savePath);
                if (!fileSavedDir.exists()) {
                    fileSavedDir.mkdir();
                }

                savePath = savePath.replaceFirst("/target/prj301-assignment-1.0-SNAPSHOT", "/src/main/webapp");
                part.write(savePath + "/" + filename);
                System.out.println(savePath + "/" + filename);

                request.setAttribute("fileName", filename);
                request.setAttribute("imgPath", imgPath);
                request.setAttribute("savePath", savePath + "/" + filename);
                request.getRequestDispatcher("/Admin/productDetail.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
             */
            //load category for inserting product           
            Category categoryUpdate = cmanager.load(category);
            productInsert = new Product(productID, gender, price, shortDetails, longDetails, imagesPath, publishDate, quantity, name, categoryUpdate);
            if (pmanager.insert(productInsert)) {
                System.out.println("Insert successfully!");
            }
            //send information of productInsert back to detail page 
            request.setAttribute("productDetail", pmanager.load(productInsert.getProductID()));
            RequestDispatcher re = request.getRequestDispatcher("/Admin/productDetail.jsp");
            re.forward(request, response);
        } else if (path.equals("/changeImg")) {

            ProductManager manager = new ProductManager();
            Product productImgChange = manager.load(Integer.valueOf(request.getParameter("productId")));
            request.setAttribute("productEdit", productImgChange);
            RequestDispatcher re = request.getRequestDispatcher("/Admin/uploadImage.jsp");
            re.forward(request, response);

        } else if (path.equals("/saveImg")) {
            //write img file to disk
            String productId = null;
            String imgPathTmp = null;
            String imgPath;
            Product productImgUpdate;
            File file;
            String category = null;
            String group = null;
            ProductManager manager = new ProductManager();
            CategoryManager cmanager = new CategoryManager();
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;

            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("E:/FPT/SEM4_PRJ301/prj301-se1615-02/prj301-assignment/src/main/webapp/images/"));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);

                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (fi.isFormField()) {
                            // get the uploaded file's fields
                            if (fi.getFieldName().equals("id")) {
                                productId = fi.getString();
                            }
                            if (fi.getFieldName().equals("category")) {
                                category = fi.getString();
                            }
                            if (fi.getFieldName().equals("group")) {
                                group = fi.getString();
                            }

                        } else {
                            //process write file to disk
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            filePath += group + "/" + cmanager.ConvertStringtoName(category) + "/";
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();

                            // Write the file
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }
                            //get the img path for saving to database
                            imgPathTmp = file.getAbsolutePath();
                            fi.write(file);
                        }

                    }

                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }
            String tmp[] = imgPathTmp.split("\\" + "\\");
            imgPath = "..\\" + tmp[tmp.length - 4] + "\\" + tmp[tmp.length - 3] + "\\" + tmp[tmp.length - 2] + "\\" + tmp[tmp.length - 1];
            if (manager.changeImgPath(Integer.valueOf(productId), imgPath)) {
                int productID = Integer.valueOf(productId);
                ProductManager pmanager = new ProductManager();
                Product productEdit = pmanager.load(productID);
                cmanager = new CategoryManager();
                List<Category> listCategory = cmanager.list();
                request.setAttribute("category", listCategory);
                request.setAttribute("productEdit", productEdit);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/productEdit.jsp");
                re.forward(request, response);
            } else {
                int productID = Integer.valueOf(productId);
                ProductManager pmanager = new ProductManager();
                Product productEdit = pmanager.load(productID);
                cmanager = new CategoryManager();
                List<Category> listCategory = cmanager.list();
                request.setAttribute("changeImg-msg", "Error while changing image!");
                request.setAttribute("category", listCategory);
                request.setAttribute("productEdit", productEdit);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/productEdit.jsp");
                re.forward(request, response);
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

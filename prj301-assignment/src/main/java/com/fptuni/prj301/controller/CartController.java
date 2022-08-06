/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuni.prj301.controller;

import com.fptuni.prj301.dbmanager.OrderManager;
import com.fptuni.prj301.dbmanager.ProductManager;
import com.fptuni.prj301.model.Product;
import com.fptuni.prj301.model.User;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LucasBV
 */
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {   
//        }

        String path = request.getPathInfo();
        System.out.println(path);
        if (path.equals("/addcart")) {
            HttpSession session = request.getSession();

            int id = Integer.parseInt(request.getParameter("id"));
            ProductManager pm = new ProductManager();
            Product pro = pm.load(id);

            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("Cart");

            if (cart == null) {
                cart = new HashMap<>();
                cart.put(String.valueOf(pro.getProductID()), 1);
            } else {
                if (cart.containsKey(String.valueOf(pro.getProductID()))) {
                    int quantity = cart.get(String.valueOf(pro.getProductID()));
                    quantity++;
                    cart.put(String.valueOf(pro.getProductID()), quantity);
                } else {
                    cart.put(String.valueOf(pro.getProductID()), 1);
                }

            }

            session.setAttribute("Cart", cart);
            String group = request.getParameter("group");
            if (group.equalsIgnoreCase("women")) {
                response.sendRedirect(request.getContextPath() + "/ProductController/listWomen");
            } else if (group.equalsIgnoreCase("men")) {
                response.sendRedirect(request.getContextPath() + "/ProductController/listMen");
            } else if (group.equalsIgnoreCase("kid")) {
                response.sendRedirect(request.getContextPath() + "/ProductController/listKid");
            }

        } else if (path.equals("/removecart")) {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");

            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("Cart");

            cart.remove(id);
            session.setAttribute("Cart", cart);
            RequestDispatcher re = request.getRequestDispatcher("/User/cart.jsp");
            re.forward(request, response);

        } else if (path.equals("/updatecart")) {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("Cart");

            cart.put(id, quantity);

            session.setAttribute("Cart", cart);
            RequestDispatcher re = request.getRequestDispatcher("/User/cart.jsp");
            re.forward(request, response);
        } else if (path.equals("/pay")) {
            HttpSession session = request.getSession();
            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("Cart");

            User user = (User) session.getAttribute("usersession");

            if (cart != null) {
                String paymentmethod = request.getParameter("paymethod");
                int total = Integer.valueOf(request.getParameter("total_amounts"));
                OrderManager order = new OrderManager();
                if (order.Payment(user.getUserId(), cart, paymentmethod, total)) {
                    cart.clear();
                    session.setAttribute("Cart", cart);
                    request.setAttribute("AlreadyPay", "Pay succesfully");
                    RequestDispatcher rq = request.getRequestDispatcher("/User/cart.jsp");
                    rq.forward(request, response);
                }
            } else {
                request.setAttribute("payError", "Cart is empty");
                RequestDispatcher rq = request.getRequestDispatcher("/User/cart.jsp");
                rq.forward(request, response);
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

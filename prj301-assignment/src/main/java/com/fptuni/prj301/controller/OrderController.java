/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuni.prj301.controller;

import com.fptuni.prj301.dbmanager.OrderManager;
import com.fptuni.prj301.model.Order;
import com.fptuni.prj301.model.Product;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LucasBV
 */
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.util.Date date1 = new java.util.Date();
        LocalDate localDate = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int month = localDate.getMonthValue();
        int year = localDate.getYear();
        Month monthWord = localDate.getMonth();
        String path = request.getPathInfo();
        if (path.equals("/list")) {

            List<Order> listOrders;
            OrderManager manager = null;

            if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
                listOrders = new ArrayList<>();
                manager = new OrderManager();
                int page = 1;
                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                listOrders = manager.paging(page);
                request.setAttribute("month", monthWord);
                request.setAttribute("year", year);
                request.setAttribute("listYear", manager.listYear(year));
                request.setAttribute("listMonth", manager.listMonth(month));
                request.setAttribute("list", listOrders);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", page);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/finance.jsp");
                re.forward(request, response);
            } else {
                listOrders = new ArrayList<>();
                manager = new OrderManager();
                int page = Integer.valueOf(request.getParameter("page"));
                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                listOrders = manager.paging(page);
                request.setAttribute("month", monthWord);
                request.setAttribute("year", year);
                request.setAttribute("listYear", manager.listYear(year));
                request.setAttribute("listMonth", manager.listMonth(month));
                request.setAttribute("list", listOrders);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", request.getParameter("page"));
                RequestDispatcher re = request.getRequestDispatcher("/Admin/finance.jsp");
                re.forward(request, response);
            }
        } else if (path.equals("/sort")) {
            String type = request.getParameter("type");
            String sort = request.getParameter("sort");
            int page = 0;
            if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
                page = 1;
            } else {
                page = Integer.valueOf(request.getParameter("page"));
            }

            OrderManager manager;
            List<Order> list;

            if (sort.equals("date")) {
                manager = new OrderManager();
                list = new ArrayList<>();
                list = manager.sortDate(type, page);

                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                request.setAttribute("month", monthWord);
                request.setAttribute("year", year);
                request.setAttribute("listYear", manager.listYear(year));
                request.setAttribute("listMonth", manager.listMonth(month));
                request.setAttribute("sorted", "1");
                request.setAttribute("sort", "date");
                request.setAttribute("type", type);
                request.setAttribute("list", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", page);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/finance.jsp");
                re.forward(request, response);
            }
            if (sort.equals("amount")) {
                manager = new OrderManager();
                list = new ArrayList<>();
                list = manager.sortAmount(type, page);
                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                request.setAttribute("month", monthWord);
                request.setAttribute("year", year);
                request.setAttribute("listYear", manager.listYear(year));
                request.setAttribute("listMonth", manager.listMonth(month));
                request.setAttribute("sorted", "1");
                request.setAttribute("sort", "amount");
                request.setAttribute("type", type);
                request.setAttribute("list", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", page);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/finance.jsp");
                re.forward(request, response);

            }
        } else if (path.equals("/search")) {
            String username = request.getParameter("username");
            if (request.getParameter("username") == null || request.getParameter("username").equals("")) {
                response.sendRedirect(request.getContextPath() + "/OrderController/list");
            } else {
                List<Order> listOrders = new ArrayList<>();
                OrderManager manager = new OrderManager();

                int endPage = manager.list().size() / 5;
                if (manager.list().size() % 5 != 0) {
                    endPage++;
                }
                listOrders = manager.search(username);
                if (listOrders == null || listOrders.isEmpty()) {
                    request.setAttribute("search_message", "Not found any results");
                }
                request.setAttribute("month", monthWord);
                request.setAttribute("year", year);
                request.setAttribute("listYear", manager.listYear(year));
                request.setAttribute("listMonth", manager.listMonth(month));
                request.setAttribute("disableNav", 0);
                request.setAttribute("list", listOrders);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", 1);
                RequestDispatcher re = request.getRequestDispatcher("/Admin/finance.jsp");
                re.forward(request, response);
            }
        } else if (path.equals("/detail")) {
            int orderId = Integer.valueOf(request.getParameter("id"));
            OrderManager manager = new OrderManager();
            List<Product> listProduct = manager.listProduct(orderId);
            request.setAttribute("orderId", orderId);
            request.setAttribute("listProduct", listProduct);
            RequestDispatcher re = request.getRequestDispatcher("/Admin/orderProducts.jsp");
            re.forward(request, response);
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

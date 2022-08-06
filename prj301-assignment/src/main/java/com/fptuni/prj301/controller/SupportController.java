/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuni.prj301.controller;

import com.fptuni.prj301.dbmanager.SupportManager;
import com.fptuni.prj301.dbmanager.UserManager;
import com.fptuni.prj301.model.Support;
import com.fptuni.prj301.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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
public class SupportController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getPathInfo();
        if (path.equals("/list")) {
            try {
                String search = "";
                String sort = request.getParameter("sort");
                String index = request.getParameter("indexPage");
                if (index == null) {
                    index = "1";
                }
                int indexPage = Integer.parseInt(index);

                SupportManager manager = new SupportManager();
                int total = manager.countTotalSupport();
                int endPage = total / 5;
                if (total % 5 != 0) {
                    endPage++;
                }

                List<Support> list = manager.getListSupport(search);
                ArrayList<Support> listSupportPaging = manager.pagingSupport(indexPage, search, sort);
                if (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty()) {
                    search = request.getParameter("search");
                    listSupportPaging = manager.pagingSupport(indexPage, search, sort);
                    total = manager.getListSupport(search).size();
                    endPage = total / 5;
                    if (total % 5 != 0) {
                        endPage++;
                    }
                }

                if (listSupportPaging == null || listSupportPaging.isEmpty()) {
                    request.setAttribute("search_message", "Not found any results");
                }
                request.setAttribute("search", search);
                request.setAttribute("sort", sort);
                request.setAttribute("supportList", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("listSupportPaging", listSupportPaging);
                request.setAttribute("currentPage", indexPage);

                RequestDispatcher rd = request.getRequestDispatcher("/Admin/supportList.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (path.equals("/search")) {
            try {
                request.setAttribute("search", request.getParameter("search"));
                RequestDispatcher rd = request.getRequestDispatcher("/SupportController/list");
                rd.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (path.equals("/remove")) {
            try {
                int supportId = Integer.parseInt(request.getParameter("supportId"));
                SupportManager manager = new SupportManager();
                manager.removeSupport(supportId);

                response.sendRedirect(request.getContextPath() + "/SupportController/list");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (path.equals("/addSupport")) {
            try {
                SupportManager supportManager = new SupportManager();
                HttpSession session = request.getSession();
                UserManager manager = new UserManager();
                User usersession = (User) session.getAttribute("usersession");
                User u = manager.load(usersession.getUsername());
                int UserId = u.getUserId();
                String details = request.getParameter("message");

                int AdminId = 1;
//                java.sql.Date publishDate;
                Date publishDate = Date.valueOf(request.getParameter("publishDate"));
                if (details == null || details.trim().equals("")) {
                    request.setAttribute("add-msg", "Send unsuccessfully !");
                } else {
                    Support support = new Support(AdminId, UserId, details, publishDate);
                    supportManager.insert(support);
                    request.setAttribute("add-msg1", "Send successfully !");
                    request.setAttribute("content", details);
                    RequestDispatcher rd = request.getRequestDispatcher("/User/contact.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
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

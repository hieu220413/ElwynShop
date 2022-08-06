/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuni.prj301.controller;

import com.fptuni.prj301.dbmanager.UserManager;
import com.fptuni.prj301.model.User;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
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
public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();

        if (path.equals("/login")) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username == null) {
                response.sendRedirect(request.getContextPath() + "/User/login.jsp");
            } else {
                UserManager manager = new UserManager();
                User us = manager.login(username, password);

                if (us != null) {
                    HttpSession ss = request.getSession(true);
                    ss.setAttribute("usersession", us);
                    response.sendRedirect(request.getContextPath() + "/UserController/home");
                } else {
                    request.setAttribute("login-msg", "Wrong username or password");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/login.jsp");
                    rd.forward(request, response);
                }
            }

        } else if (path.equals("/loginAdmin")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username == null) {
                response.sendRedirect(request.getContextPath() + "/Admin/login.jsp");

            } else {
                UserManager manager = new UserManager();
                User us = manager.loginAdmin(username, password);

                if (us != null) {
                    HttpSession ss = request.getSession(true);
                    ss.setAttribute("usersession", us);
                    response.sendRedirect(request.getContextPath() + "/UserController/homeAdmin");
                } else {
                    request.setAttribute("login-msg", "Wrong username or password");
                    RequestDispatcher rd = request.getRequestDispatcher("/Admin/login.jsp");
                    rd.forward(request, response);
                }
            }
        } else if (path.equals("/logout")) {
            HttpSession ss = request.getSession();
            ss.setAttribute("usersession", null);
            ss.removeAttribute("usersession");
            ss.invalidate();
            response.sendRedirect(request.getContextPath() + "/User/login.jsp");
        } else if (path.equals("/home")) {
            HttpSession session = request.getSession();
            User usersession = (User) session.getAttribute("usersession");

            if (usersession != null) {
                request.setAttribute("user", usersession);
                RequestDispatcher rd = request.getRequestDispatcher("/User/home.jsp");
                rd.forward(request, response);
                return;
            }
            response.sendRedirect(request.getContextPath() + "/User/login.jsp");
        } else if (path.equals("/homeAdmin")) {
            HttpSession session = request.getSession();
            User usersession = (User) session.getAttribute("usersession");

            if (usersession != null) {
                request.setAttribute("user", usersession);
                RequestDispatcher rd = request.getRequestDispatcher("/Admin/home.jsp");
                rd.forward(request, response);
                return;
            }
            response.sendRedirect(request.getContextPath() + "/Admin/login.jsp");

        } else if (path.equals("/signin")) {
            UserManager manager = new UserManager();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            List<User> list = manager.list();

            request.setAttribute("username", username);
            request.setAttribute("phone", phone);

            for (User u : list) {
                if (u.getUsername().equals(username)) {
                    request.setAttribute("signin-msg1", "Username exists !");

                    RequestDispatcher rd = request.getRequestDispatcher("/User/signin.jsp");
                    rd.forward(request, response);
                } else if (u.getPhone().equals(phone)) {
                    request.setAttribute("signin-msg2", "Phone number used !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/signin.jsp");
                    rd.forward(request, response);
                } else if (u.getEmail().equals(email)) {
                    request.setAttribute("signin-msg5", "Email used !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/signin.jsp");
                    rd.forward(request, response);
                }

            }
            if (!phone.matches("[0-9]+")) {
                request.setAttribute("signin-msg3", "Phone can not contain letter !");
                RequestDispatcher rd = request.getRequestDispatcher("/User/signin.jsp");
                rd.forward(request, response);
            } else if (!email.matches("^[a-zA-Z0-9]+@gmail.com$")) {
                request.setAttribute("signin-msg4", "Email does not match format @gmail.com !");
                RequestDispatcher rd = request.getRequestDispatcher("/User/signin.jsp");
                rd.forward(request, response);
            } else if (!password.equals(repassword)) {
                request.setAttribute("signin-msg", "Wrong repassword !");
                RequestDispatcher rd = request.getRequestDispatcher("/User/signin.jsp");
                rd.forward(request, response);
            } else {
                User user = new User(username, password, phone, email);
                if (manager.insert(user)) {
                    User us = manager.login(username, password);
                    if (us != null) {
                        HttpSession ss = request.getSession(true);
                        ss.setAttribute("usersession", us);
                        RequestDispatcher rd = request.getRequestDispatcher("/User/home.jsp");
                        rd.forward(request, response);
                    }
                }
            }

        } else if (path.equals("/edit")) {
            try {
                HttpSession session = request.getSession();
                UserManager manager = new UserManager();
                User usersession = (User) session.getAttribute("usersession");
                String username = usersession.getUsername();
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                List<User> list = manager.list();
                boolean flag = true;
                for (User user : list) {
                    if (user.getPhone().equals(phone)) {
                        request.setAttribute("edit-msg1", "Phone number used !");
                        RequestDispatcher rd = request.getRequestDispatcher("/User/edit-info.jsp");
                        rd.forward(request, response);
                        flag = false;
                    } else if (user.getEmail().equals(email)) {
                        request.setAttribute("edit-msg2", "Email used !");
                        RequestDispatcher rd = request.getRequestDispatcher("/User/edit-info.jsp");
                        rd.forward(request, response);
                        flag = false;
                    }
                }
                if (!phone.matches("[0-9]+")) {
                    request.setAttribute("edit-msg3", "Phone can not contain letter !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/edit-info.jsp");
                    rd.forward(request, response);
                } else if (!email.matches("^[a-zA-Z0-9]+@gmail.com$")) {
                    request.setAttribute("edit-msg4", "Email does not match format @gmail.com !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/edit-info.jsp");
                    rd.forward(request, response);
                } else if(flag){
                    User userEdited = manager.load(usersession.getUsername());
                    userEdited.setUsername(username);
                    userEdited.setName(name);
                    userEdited.setPhone(phone);
                    userEdited.setEmail(email);
                    manager.Update(userEdited);
                    request.setAttribute("edit-msg5", "Edit Successful !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/userinfo.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception e) {
            }
        } else if (path.equals("/editPassword")) {
            try {
                HttpSession session = request.getSession();
                UserManager manager = new UserManager();
                User usersession = (User) session.getAttribute("usersession");
                User u = manager.load(usersession.getUsername());
                String username = usersession.getUsername();
                String oldPassword = request.getParameter("Oldpassword");
                String Password = request.getParameter("password");
                String Repassword = request.getParameter("repassword");
                if (!oldPassword.equals(u.getPassword())) {
                    request.setAttribute("edit-msg6", " Wrong password !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/edit-password.jsp");
                    rd.forward(request, response);
                } else if (Password.equals(oldPassword)) {
                    request.setAttribute("edit-msg7", "Please enter new password again !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/edit-password.jsp");
                    rd.forward(request, response);
                } else if (!Repassword.equals(Password)) {
                    request.setAttribute("edit-msg8", "Wrong repassword !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/edit-password.jsp");
                    rd.forward(request, response);
                } else {
                    User user = manager.load(usersession.getUsername());
                    user.setUsername(username);
                    user.setPassword(Password);
                    manager.UpdatePassword(user);
                    request.setAttribute("edit-msg9", "Change password successful !");
                    RequestDispatcher rd = request.getRequestDispatcher("/User/edit-info.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception e) {
            }
        } else if (path.equals("/listUser")) {
            try {
                HttpSession session = request.getSession(true);
                UserManager manager = new UserManager();
                User user = (User) session.getAttribute("usersession");

                String search = "";
                if (user != null) {
//                    if (manager.isAdmin(user.getUsername(), user.getPassword())) {
                    String index = request.getParameter("indexPage");
                    if (index == null) {
                        index = "1";
                    }
                    int indexPage = Integer.parseInt(index);
                    int total = manager.countTotalUser();
                    int endPage = total / 5;
                    if (total % 5 != 0) {
                        endPage++;
                    }
                    ArrayList<User> listUserPaging = manager.pagingUser(indexPage, search);
                    ArrayList<User> list = (ArrayList<User>) manager.getListUser(search);
                    if (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty()) {
                        search = request.getParameter("search");
                        listUserPaging = manager.pagingUser(indexPage, search);
                        total = manager.getListUser(search).size();
                        endPage = total / 5;
                        if (total % 5 != 0) {
                            endPage++;
                        }
                    }
                    if (listUserPaging == null || listUserPaging.isEmpty()) {
                        request.setAttribute("search_message", "Not found any results");
                    }
                    request.setAttribute("search", search);
                    request.setAttribute("listUser", list);
                    request.setAttribute("listUserPaging", listUserPaging);
                    request.setAttribute("endPage", endPage);
                    request.setAttribute("currentPage", indexPage);

                    request.getRequestDispatcher("/Admin/userList.jsp").forward(request, response);
//                    } else {
//                        response.sendRedirect(request.getContextPath() + "/UserController/home");
//                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/UserController/home");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (path.equals("/editUser")) {
            try {
                HttpSession session = request.getSession(true);
                UserManager manager = new UserManager();
                User user = (User) session.getAttribute("usersession");
                if (user != null) {
//                    if (manager.isAdmin(user.getUsername(), user.getPassword())) {
                    int userID = Integer.parseInt(request.getParameter("userID"));
                    User u = manager.getUser(userID);
                    String action = request.getParameter("action");

                    if (action == null) {
                        request.setAttribute("user", u);
                        request.getRequestDispatcher("/Admin/editUser.jsp").forward(request, response);
                    } else if (action.equals("ViewUser")) {
                        request.setAttribute("user", u);
                        request.getRequestDispatcher("/Admin/userInfo.jsp").forward(request, response);
                    } else if (action.equals("Edit")) {

                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        String name = request.getParameter("name");
                        String phone = request.getParameter("phone");
                        String email = request.getParameter("email");
                        User userEdited = manager.getUser(userID);
                        userEdited.setUsername(username);
                        userEdited.setName(name);
                        userEdited.setPassword(password);
                        userEdited.setPhone(phone);
                        userEdited.setEmail(email);

                        HashMap<String, String> errors = new HashMap<>();
                        boolean hasError = false;

                        String[] nameArray = name.split(" ");
                        for (String string : nameArray) {
                            if (!string.trim().matches("[a-zA-Z]+")) {
                                errors.put("nameError", "*Name contains only letter");
                                hasError = true;
                            }
                        }
                        if (!phone.matches("[0-9]+")) {
                            errors.put("phoneError", "*Phone can not contain letter");
                            hasError = true;
                        }
                        if (!email.matches("^[a-zA-Z0-9]+@gmail.com$")) {
                            errors.put("emailError", "*Email does not match format @gmail.com");
                            hasError = true;
                        }

                        if (hasError) {
                            request.setAttribute("errors", errors);
                            request.setAttribute("user", userEdited);

                            request.getRequestDispatcher("/Admin/editUser.jsp").forward(request, response);
                        } else {
                            manager.editUser(userEdited);

                            request.setAttribute("edit_msg", "Update user " + userID + " successfully");
                            request.getRequestDispatcher("/UserController/listUser").forward(request, response);
                        }
                    }

//                } else {
//                    response.sendRedirect(request.getContextPath() + "/UserController/home");
//                }
                } else {
                    response.sendRedirect(request.getContextPath() + "/UserController/home");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (path.equals("/removeUser")) {

            try {
                int userID = Integer.parseInt(request.getParameter("userID"));

                UserManager manager = new UserManager();
                if (manager.removeUser(userID)) {
                    request.setAttribute("remove_msg", "Remove user " + userID + " successfully");
                    request.setAttribute("alert", "success");

                } else {
                    request.setAttribute("remove_msg", "Remove user " + userID + " unsuccessfully");
                    request.setAttribute("alert", "danger");

                }
                request.getRequestDispatcher("/UserController/listUser").forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/UserController/listUser");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (path.equals("/searchUser")) {
            try {
                request.setAttribute("search", request.getParameter("search"));
                request.getRequestDispatcher("/UserController/listUser").forward(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package com.fptuni.prj301.filter;

import com.fptuni.prj301.dbmanager.UserManager;
import com.fptuni.prj301.model.User;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LucasBV
 */
public class AuthenticationFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public AuthenticationFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenticationFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenticationFilter:DoAfterProcessing");
        }

        try {

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("AuthenticationFilter:doFilter()");
        }

        doBeforeProcessing(request, response);

        Throwable problem = null;

        try {

//            final String[] AUTHORIZED_ADMIN_URI = {"/listUser", "/editUser", "/removeUser", "UserController/searchUser",
//                "/list", "/search", "/detail", "/productdetail", "/edit", "/changeImg", "/saveImg",
//                "/save", "/insert", "/delete", "/searchAdmin", "/sort", "/saveInsert", "/homeAdmin", "/logout"};
            final String[] GUEST = {};
//            final String[] AUTHORIZED_ADMIN_URI = {"UserController/home",
//                "UserController/homeAdmin",
//                "UserController/listUser",
//                "UserController/editUser",
//                "UserController/removeUser",
//                "UserController/searchUser",
//                "UserController/logout"};
            final String[] AUTHORIZED_ADMIN_URI = {
                "homeAdmin",
                "list",
                "listUser",
                "editUser",
                "removeUser",
                "searchUser",
                "remove",
                "search",
                "sort",
                "detail",
                "edit",
                "save",
                "insert",
                "delete",
                "searchAdmin",
                "saveInsert",
                "changeImg",
                "saveImg",
                "logout"};

            final String[] AUTHORIZED_ADMIN_PAGE = {"editUser.jsp", "finance.jsp", "orderDetail.jsp",
                "orderProducts.jsp", "productDetail.jsp", "productEdit.jsp", "productInsert.jsp", "productList.jsp", "supportList.jsp",
                "uploadImage.jsp", "userInfo.jsp", "userList.jsp"};

            final String[] GUEST_PAGE = {"login", "loginAdmin", "logout", "login.jsp", "signin", "home", "home.jsp", "contact.jsp",
                "listWomenCom", "listMenCom", "listKidCom", "listWomen", "listMen", "listKid",
                "productdetail", "search", "sort",
                "listWomenPriceOder", "listWomenDateOder", "listMenPriceOder", "listMenDateOder", "listKidPriceOder", "listKidDateOder",
                "productList.jsp", "productEdit,jsp",
                "cart.jsp", "createAccount.jsp",
                "describe.jsp", "kidPage.jsp", "menPage.jsp", "womenPage.jsp", "signin.jsp"};

//            final String[] AUTHORIZED_USER_URI = {"UserController/edit", "UserController/editPassword"};
            final String[] AUTHORIZED_USER_URI = {"edit", "editPassword", "addSupport", "addcart", "removecart", "updatecart", "pay",
                "search.jsp", "userinfo.jsp", "edit-info.jsp", "edit-password.jsp", "logout"};
            final String[] AUTHORIZED_USER_PAGE = {"edit", "editPassword", "addSupport"};
            final String[] UNAUTHORIZED_USER_PAGE = {"User/cart.jsp", "User/contact.jsp", "User/createAccount.jsp",
                "User/describe.jsp", "User/home.jsp", "User/kidPage.jsp", "User/menPage/jsp", "User/womenPage/jsp", "User/signin.jsp"};

//            final String[] AUTHORIZED_ADMIN_PAGE = {"/home.jsp"};
            final String[] CONTROLLER = {"/OrderController", "/ProductController", "/SupportController", "/UserController"};
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            HttpSession session = httpRequest.getSession();
            String uri = httpRequest.getRequestURI();
//            String url = httpRequest.getRequestURL().toString();
//            System.out.println("url: " + url);
            System.out.println("(filter) uri: " + uri);
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            UserManager manager = new UserManager();
            User userSession = (User) session.getAttribute("usersession");

            if (userSession == null) {
                List<String> guest = new ArrayList<>();
                for (String up : GUEST_PAGE) {
                    guest.add(up);
                }
                if (guest.contains(resource) || uri.endsWith("User/home.jsp")) {
                    chain.doFilter(request, response);
                } else if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")) {
                    chain.doFilter(request, response);
                } else {
                    log("Unauthorized user");
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/login.jsp");
                }
            } else {
                String username = userSession.getUsername();
                String password = userSession.getPassword();
                List<String> admin = new ArrayList<>();
                List<String> user = new ArrayList<>();
                for (String guest : GUEST_PAGE) {
                    user.add(guest);
                    admin.add(guest);
                }
                for (String adminUri : AUTHORIZED_ADMIN_URI) {
                    admin.add(adminUri);
                }
                for (String adminPage : AUTHORIZED_ADMIN_PAGE) {
                    admin.add(adminPage);
                }
                for (String userUri : AUTHORIZED_USER_URI) {
                    user.add(userUri);
                }
                if (manager.isAdmin(username, password)) {
                    if (admin.contains(resource) || uri.endsWith("User/home.jsp")) {
                        chain.doFilter(request, response);
                    } else {
                        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")) {
                            chain.doFilter(request, response);
                        } else {
                            log("Not found request page");
                            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Admin/home.jsp");
                        }
                    }
                } else if (!manager.isAdmin(username, password)) {
                    if (admin.contains(resource) && uri.contains("Admin")) {
                        log("Not permitted");
                        httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/home.jsp");
                    } else if (user.contains(resource) || uri.endsWith("User/home.jsp")) {
                        chain.doFilter(request, response);
                    } else {
                        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")) {
                            chain.doFilter(request, response);
                        } else {
                            log("Not found request page");
                            httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/home.jsp");
                        }
                    }
                }
            }
            /////
//                if (admin.contains(resource)) {
//                    if (manager.isAdmin(username, password)) {
//                        chain.doFilter(request, response);
//                    } else {
//                        log("Not permitted");
//                        httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/home.jsp");
//                    }
//                } else {
//                    log("Not found request page");
//                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/home.jsp");
//                }
//                for (String adminUri : AUTHORIZED_ADMIN_URI) {
            //                    if (manager.isAdmin(username, password) && adminUri.endsWith(uri)) {
            //                        chain.doFilter(request, response);
            //                        break;
            //                    } else {
            //                        log("Not permitted");
            //                        httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/home.jsp");
            //                        break;
            //                    }
            //                }
            //                for (String adminPage : AUTHORIZED_ADMIN_PAGE) {
            //                    if (manager.isAdmin(username, password) && adminPage.endsWith(uri)) {
            //                        chain.doFilter(request, response);
            //                        break;
            //                    } else {
            //                        log("Not permitted");
            //                        httpResponse.sendRedirect(httpRequest.getContextPath() + "/User/home.jsp");
            //                    }
            //                }

//            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthenticationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenticationFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenticationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}

<%-- 
    Document   : Edit-info.jsb
    Created on : Mar 5, 2022, 2:40:37 PM
    Author     : phamquang
--%>

<%@page import="com.fptuni.prj301.dbmanager.UserManager"%>
<%@page import="com.fptuni.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <title>Edit info</title>
        <link rel="stylesheet" href="../css/user0.css" media="screen">
        <link rel="stylesheet" href="../css/Edit-info.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jquery.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/user0.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Site1",
            "logo": "images/Screenshot2022-02-08152835.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Edit info">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">

    <nav>    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </nav>
</head>
<body class="u-body u-xl-mode"><header class="u-clearfix u-header u-valign-middle u-header" id="sec-e70b"><a href="https://nicepage.com/c/sports-website-templates" class="u-image u-logo u-image-1" data-image-width="242" data-image-height="111">
            <img src="../images/Logo.png" class="u-logo-image u-logo-image-1">
        </a><nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
            <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
                <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
                    <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
                    <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
                    </g></svg>
                </a>
            </div>
            <div class="u-custom-menu u-nav-container">
                <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/home.jsp" style="padding: 22px 26px;"><i class="fa-solid fa-house"></i></a>
                    </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/contact.jsp" style="padding: 22px 26px;"><i class="fa-solid fa-envelope"></i></a>
                    </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/cart.jsp" style="padding: 22px 26px;"><i class="fa-solid fa-cart-shopping"></i></a>
                    </li><% if (session.getAttribute("usersession") == null) { %> <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;"><i class="fa-solid fa-right-to-bracket"></i></a>
                    </li><% } else { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="${pageContext.request.contextPath}/UserController/logout" style="padding: 22px 26px;"><i class="fa-solid fa-right-from-bracket"></i></a>
                    </li>
                    <% }%></ul>
            </div>
            <div class="u-custom-menu u-nav-container-collapse">
                <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                    <div class="u-inner-container-layout u-sidenav-overflow">
                        <div class="u-menu-close"></div>
                        <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html" style="padding: 22px 26px;">Home</a>
                            </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/contact.jsp" style="padding: 22px 26px;">Contact</a>
                            </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/cart.jsp" style="padding: 22px 26px;">Cart</a>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/edit-info.jsp" style="padding: 22px 26px;" title="User Information"> <i class="fa-solid fa-user"></i> User Info</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/UserController/logout" style="padding: 22px 26px;">Logout</a>
                            </li>   
                        </ul>
                    </div>
                </div>
                <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
            </div>
        </nav></header>
    <section class="u-clearfix u-palette-2-light-3" style="text-align: center"><h2 class="u-text u-text-1" style="font-weight: bold;"> Your information <span style="font-weight: 700;"></span> </h2>
    </section>
    <section class="u-clearfix u-palette-2-light-3 u-section-1" id="sec-8e09">

        <div class="u-clearfix u-sheet u-sheet-1">
            <div class="u-form u-form-1">

                <%  session = request.getSession();
                    User usersession = (User) session.getAttribute("usersession");
                    UserManager m = new UserManager();
                    User u = m.load(usersession.getUsername());
                %> 

                <div class="u-form-group u-form-name">
                    <label for="name-eb56" class="u-label">Username : <% out.print(u.getUsername());%></label>
                </div>
                <p></p>
                <div class="u-form-group u-form-group-4">
                    <label for="text-7b81" class="u-label">Name : <% out.print(u.getName());%></label>
                </div>
                <p></p>
                <div class="u-form-group u-form-group-5">
                    <label for="text-72ad" class="u-label">Phone : <% out.print(u.getPhone());%></label>
                </div>
                <p></p>
                <div class="u-form-group u-form-group-6">
                    <label for="text-739e" class="u-label">Email : <% out.print(u.getEmail());%></label>
                </div>
                <p></p>
                <div style="color: red">
                    <%
                        if (request.getAttribute("edit-msg5") != null && !request.getAttribute("edit-msg5").equals("")) {
                            out.print(request.getAttribute("edit-msg5"));
                        }
                    %>
                </div>
                <form action="<%= request.getContextPath()%>/User/home.jsp" method="POST"  style="padding: 10px;  left: 90px">
                    <div style="text-align: center;">
                        <input type="submit" name="home" value="Finish" class="u-btn u-button-style" >
                    </div>
                </form>
            </div>

        </div>
    </section>


    <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
    <tag:footer home="${home}"></tag:footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%-- 
    Document   : Womenpage
    Created on : Mar 5, 2022, 11:32:24 AM
    Author     : 84378
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="Croptop, Croptop, Croptop">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <title>Women</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/user0.css" media="screen">
        <link rel="stylesheet" href="../css/Women.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jquery.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/user0.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
        <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster:400">


        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Site1",
            "logo": "images/Screenshot2022-02-08152835.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Women">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">
    <nav>    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </nav>

    <style>
        .dropbtn {
            background-color: #3498DB;
            color: white;
            padding: 4px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .show {
            display: block;
        }


        .image {
            display: block;
            width: 100%;
            height: auto;
        }

        .overlay {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100%;
            width: 100%;
            opacity: 0;
            transition: .5s ease;
            background-color: transparent;
            box-shadow: 3px 3px 3px 3px grey;
            border-radius: 20px;
        }

        .text {
            color: black;
            font-size: 20px;
            position: absolute;
            top: 80%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            text-align: left;

            background-image: linear-gradient(to bottom,rgb(159 150 150 / 20%), rgb(255 255 255 / 2%));
        }
    </style>


    <script>

        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        window.onclick = function (event) {
            if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
        <c:forEach var="list" items="${list}" >
        function imgdetail${list.productID}() {

            document.getElementById("${list.productID}").style.opacity = "1";


        }
        function imgdetailoff${list.productID}() {
            document.getElementById("${list.productID}").style.opacity = "0";
        }
        </c:forEach>
    </script>


</head>
<body class="u-body u-xl-mode"><header class="u-clearfix u-header u-valign-middle u-header" id="sec-e70b"><a href="/prj301-assignment/User/home.jsp" class="u-image u-logo u-image-1" data-image-width="242" data-image-height="111">
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
                <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/home.jsp" style="padding: 22px 26px;" title="Home"><i class="fa-solid fa-house"></i></a>
                    </li><% if (session.getAttribute("usersession") == null) { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;" title="Contact"><i class="fa-solid fa-envelope"></i></a>
                    </li><% } else { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/contact.jsp" style="padding: 22px 26px;" title="Contact"><i class="fa-solid fa-envelope"></i></a>
                    </li><% }%><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/cart.jsp" style="padding: 22px 26px;" title="Cart"><i class="fa-solid fa-cart-shopping"></i></a>
                    </li><% if (session.getAttribute("usersession") == null) { %> <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;" title="Login"><i class="fa-solid fa-right-to-bracket"></i></a>
                    </li><% } else { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/edit-info.jsp" style="padding: 22px 26px;" title="User Information"> <i class="fa-solid fa-user"></i></a>
                    </li>
                    <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="${pageContext.request.contextPath}/UserController/logout" style="padding: 22px 26px;" title="Logout"><i class="fa-solid fa-right-from-bracket"></i></a>
                    </li><% }%></ul>
            </div>
            <div class="u-custom-menu u-nav-container-collapse">
                <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                    <div class="u-inner-container-layout u-sidenav-overflow">
                        <div class="u-menu-close"></div>
                        <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html" style="padding: 22px 26px;">Home</a>
                            </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Contact.html" style="padding: 22px 26px;">Contact</a>
                            </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Cart.html" style="padding: 22px 26px;">Cart</a>
                            </li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 22px 26px;">Login</a>
                            </li></ul>
                    </div>
                </div>
                <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
            </div>


        </nav></header>
        <%--<jsp:include flush="true" page="header.jsp"></jsp:include>--%>
    <section class="u-clearfix u-palette-2-light-3 u-section-1" id="sec-843a">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">

            <div style="padding-top: 3%"  >
                <form action="<%=request.getContextPath()%>/ProductController/search" > 
                    <input type="text" name="search">
                    <button type="submit">Search</button> 
                </form> 
            </div>

            <div class="u-border-1 u-border-palette-1-light-1 u-btn u-btn-round u-button-style u-palette-1-light-3 u-radius-3 u-text-palette-1-dark-2 u-btn-1" style="background-color:#fbeced ;box-shadow: none;" >
                <div class="dropdown" >
                    <button onclick="myFunction()" class="dropbtn">Sort by</button>
                    <div id="myDropdown" class="dropdown-content">
                        <a href="<%=request.getContextPath()%>/ProductController/listKidPriceOder">Decreasing price</a>

                        <a href="<%=request.getContextPath()%>/ProductController/listKidDateOder">Most recently date</a>

                    </div>
                </div>
            </div>





            <div class="container row">

                <c:if test="${list == null}">
                    <h5>Nothing to show</h5>
                </c:if>

                <c:forEach var="list" items="${list}">   


                    <!-- class="u-list u-list-1" -->
                    <div class="col-4" >
                        <div class="u-repeater u-repeater-1" style="padding-top:10%;">

                            <a href="<%=request.getContextPath()%>/ProductController/productdetail?id=${list.productID}&group=kid">
                                <div class="u-container-style u-list-item u-repeater-item">
                                    <div class="u-container-layout u-similar-container u-container-layout-1">

                                        <div style="width: 300px; height: 350px" onmouseout="imgdetailoff${list.productID}()" onmouseover="imgdetail${list.productID}()">
                                            <img  alt="Avatar" class="image" style="width: 100%; height: 100%;border-radius: 20px;  "  src="${list.imagesPath}" data-image-width="350" data-image-height="1025">

                                            <div  class="overlay" id="${list.productID}">
                                                <div class="text" style="width: 97%; height: 80%">
                                                    <h2 style="text-align: left;" class="u-custom-font u-font-lobster u-text u-text-default ">${list.name}&nbsp;</h2>
                                                    <h3 style="color: #CE272D; text-align: left;">${list.price}$</h3>
                                                    <h4 style="font-family: serif; height:20px;">${list.shortDetails}</h4>            
                                                </div>
                                                                                                    
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </a>    

                        </div>
                        


                    </div>

                </c:forEach>
            </div>



            <a href="<%=request.getContextPath()%>/ProductController/listKid" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-palette-1-light-3 u-radius-50 u-btn-2"><span class="u-icon"><svg class="u-svg-content" viewBox="0 0 30.727 30.727" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M29.994,10.183L15.363,24.812L0.733,10.184c-0.977-0.978-0.977-2.561,0-3.536c0.977-0.977,2.559-0.976,3.536,0   l11.095,11.093L26.461,6.647c0.977-0.976,2.559-0.976,3.535,0C30.971,7.624,30.971,9.206,29.994,10.183z"></path></svg><img></span>&nbsp;
                Scroll
            </a>
        </div>
    </section>


    <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
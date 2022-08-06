<%-- 
    Document   : productDetail
    Created on : Feb 28, 2022, 10:06:28 PM
    Author     : Acer.Lucas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <title>Ad_Product</title>
        <c:if test="${not empty requestScope}">
            <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
            <link rel="stylesheet" href="../css/Ad_Product.css" media="screen">
            <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
            <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>
        </c:if>
        <c:if test="${empty requestScope}">
            <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
            <link rel="stylesheet" href="../css/Ad_Product.css" media="screen">
            <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
            <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>
        </c:if>
        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">

        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Admin",
            "logo": "images/Logo.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Ad_Product">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">
    </head>
    <body class="u-body u-xl-mode">
        <header class="u-clearfix u-header u-valign-middle u-header" id="sec-e70b"><a href="/prj301-assignment/User/home.jsp" class="u-image u-logo u-image-1" data-image-width="242" data-image-height="111">
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
                    <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/home.jsp" style="padding: 22px 26px;">Home</a>
                        </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/contact.jsp" style="padding: 22px 26px;">Contact</a>
                        </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/cart.jsp" style="padding: 22px 26px;">Cart</a>
                        </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;">Login</a>
                        </li></ul>
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
            <%--<jsp:include page="header.jsp" flush="true"></jsp:include>--%>
        <section class="u-clearfix u-section-1" id="sec-2586">
            <div class="u-clearfix u-sheet u-valign-middle u-sheet-1"><!--product--><!--product_options_json--><!--{"source":""}--><!--/product_options_json--><!--product_item-->
                <div class="u-container-style u-expanded-width u-product u-product-1">
                    <div class="u-container-layout u-container-layout-1">
                        <c:set var="product" value="${requestScope.productDetail}"/>
                        <c:url var="productEdit" value="${request.contextPath}/ProductController/edit">
                            <c:param name="id" value="${product.productID}"></c:param>
                        </c:url>

                        <img class="u-image u-image-default u-image-1" src="../${product.imagesPath}" alt="" data-image-width="1600" data-image-height="1067">
                        <h2 class="u-align-left u-product-control u-text u-text-1">
                            <a class="u-product-title-link" href="#"><!--product_title_content-->${product.name}<!--/product_title_content--></a>
                        </h2><!--/product_title--><!--product_price-->
                        <div class="u-product-control u-product-price u-product-price-1">
                            <div class="u-price-wrapper u-spacing-10"><!--product_old_price-->
                                <div class="u-price u-text-palette-2-base" style="font-size: 1.875rem; font-weight: 700;"><!--product_regular_price_content-->Price:${product.price}<!--/product_regular_price_content--></div><!--/product_regular_price-->
                            </div>
                        </div><!--/product_price--><!--product_content-->
                        <div class="u-align-left u-product-control u-product-desc u-text u-text-2"><!--product_content_content-->
                            <p>${product.shortDetails}</p>
                            <p>${product.longDetails}</p><!--/product_content_content-->
                        </div><!--/product_content--><!--product_button--><!--options_json--><!--{"clickType":"go-to-page","content":"Confirm"}--><!--/options_json-->
                        <a href="${productEdit}" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-product-control u-text-black u-text-hover-white u-btn-2">
                            <!--product_button_content-->                        
                            Edit
                            <!--/product_button_content-->
                        </a><!--/product_button-->
                    </div>
                </div><!--/product_item--><!--/product-->
            </div>
        </section>



        <section class="u-backlink u-clearfix u-grey-80">
            <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
                <span>Website Templates</span>
            </a>
            <p class="u-text">
                <span>created with</span>
            </p>
            <a class="u-link" href="" target="_blank">
                <span>Website Builder Software</span>
            </a>. 
        </section>
    </body>
</html>

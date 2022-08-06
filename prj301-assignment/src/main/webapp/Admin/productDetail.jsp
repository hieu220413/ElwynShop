<%-- 
    Document   : productDetail
    Created on : Feb 28, 2022, 10:06:28 PM
    Author     : Acer.Lucas
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <!--<meta http-equiv="refresh" content="5">-->
        <title>Ad_Product</title>

        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/Ad_Product.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>

        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="u-body u-xl-mode" onload="reload()">

        <jsp:include flush="true" page="header.jsp"></jsp:include>
           
            <div style="margin-top: 2%; margin-left: 15%"><button onclick="history.back()" type="button" class="btn btn-dark"><i class="fa-solid fa-arrow-left-long"></i> Back</button></div>

            <section class="u-clearfix u-section-1" id="sec-2586">
                <div class="u-clearfix u-sheet u-valign-middle u-sheet-1"><!--product--><!--product_options_json--><!--{"source":""}--><!--/product_options_json--><!--product_item-->
                    <div class="u-container-style u-expanded-width u-product u-product-1">
                        <div class="u-container-layout u-container-layout-1">
                        <c:set var="product" value="${requestScope.productDetail}"/>
                        <c:url var="productEdit" value="${request.contextPath}/ProductController/edit">
                            <c:param name="id" value="${product.productID}"></c:param>
                        </c:url>

                        <img class="u-image u-image-default u-image-1" src="${product.imagesPath}" alt="" data-image-width="1600" data-image-height="1067">
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

        <script>
            function reload() {
                setTimeout(function () {
                    location.reload(true);
                }, 2000);
            }

        </script>

        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

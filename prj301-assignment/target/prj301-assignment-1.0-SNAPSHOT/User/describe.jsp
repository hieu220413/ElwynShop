<%-- 
    Document   : describe
    Created on : Mar 8, 2022, 9:36:42 AM
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
        <meta name="keywords" content="Croptop">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <title>Describe</title>
        <link rel="stylesheet" href="../css/user0.css" media="screen">
        <link rel="stylesheet" href="../css/Describe.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jquery.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepage.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
        <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster:400">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <meta property="og:title" content="Describe">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">
    </head>
    
    <body class="u-body u-xl-mode">
        <jsp:include flush="true" page="header.jsp"></jsp:include>
        <c:set var="describe" value="${requestScope.describe}"/>

        <section class="u-clearfix u-palette-2-light-3 u-section-1" id="sec-71bb">
            <div class="u-clearfix u-sheet u-sheet-1">
                <img class="u-image u-image-default u-image-1" src="${describe.imagesPath}" alt="" data-image-width="660" data-image-height="1025">
                <h2 class="u-custom-font u-font-lobster u-text u-text-default u-text-1">${describe.name}<br>
                </h2>
                <h4 class="u-font-lobster u-text u-text-2" style="font-family: sans-serif">${describe.shortDetails}<br>
                    <br>${describe.longDetails}
                </h4>
                <a href="<%=request.getContextPath()%>/CartController/addcart?id=${describe.productID}&group=${group}" class="u-active-none u-btn u-button-style u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-1"><span class="u-icon u-text-palette-2-base"><svg class="u-svg-content" viewBox="0 0 511.334 511.334" style="width: 1em; height: 1em;"><path d="m506.887 114.74c-3.979-5.097-10.086-8.076-16.553-8.076h-399.808l-5.943-66.207c-.972-10.827-10.046-19.123-20.916-19.123h-42.667c-11.598 0-21 9.402-21 21s9.402 21 21 21h23.468l23.018 256.439c.005.302-.01.599.007.903.047.806.152 1.594.286 2.37l.842 9.376c.016.177.034.354.055.529 2.552 22.11 13.851 41.267 30.19 54.21-8.466 10.812-13.532 24.407-13.532 39.172 0 35.106 28.561 63.667 63.666 63.667 35.106 0 63.667-28.561 63.667-63.667 0-7.605-1.345-14.9-3.801-21.667h114.936c-2.457 6.767-3.801 14.062-3.801 21.667 0 35.106 28.561 63.667 63.667 63.667s63.667-28.561 63.667-63.667-28.561-63.667-63.667-63.667h-234.526c-15.952 0-29.853-9.624-35.853-23.646l335.608-19.724c9.162-.538 16.914-6.966 19.141-15.87l42.67-170.67c1.567-6.272.158-12.918-3.821-18.016z"></path></svg><img></span>&nbsp;
                    Add to cart
                </a><span class="u-file-icon u-icon u-icon-2"></span>
                <h5 class="u-custom-font u-font-lobster u-text u-text-3" style="color: #CE272D; ">${describe.price} $</h5>
            </div>
        </section>



        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
    <tag:footer home="${home}"></tag:footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

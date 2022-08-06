<%-- 
    Document   : home
    Created on : Feb 28, 2022, 9:52:36 PM
    Author     : Acer.Lucas
--%>

<%@page import="com.fptuni.prj301.dbmanager.UserManager"%>
<%@page import="com.fptuni.prj301.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>

<!DOCTYPE html>
<html style="font-size: 16px;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="Women&amp;apos;s, Men&amp;apos;s, Kid&amp;apos;s">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <title>Home</title>
        <link rel="stylesheet" href="../css/user0.css" media="screen">
        <link rel="stylesheet" href="../css/Home.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jquery.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/user0.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
        <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster:400">


        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Site1",
            "logo": "../images/Screenshot2022-02-08152835.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Home">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">

    <nav>    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </nav>
</head>
<body class="u-body u-xl-mode">
    <jsp:include flush="true" page="header.jsp"></jsp:include>
        <section class="u-clearfix u-palette-2-light-3 u-section-1" id="sec-e64d">
            <div class="u-clearfix u-sheet u-sheet-1">
                <div class="u-list u-list-1">
                    <div class="u-repeater u-repeater-1">
                        <div class="u-container-style u-list-item u-repeater-item">
                            <div class="u-container-layout u-similar-container u-valign-top u-container-layout-1">
                                <h2 class="u-custom-font u-custom-item u-font-lobster u-text u-text-default u-text-1">Women's</h2>
                            </div>
                        </div>
                        <div class="u-container-style u-list-item u-repeater-item">
                            <div class="u-container-layout u-similar-container u-valign-top u-container-layout-2">
                                <h2 class="u-custom-font u-custom-item u-font-lobster u-text u-text-default u-text-2">Men's</h2>
                            </div>
                        </div>
                        <div class="u-container-style u-list-item u-repeater-item">
                            <div class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
                                <h2 class="u-custom-font u-custom-item u-font-lobster u-text u-text-default u-text-3">Kid's</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="u-list u-list-2">
                    <div class="u-repeater u-repeater-2">
                        <div class="u-container-style u-list-item u-repeater-item">
                            <div class="u-container-layout u-similar-container u-valign-top u-container-layout-4">
                                <a href="<%=request.getContextPath()%>/ProductController/listWomenCom" class="u-border-2 u-border-hover-palette-1-base u-border-palette-1-base u-btn u-btn-round u-button-style u-custom-item u-hover-palette-1-base u-none u-radius-50 u-btn-1">Check</a>
                        </div>
                    </div>

                    <div class="u-container-style u-list-item u-repeater-item">
                        <div class="u-container-layout u-similar-container u-valign-top u-container-layout-5">
                            <a href="<%=request.getContextPath()%>/ProductController/listMenCom" class="u-border-2 u-border-hover-palette-1-base u-border-palette-1-base u-btn u-btn-round u-button-style u-custom-item u-hover-palette-1-base u-none u-radius-50 u-btn-2">Check</a>
                        </div>
                    </div>
                    <div class="u-container-style u-list-item u-repeater-item">
                        <div class="u-container-layout u-similar-container u-valign-top u-container-layout-6">
                            <a href="<%=request.getContextPath()%>/ProductController/listKidCom" class="u-border-2 u-border-hover-palette-1-base u-border-palette-1-base u-btn u-btn-round u-button-style u-custom-item u-hover-palette-1-base u-none u-radius-50 u-btn-3">Check</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="carousel-5989" data-interval="5000" data-u-ride="carousel" class="u-carousel u-slider u-slider-1">
                <ol class="u-absolute-hcenter u-carousel-indicators u-carousel-indicators-1">
                    <li data-u-target="#carousel-5989" class="u-active u-grey-30 u-shape-circle" data-u-slide-to="0" style="width: 10px; height: 10px;"></li>
                    <li data-u-target="#carousel-5989" class="u-grey-30 u-shape-circle" data-u-slide-to="1" style="width: 10px; height: 10px;"></li>
                    <li data-u-target="#carousel-5989" class="u-grey-30 u-shape-circle" data-u-slide-to="1" style="width: 10px; height: 10px;"></li><!-- comment -->
                    <li data-u-target="#carousel-5989" class="u-grey-30 u-shape-circle" data-u-slide-to="1" style="width: 10px; height: 10px;"></li>
                </ol>
                <div class="u-carousel-inner" role="listbox">
                    <div class="u-active u-align-center u-carousel-item u-container-style u-slide">

                        <div class="u-container-layout u-valign-top u-container-layout-8">
                            <div><img class="u-image u-image-circle u-image-1" data-image-width="1280" data-image-height="716" src="../images/Binh.png" alt="alt"/></div>

                            <p class="u-large-text u-text u-text-variant u-text-6">"What you wear is how you present yourself to the world, especially today, when human contacts are so quick. Fashion is instant language."</p>
                            <h4 class="u-text u-text-default u-text-7">Quoc Binh <br>
                            </h4>
                            <h6 class="u-text u-text-default u-text-8">President</h6>
                        </div>
                    </div>
                    <div class="u-align-center u-carousel-item u-container-style u-slide">

                        <div class="u-container-layout u-valign-top u-container-layout-8">
                            <div><img class="u-image u-image-circle u-image-1" data-image-width="1280" data-image-height="716" src="../images/default-logo.jpg" alt="alt"/></div>
                            <p class="u-large-text u-text u-text-variant u-text-6">"You gotta have style. It helps you get down the stairs. It helps you get up in the morning. It’s a way of life."</p>
                            <h4 class="u-text u-text-default u-text-7">Tai Chau <br>
                            </h4>
                            <h6 class="u-text u-text-default u-text-8">Founder</h6>
                        </div>
                    </div>
                    <div class=" u-align-center u-carousel-item u-container-style u-slide">
                        <div class="u-container-layout u-container-layout-7">
                            <div><img class="u-image u-image-circle u-image-1" data-image-width="1280" data-image-height="716" src="../images/hieu.jpg" alt="alt"/></div>
                            <p class="u-large-text u-text u-text-variant u-text-4">" Fashions fade, style is eternal " Welcome to our fashion brand. We hope you all have the best experience while surfing the website. We are going to support all your wishes. Enjoy your time. </p>
                            <h4 class="u-text u-text-default u-text-7">Hieu Nguyen <br>
                            </h4>
                            <h6 class="u-text u-text-default u-text-5">Co-founder</h6>
                        </div>
                    </div>

                    <div class="u-align-center u-carousel-item u-container-style u-slide">

                        <div class="u-container-layout u-valign-top u-container-layout-8">
                            <div><img class="u-image u-image-circle u-image-1" data-image-width="1280" data-image-height="716" src="../images/Quang.jpg" alt="alt"/></div>

                            <p class="u-large-text u-text u-text-variant u-text-6">" We work hard and try hard to create more and more cloths with specific styles to give you the best choose from our brand"</p>
                            <h4 class="u-text u-text-default u-text-7">Quang Pham <br>
                            </h4>
                            <h6 class="u-text u-text-default u-text-8">CEO</h6>
                        </div>
                    </div>
                </div>
                <a class="u-absolute-vcenter u-carousel-control u-carousel-control-prev u-grey-70 u-icon-circle u-spacing-10 u-carousel-control-1" href="#carousel-5989" role="button" data-u-slide="prev">
                    <span aria-hidden="true">
                        <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
                                                                 c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
                                                                 c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
                    </span>
                    <span class="sr-only">
                        <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
                                                                 c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
                                                                 c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
                    </span>
                </a>
                <a class="u-absolute-vcenter u-carousel-control u-carousel-control-next u-grey-70 u-icon-circle u-spacing-10 u-carousel-control-2" href="#carousel-5989" role="button" data-u-slide="next">
                    <span aria-hidden="true">
                        <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
                                                                 L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
                                                                 c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
                    </span>
                    <span class="sr-only">
                        <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
                                                                 L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
                                                                 c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
                    </span>
                </a>
                <a class="u-absolute-vcenter u-carousel-control u-carousel-control-next u-grey-70 u-icon-circle u-spacing-10 u-carousel-control-2" href="#carousel-5989" role="button" data-u-slide="next">
                    <span aria-hidden="true">
                        <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
                                                                 L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
                                                                 c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
                    </span>
                    <span class="sr-only">
                        <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
                                                                 L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
                                                                 c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
                    </span>
                </a>
            </div>
        </div>
    </section>



    <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
    <tag:footer home="${home}"></tag:footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>

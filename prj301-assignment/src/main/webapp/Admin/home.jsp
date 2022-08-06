<%-- 
    Document   : home
    Created on : Feb 28, 2022, 10:05:26 PM
    Author     : Acer.Lucas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Ad_Home</title>


        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/Ad_Home.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>

        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Admin",
            "logo": "images/default-logo.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Ad_Home">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <style>
            table tr{
                border-bottom: 1px dashed #21e5dc;

            }
            table tr td:nth-child(2){
                color: red;
                font-family: sans-serif;
                font-style: oblique;

            }
            table tr td:nth-child(1){
                font-weight: bolder

            }
            .content{
                display: flex;
                justify-content: center;
                align-content: center;
            }
            th{
                font-size: 30px
            }
            .container{
                height: 100%;
                margin-top: 8%;
                margin-bottom: 8%
            }
            .row{
                margin: auto 0;
                width: 100%
            }
        </style>
    </head>
    <body class="u-body u-xl-mode">

        <!-------  Header  ------->
        <jsp:include flush="true" page="header.jsp"></jsp:include>
            <!-----------  Basic info  ----------->

            <div class="container">
                <div class="row">
                    <div class="col-lg-6" style="text-align: center">
                        <img src="../images/Logo.png" alt="" style="width: 70%; height: auto; margin: 0px">

                    </div>
                    <div class="col-lg-6 content">
                        <table>
                            <th>Shop Information</th>
                            <tr>
                                <td>Name</td>
                                <td>Elwyn Shop</td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td>0909090909</td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>Ho Chi Minh, Viet Nam</td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
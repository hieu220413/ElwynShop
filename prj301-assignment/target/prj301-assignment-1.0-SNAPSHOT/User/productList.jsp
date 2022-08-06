<%-- 
    Document   : productList
    Created on : Mar 6, 2022, 9:15:51 AM
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
        <title>Ad_Home</title>


        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/Ad_Home.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>

        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">


        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Admin",
            "logo": "images/logo.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Ad_Home">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">
    </head>

    <body class="u-body u-xl-mode">

        <!-------  Header  ------->
        <jsp:include flush="true" page="header.jsp"></jsp:include>

            <section class="u-align-center u-clearfix u-section-1" id="sec-4a2e">
                <div class="u-clearfix u-sheet u-sheet-1">
                    <div class="u-expanded-width u-tab-links-align-justify u-tabs u-tabs-1">
                        <div class="u-tab-content">
                            <div class="u-align-center u-container-style u-shape-rectangle u-tab-active u-tab-pane u-tab-pane-2" id="tab-0da5" role="tabpanel" aria-labelledby="link-tab-0da5">
                                <div class="u-container-layout u-container-layout-2">
                                    <h4 class="u-text u-text-default u-text-2">Basic Settings</h4>
                                    <div class="u-expanded-width u-table u-table-responsive u-table-1">
                                        <table class="u-table-entity">
                                            <colgroup>
                                                <col width="21.1%">
                                                <col width="28.1%">
                                                <col width="25.8%">
                                                <col width="25%">
                                            </colgroup>
                                            <tbody class="u-table-alt-grey-5 u-table-body">
                                                <tr style="height: 58px;">
                                                    <td class="u-table-cell">Name</td>
                                                    <td class="u-table-cell">Image</td>
                                                    <td class="u-table-cell">Price</td>
                                                    <td class="u-table-cell">Action</td>
                                                </tr>
                                            <c:forEach var="product" items="${listProduct}">
                                                <c:if test="${row%2==0}">
                                                    <c:set var="color" value="#ffffff"/>
                                                </c:if>
                                                <c:if test="${row%2==1}">
                                                    <c:set var="color" value="#eeeeee"/>
                                                </c:if>

                                                <c:url var="productDetail" value="${request.contextPath}/ProductController/detail">
                                                    <c:param name="id" value="${product.productID}"></c:param>
                                                </c:url>

                                                <c:url var="productEdit" value="${request.contextPath}/ProductController/edit">
                                                    <c:param name="id" value="${product.productID}"></c:param>
                                                </c:url>

                                                <tr style="height: 51px;">
                                                    <td class="u-table-cell">${product.name}</td>
                                                    <td class="u-table-cell"><img src="../${product.imagesPath}" width="42" height="42" style="vertical-align:middle;margin:0px 50px"></td>
                                                    <td class="u-table-cell">${product.price}</td>
                                                    <td class="u-table-cell">
                                                        <a href="${productDetail}" data-page-id="870128389" class="u-active-none u-border-2 u-border-hover-palette-1-base u-bottom-left-radius-0 u-bottom-right-radius-0 u-btn u-button-link u-button-style u-hover-none u-none u-radius-0 u-text-palette-1-base u-top-left-radius-0 u-top-right-radius-0 u-btn-3">Description</a>
                                                    </td>
                                                </tr>
                                                <c:set var="row" value="${row+1}"/>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <a href="https://nicepage.com/website-builder" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-4">1</a>
                                <a href="https://nicepage.com/website-builder" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-5">2</a>
                                <a href="https://nicepage.com/website-builder" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-6">3</a>
                                <a href="https://nicepage.com/website-builder" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-7">4</a>
                                <a href="https://nicepage.com/html-website-builder" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-8">Add new product</a>
                            </div>
                        </div>
                    </div>
                </div>
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

<%-- 
    Document   : uploadfile
    Created on : Mar 12, 2022, 12:42:16 AM
    Author     : hieunguyen
--%>
<%@page import="com.fptuni.prj301.model.Product"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
        <title>Edit_Image</title>
        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/EditProduct.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.6.5, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Admin",
            "logo": "../images/Logo.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Ad_Product">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">
    </head>
    <body class="u-body u-xl-mode">
        <jsp:include flush="true" page="header.jsp"></jsp:include>

            <section class="u-clearfix u-section-1" id="sec-2586">
                <div class="u-clearfix u-sheet u-valign-middle u-sheet-1"><!--product--><!--product_options_json--><!--{"source":""}--><!--/product_options_json--><!--product_item-->
                    <div class="u-container-style u-expanded-width u-product u-product-1">
                        <div class="u-container-layout u-container-layout-1">
                            <div class="u-form-1" style="margin-top: 10%; padding-bottom: -100px">
                            <c:set var="product" value="${requestScope.productEdit}"/>
                            <c:url var="imgSave" value="${request.contextPath}/ProductController/saveImg">
                            </c:url>
                            <h3>Change Image of ${product.name}:</h3> <br /><!-- comment -->

                            <form action="${imgSave}" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${product.productID}">
                                <label for="select-b7db" class="u-label">Supply for group:</label>
                                <div class="u-form-select-wrapper">
                                    <select id="select-b7db" name="group" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="required">
                                        <option <value="Kid">Kid</option>
                                        <option value="Men">Men</option>
                                        <option value="Women">Women</option>
                                    </select>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                                </div><!-- comment -->
                                <input type="hidden" name="category" value="${product.category.name}">
                                Select a file to upload: <input type="file" name="file" size="50" />
                                <br />
                                <input style="text-align: center" type="submit" value="Upload File" />
                            </form>
                        </div>  
                        <img style="display: block;text-align: justify-all" class="u-image u-image-default u-image-1" src="${product.imagesPath}" alt="" data-image-width="1600" data-image-height="100%">

                    </div>
                </div>
            </div>
        </section>
        <section class="u-align-center u-clearfix u-section-2" id="sec-d453">
            <div class="u-clearfix u-sheet u-sheet-1"></div>
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
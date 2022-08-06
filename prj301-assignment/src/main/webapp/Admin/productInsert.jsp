<%@page import="com.fptuni.prj301.model.Product"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Inser_Product</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="u-body u-xl-mode">
        <jsp:include flush="true" page="header.jsp"></jsp:include>
            
            <div style="margin-top: 2%; margin-left: 15%"><button onclick="history.back()" type="button" class="btn btn-dark"><i class="fa-solid fa-arrow-left-long"></i> Back</button></div>

            <section class="u-clearfix u-section-1" id="sec-2586">
                <div class="u-clearfix u-sheet u-valign-middle u-sheet-1"><!--product--><!--product_options_json--><!--{"source":""}--><!--/product_options_json--><!--product_item-->
                    <div class="u-container-style u-expanded-width u-product u-product-1">
                        <div class="u-container-layout u-container-layout-1">
                        <c:url var="saveProductInsert" value="${request.contextPath}/ProductController/saveInsert" >
                        </c:url>
                        <c:set var="idInsert" value="${requestScope.id}" />
                        <h2 style="text-align: center;">Add Product</h2>
                        <div class="u-form"> 
                            <form action="${saveProductInsert}" method="POST" style="padding: 9px;" name="form" enctype="multipart/form-data">
                                <div class="u-form-group u-form-name u-label-left">
                                    <label for="name-3b9a" class="u-label">Name</label>
                                    <input type="number" value="${idInsert}" name="id" class="u-hidden">
                                    <input type="text" placeholder="Enter product name" id="name-3b9a" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                                </div>
                                <div class="u-form-email u-form-group u-label-left">
                                    <label for="email-3b9a" class="u-label">Price</label>
                                    <input type="number" placeholder="Enter product price" id="email-3b9a" name="price" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                                </div>
                                <div class="u-form-group u-form-select u-label-left u-form-group-3">
                                    <label for="select-b7db" class="u-label">Gender</label>
                                    <div class="u-form-select-wrapper">
                                        <select id="select-b7db" name="gender" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="required">
                                            <option <value="male">male</option>
                                            <option value="female">female</option>
                                        </select>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                                    </div>
                                </div>
                                <div class="u-form-group u-form-select u-label-left u-form-group-3">
                                    <label for="select-b7db" class="u-label">Supply for group:</label>
                                    <div class="u-form-select-wrapper">
                                        <select id="select-b7db" name="group" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="required">
                                            <option <value="Kid">Kid</option>
                                            <option value="Men">Men</option>
                                            <option value="Women">Women</option>
                                        </select>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                                    </div>
                                </div>    
                                <div class="u-form-partition-factor-1 u-form-group u-label-left">
                                    <label for="message" class="u-label">Quantity</label>
                                    <input type="number" placeholder="Enter product quantity" id="number" name="quantity" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                                </div>
                                <div class="u-form-partition-factor-1 u-form-group u-label-left">
                                    <jsp:useBean id="now" class="java.util.Date"/>    

                                    <label for="message" class="u-label">Publish date:</label>
                                    <input type="date" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" name="publishDate" required="">
                                </div>

                                <div class="u-form-group u-form-select u-label-left u-form-group-3">
                                    <label for="select-b7db" class="u-label">Category</label>
                                    <div class="u-form-select-wrapper">
                                        <select id="select-b7db" name="category" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="required">
                                            <c:forEach var="category" items="${category}" >
                                                <option value="${category.name}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                                    </div>
                                </div>
                                <div class="u-form-group u-form-message u-label-left">
                                    <label for="message-3b9a" class="u-label">Image upload:</label><br />
                                    Select a file to upload:
                                    <input type="file" name="file" size="50" />
                                    <br />
                                </div>
                                <div class="u-form-group u-form-message u-label-left">
                                    <label for="message-3b9a" class="u-label">Short Description</label>
                                    <textarea rows="2" cols="20" id="message-3b9a" name="shortDetails" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">${product.shortDetails}</textarea>
                                </div>
                                <div class="u-form-group u-form-message u-label-left">
                                    <label for="message-3b9a" class="u-label">Long Description</label>

                                    <textarea rows="5" cols="50" id="message-3b9a" name="longDetails" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">${product.longDetails}</textarea>

                                </div>

                                <input style="text-align: center;" type="submit" value="submit" class="u-btn u-form-submit u-btn-submit" >
                            </form>
                        </div>
                    </div>
                </div><!--/product_item--><!--/product-->
            </div>
        </section>
        <section class="u-align-center u-clearfix u-section-2" id="sec-d453">
            <div class="u-clearfix u-sheet u-sheet-1"></div>
        </section>



        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>



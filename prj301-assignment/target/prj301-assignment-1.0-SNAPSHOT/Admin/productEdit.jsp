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
        <title>Edit_Product</title>
        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/EditProduct.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.6.5, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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
            <div style="margin-top: 2%; margin-left: 15%"><button onclick="history.back()" type="button" class="btn btn-dark"><i class="fa-solid fa-arrow-left-long"></i> Back</button></div>

            <section class="u-clearfix u-section-1" id="sec-2586">
                <div class="u-clearfix u-sheet u-valign-middle u-sheet-1"><!--product--><!--product_options_json--><!--{"source":""}--><!--/product_options_json--><!--product_item-->
                    <div class="u-container-style u-expanded-width u-product u-product-1">
                        <div class="u-container-layout u-container-layout-1">

                        <c:set var="product" value="${requestScope.productEdit}"/>

                        <c:url var="productSave" value="${request.contextPath}/ProductController/save">
                        </c:url>
                        <c:url var="changeImage" value="${request.contextPath}/ProductController/changeImg">
                            <c:param name="productId" value="${product.productID}"></c:param>
                        </c:url>
                        <h2 class="u-text u-text-default u-text-1 ">Edit ${product.name}</h2>
                        <div class="u-form-1">
                            <form action="${productSave}" target="_self" method="GET" style=" padding: 9px;" source="custom" name="form">

                                <div class="u-form-group u-form-name u-label-left">
                                    <input type="text" value="${product.productID}" id="name-3b9a" name="idEdit" class="u-hidden u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                                    <label for="name-3b9a" class="u-label">Name</label>
                                    <input type="text" value="${product.name}" id="name-3b9a" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                                </div>
                                <div class="u-form-partition-factor-1 u-form-group u-label-left">
                                    <label for="message" class="u-label">Price</label>
                                    <input type="number" value="${product.price}" id="number" name="price" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                                </div>
                                <div class="u-form-group u-form-select u-label-left u-form-group-3">
                                    <label for="select-b7db" class="u-label">Gender</label>
                                    <div class="u-form-select-wrapper">
                                        <select id="select-b7db" name="gender" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="required">
                                            <jsp:useBean id="product" type="com.fptuni.prj301.model.Product" />
                                            <option <c:if test='<%=product.getGender().equalsIgnoreCase("male")%>'> selected </c:if> value="male">male</option>
                                            <option <c:if test='<%=product.getGender().equalsIgnoreCase("female")%>'> selected </c:if> value="female">female</option>
                                            <option <c:if test='<%=product.getGender().equalsIgnoreCase("boy")%>'> selected </c:if> value="boy">boy</option><!-- comment -->
                                            <option <c:if test='<%=product.getGender().equalsIgnoreCase("girl")%>'> selected </c:if> value="girl">girl</option>
                                            </select>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                                        </div>
                                    </div>
                                    <div class="u-form-partition-factor-1 u-form-group u-label-left">
                                        <label for="message" class="u-label">Quantity</label>
                                        <input type="number" value="${product.quantity}" id="number" name="quantity" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
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
                                                <c:if test="${product.category.name == category.name}">
                                                    <option selected value="${category.name}">${category.name}</option>
                                                </c:if>
                                                <option value="${category.name}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                                    </div>
                                </div>

                                <div class="u-form-group u-form-message u-label-left">
                                    <label for="message-3b9a" class="u-label">Short Description</label>
                                    <textarea rows="2" cols="20" id="message-3b9a" name="shortDetails" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">${product.shortDetails}</textarea>
                                </div>
                                <div class="u-form-group u-form-message u-label-left">
                                    <label for="message-3b9a" class="u-label">Long Description</label>
                                    <textarea rows="5" cols="50" id="message-3b9a" name="longDetails" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" >${product.longDetails}</textarea>
                                </div>
                                <div style="display: block;text-align: center"class="u-form-group u-form-submit u-label-left">
                                    <label class="u-label u-label-5"></label>
                                    <input type="submit" value="save" class="u-btn u-btn-submit u-button-style">
                                </div>
                            </form>
                        </div>
                        <img style="display: block;text-align: justify-all" class="u-image u-image-default u-image-1" src="${product.imagesPath}" alt="" data-image-width="1600" data-image-height="100%">
                        <a href="${changeImage}" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-6 u-align-center u-btn-2">Change image</a>
                    </div>

                </div><!--/product_item--><!--/product-->
            </div>
        </secti
        <section class="u-align-center u-clearfix u-section-2" id="sec-d453">
            <div class="u-clearfix u-sheet u-sheet-1"></div>
        </section>



        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%-- 
    Document   : productList
    Created on : Mar 6, 2022, 9:15:51 AM
    Author     : Acer.Lucas
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>List_Order</title>
        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/Ad_Home.css" media="screen">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>        
        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            /* Style The Dropdown Button */
            .dropbtn {
                background-color: grey;
                color: white;
                padding: 4px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            .dropbtn i:hover{
                color: black;
            }
            /* The container <div> - needed to position the dropdown content */
            .dropdown {
                position: relative;
                display: inline-block;

            }

            /* Dropdown Content (Hidden by Default) */
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            /* Links inside the dropdown */
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            /* Change color of dropdown links on hover */
            .dropdown-content a:hover {
                background-color: #f1f1f1
            }
        </style>

        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Admin",
            "logo": "images/logo.png"
            }</script>
        <script>
            function showSortAmount() {
                var click = document.getElementById('myDivAmount');
                if (click.style.display == 'block') {
                    document.getElementById('myDivAmount').style.display = 'none';
                } else {
                    document.getElementById('myDivAmount').style.display = 'block';
                }
            }
            function showSortDate() {
                var click = document.getElementById('myDivDate');
                if (click.style.display == 'block') {
                    document.getElementById('myDivDate').style.display = 'none';
                } else {
                    document.getElementById('myDivDate').style.display = 'block';
                }
            }
        </script>        
        <meta name="the
              me-color" content="#478ac9">
        <meta property="og:title" content="Ad_Home">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">
    </head>

    <body class="u-body u-xl-mode">

        <!-------  Header  ------->
        <jsp:include flush="true" page="header.jsp"></jsp:include>

            <section class="u-align-center u-clearfix u-section-1" id="sec-4a2e" style="margin-bottom: -65px">
                <div class="u-clearfix u-sheet u-sheet-1">
                    <div class="u-expanded-width u-tab-links-align-justify u-tabs u-tabs-1">
                        <form action="<%= request.getContextPath()%>/OrderController/search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                        <input type="text" name="username" autocomplete="off" placeholder="by username">
                        <input class="btn btn-primary" type="submit" value="Search">
                    </form>
                    <div class="u-tab-content">
                        <div class="u-align-center u-container-style u-shape-rectangle u-tab-active u-tab-pane u-tab-pane-2" id="tab-0da5" role="tabpanel" aria-labelledby="link-tab-0da5">
                            <div class="u-container-layout u-container-layout-2">
                                <div class="u-expanded-width u-table u-table-responsive u-table-4">
                                    <table class="u-table-entity table-hover">
                                        <colgroup>
                                            <col width="15%">
                                            <col width="25%">
                                            <col width="16%">
                                            <col width="16%">
                                            <col width="15%">
                                            <col width="18%">
                                        </colgroup>
                                        <thead class="u-grey-50 u-table-header u-table-header-1">
                                            <c:url var="sortDate" value="${request.contextPath}/OrderController/sort">
                                                <c:param name="sort" value="date"></c:param>
                                            </c:url>
                                            <c:url var="sortAmount" value="${request.contextPath}/OrderController/sort">
                                                <c:param name="sort" value="amount"></c:param>
                                            </c:url>
                                            <c:url var="searchDate" value="${request.contextPath}/OrderController/searchDate">
                                                <c:param name="sort" value="amount"></c:param>
                                            </c:url>
                                            <tr style="height: 21px;">
                                                <th class="u-border-1 u-border-grey-50 u-table-cell">Order ID</th>
                                                <th class="u-border-1 u-border-grey-50 u-table-cell">Username</th>
                                                <th class="u-border-1 u-border-grey-50 u-table-cell">Amount
                                                    <div class="dropdown delay-5s">
                                                        <button class="dropbtn" onclick="showSortAmount()" ><i class="fa fa-sort"></i></button>
                                                        <div id="myDivAmount" class="dropdown-content">
                                                            <li class="u-nav-item" style="width:100%"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="${sortAmount}&type=ASC">ASC <i class='fas fa-arrow-up'></i></a></li>
                                                            <li class="u-nav-item" style="width:100%"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="${sortAmount}&type=DESC">DECS <i class='fas fa-arrow-down'></i></a></li>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th class="u-border-1 u-border-grey-50 u-table-cell">Payment Method</th>
                                                <th class="u-border-1 u-border-grey-50 u-table-cell">Date
                                                    <div class="dropdown">
                                                        <button class="dropbtn" onclick="showSortDate()"><i class="fa fa-sort"></i></button>
                                                        <div id="myDivDate" class="dropdown-content">
                                                            <li class="u-nav-item" style="width:100%"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="${sortDate}&type=ASC">ASC <i class='fas fa-arrow-up'></i></a></li>
                                                            <li class="u-nav-item" style="width:100%"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="${sortDate}&type=DESC">DESC <i class='fas fa-arrow-down'></i></a></li>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th class="u-border-1 u-border-grey-50 u-table-cell">Details</th>
                                            </tr>
                                        </thead>
                                        <tbody class="u-table-alt-grey-5 u-table-body">
                                            <c:forEach var="order" items="${list}" varStatus="counter">
                                                <c:if test="${row%2==0}">
                                                    <c:set var="color" value="#ffffff"/>
                                                </c:if>
                                                <c:if test="${row%2==1}">
                                                    <c:set var="color" value="#eeeeee"/>
                                                </c:if>
                                                 <c:url var="orderDetail" value="${request.contextPath}/OrderController/detail">
                                                    <c:param name="id" value="${order.orderId}"></c:param>
                                                </c:url>
                                                <tr style="height: 75px;">
                                                    <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${order.orderId}</td>
                                                    <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${order.userId.username}</td>
                                                    <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell"><fmt:formatNumber type = "number" 
                                                                      maxFractionDigits = "0" value = "${order.totalAmount}" />$</td>
                                                    <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${order.paymentMethod}</td>
                                                    <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell"><fmt:formatDate value="${order.date}" pattern="dd-MM-yyyy" /></td>
                                                    <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell"><a href="${orderDetail}" data-page-id="870128389" class="u-active-none u-border-2 u-border-hover-palette-1-base u-bottom-left-radius-0 u-bottom-right-radius-0 u-btn u-button-link u-button-style u-hover-none u-none u-radius-0 u-text-palette-1-base u-top-left-radius-0 u-top-right-radius-0 u-btn-3">List product</a></td>
                                                </tr>
                                                <c:set var="row" value="${row+1}"/>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:set var="total" value="0"/>
                                <c:forEach var="order" items="${list}" varStatus="counter">

                                    <c:set var="total" value="${total + order.totalAmount}"/>
                                </c:forEach>

                                <c:set var="totalMonth" value="0"/>
                                <c:forEach var="orderMonth" items="${listMonth}" varStatus="counter">
                                    <c:set var="totalMonth" value="${totalMonth + orderMonth.totalAmount}"/>
                                </c:forEach>

                                <c:set var="totalYear" value="0"/>
                                <c:forEach var="orderYear" items="${listYear}" varStatus="counter">
                                    <c:set var="totalYear" value="${totalYear + orderYear.totalAmount}"/>
                                </c:forEach>

                                <c:if test="${not empty requestScope.search_message}">
                                    <div class="alert alert-danger" role="alert" style="text-align: center">
                                        <i class='fas fa-exclamation-circle' style='color:red'></i> ${requestScope.search_message}
                                    </div>
                                </c:if>
                                <h4 style="margin-top:2%; text-align: left">Total: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${total}" />$</h4>
                                <h4 style="margin-top:2%; text-align: left">Total income of ${month}: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${totalMonth}" />$</h4>
                                <h4 style="margin-top:2%; text-align: left">Total income of ${year}: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${totalYear}" />$</h4>
                                
                                
                                
                                <div style="display: flex; align-content: center; justify-content: center ">
                                    <!--active is current page-->
                                    <nav aria-label="..." >
                                        <ul class="pagination" ${(requestScope.disableNav == 0 || requestScope.sorted != null) ? "style=\"display:none\"" : ""}>
                                            <li class="page-item ${requestScope.currentPage == 1 ? "disabled" : ""}" >
                                                <a class="page-link" href="<%= request.getContextPath()%>/OrderController/list?page=${requestScope.currentPage - 1}" tabindex="-1">Previous</a>
                                            </li>
                                            <c:forEach begin="1" end="${requestScope.endPage}" var="page">
                                                <li class="page-item ${requestScope.currentPage == page ? "active" : ""}">
                                                    <a class="page-link " href="<%= request.getContextPath()%>/OrderController/list?page=${page}">${page}<span class="sr-only"></span></a>
                                                </li>
                                            </c:forEach>

                                            <li class=" page-item ${requestScope.currentPage == requestScope.endPage ? "disabled" : ""}">
                                                <a class="page-link" href="<%= request.getContextPath()%>/OrderController/list?page=${requestScope.currentPage + 1}">Next</a>
                                            </li>

                                        </ul>
                                        <ul class="pagination" ${requestScope.sorted == null ? "style=\"display:none\"" : ""}>
                                            <li class="page-item ${requestScope.currentPage == 1 ? "disabled" : ""}">
                                                <a class="page-link" href="<%= request.getContextPath()%>/OrderController/sort?page=${requestScope.currentPage - 1}&sort=${sort}&type=${type}" tabindex="-1">Previous</a>
                                            </li>
                                            <c:forEach begin="1" end="${requestScope.endPage}" var="page">
                                                <li class="page-item ${requestScope.currentPage == page ? "active" : ""}">
                                                    <a class="page-link " href="<%= request.getContextPath()%>/OrderController/sort?page=${page}&sort=${requestScope.sort}&type=${requestScope.type}">${page}<span class="sr-only"></span></a>
                                                </li>
                                            </c:forEach>

                                            <li class=" page-item ${requestScope.currentPage == requestScope.endPage ? "disabled" : ""}">
                                                <a class="page-link" href="<%= request.getContextPath()%>/OrderController/sort?page=${requestScope.currentPage + 1}&sort=${requestScope.sort}&type=${requestScope.type}">Next</a>
                                            </li>

                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

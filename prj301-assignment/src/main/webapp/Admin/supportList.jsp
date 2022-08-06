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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <style>
            /* Dropdown Button */
            .dropbtn {
                background-color: #808080;
                color: white;
                padding: 4px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            /* Dropdown button on hover & focus */
            .dropbtn:hover, .dropbtn:focus {
                background-color: #737373;
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
                background-color: #f1f1f1;
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
                background-color: #de382c;
                color: #ffffff
            }

            /* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
            .show {
                display:block;
            }

        </style>

    </head>
    <body class="u-body u-xl-mode">

        <!-------  Header  ------->
        <jsp:include flush="true" page="header.jsp"></jsp:include>


            <section class="u-align-center u-clearfix u-section-1" id="sec-4a2e">
                <div class="u-clearfix u-sheet u-sheet-1">
                    <div class="u-expanded-width u-tab-links-align-justify u-tabs u-tabs-1">



                        <div>
                            <form action="search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                                <input type="text" name="search" autocomplete="off" placeholder="by name, phone" value="${requestScope.search}">
                            <input class="btn btn-primary" type="submit" value="Search">
                        </form>
                    </div>
                    <div class="u-tab-content">

                        <!-----------  Support  ----------->

                        <div class="u-align-center u-table u-table-responsive u-table-4">
                            <table class="u-table-entity table-hover table-striped table-responsive ">
                                <colgroup>
                                    <col width="5%">
                                    <col width="12%">
                                    <col width="20%">
                                    <col width="10%">
                                    <col width="35%">
                                    <col width="12%">
                                    <col width="10%">
                                </colgroup>
                                <thead class="u-grey-50 u-table-header-1">
                                    <tr>
                                        <th>ID</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Description</th>
                                        <th>
                                            <c:url var="sortDateAsc" value="${request.contextPath}/SupportController/list">
                                                <c:param name="sort" value="asc"></c:param>
                                            </c:url>
                                            <c:url var="sortDateDesc" value="${request.contextPath}/SupportController/list">
                                                <c:param name="sort" value="desc"></c:param>
                                            </c:url>
<!--                                            <a href="${sortDate}">Date <i class="fa fa-sort"></i></a>-->
                                            <div class="dropdown">
                                                <button onmouseover="myFunction()" class="dropbtn">Date <i class="fa fa-sort"></i></button>
                                                <div id="myDropdown" class="dropdown-content">
                                                    <a href="${sortDateAsc}">ASC <i class='fas fa-arrow-up'></i></a>
                                                    <a href="${sortDateDesc}">DESC <i class='fas fa-arrow-down'></i></a>
                                                </div>
                                            </div>
                                        </th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="u-table-body">

                                    <c:forEach var="support" items="${requestScope.listSupportPaging}" varStatus="counter">
                                        <tr style="height: 75px;">
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${support.supportId}</td>
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${support.user.name}</td>
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${support.user.email}</td>
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${support.user.phone}</td>
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${support.details}</td>
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">${support.dates}</td>
                                            <c:url var="removeSupport" value="${request.contextPath}/SupportController/remove">
                                                <c:param name="supportId" value="${support.supportId}"></c:param>
                                            </c:url>
                                            <td class="u-border-1 u-border-grey-40 u-border-no-left u-border-no-right u-table-cell">
                                                <a href="${removeSupport}" class="u-active-none u-border-2 u-border-hover-palette-1-base u-btn u-button-link u-button-style u-hover-none u-none  u-text-palette-1-base u-btn-3" onclick="return confirmMessage()"><i class="fa-solid fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>

                        <c:if test="${not empty requestScope.search_message}">
                            <div class="alert alert-danger" role="alert" style="text-align: center">
                                <i class='fas fa-exclamation-circle' style='color:red'></i> ${requestScope.search_message}
                            </div>
                        </c:if>
                        <div style="display: flex; align-content: center; justify-content: center ">
                            <!--active is current page-->
                            <nav aria-label="...">
                                <ul class="pagination">
                                    <c:url var="previousPage" value="${request.contextPath}/SupportController/list">
                                        <c:param name="indexPage" value="${requestScope.currentPage - 1}"></c:param>
                                        <c:param name="search" value="${requestScope.search}"></c:param>
                                        <c:param name="sort" value="${requestScope.sort}"></c:param>
                                    </c:url>
                                    <c:url var="nextPage" value="${request.contextPath}/SupportController/list">
                                        <c:param name="indexPage" value="${requestScope.currentPage + 1}"></c:param>
                                        <c:param name="search" value="${requestScope.search}"></c:param>
                                        <c:param name="sort" value="${requestScope.sort}"></c:param>
                                    </c:url>

                                    <li class="page-item ${requestScope.currentPage == 1 ? "disabled" : ""}">
                                        <a class="page-link" href="${previousPage}" tabindex="-1">Previous</a>
                                    </li>
                                    <c:forEach begin="1" end="${requestScope.endPage}" var="page">
                                        <li class="page-item ${requestScope.currentPage == page ? "active" : ""}">
                                            <a class="page-link " href="<%= request.getContextPath()%>/SupportController/list?indexPage=${page}&search=${requestScope.search}&sort=${requestScope.sort}">${page}<span class="sr-only"></span></a>
                                        </li>
                                    </c:forEach>

                                    <li class=" page-item ${requestScope.currentPage == requestScope.endPage ? "disabled" : ""}">
                                        <a class="page-link" href="${nextPage}">Next</a>
                                    </li>

                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <script>
            function confirmMessage() {
                let text = "Do you want to remove this support information?";
                let status = false;
                if (confirm(text) === true) {
                    status = true;
                }
                return status;
            }
            /* When the user clicks on the button,
             toggle between hiding and showing the dropdown content */
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }


// Close the dropdown menu if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }

        </script>
        <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
<%-- 
    Document   : userList
    Created on : Mar 6, 2022, 9:16:07 AM
    Author     : Acer.Lucas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="page_type" content="np-template-header-footer-from-plugin">

        <title>User List Page</title>

        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/Ad_Home.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>

        <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

    </head>
    <jsp:include flush="true" page="header.jsp"></jsp:include>


        <body class="u-body u-xl-mode">
            <section class="u-clearfix u-section-1" id="sec-4a2e">
                <div class="u-clearfix u-sheet u-sheet-1">


                <c:if test="${not empty requestScope.edit_msg}">
                    <div class="alert alert-success" role="alert">
                        ${requestScope.edit_msg}
                    </div>
                </c:if>
                <c:if test="${not empty requestScope.remove_msg}">
                    <div class="alert alert-${requestScope.alert}" role="alert">
                        ${requestScope.remove_msg}
                    </div>
                </c:if>
                <c:url var="searchUser" value="${request.contextPath}/UserController/searchUser"></c:url>
                <form action="${searchUser}" style="margin-top: 14px; margin-bottom: 53px"">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                    <input type="text" name="search" autocomplete="off" placeholder="by username, phone" value="${requestScope.search}">
                    <input class="btn btn-primary" type="submit" value="Search">
                </form>

                <div class="u-tab-content">
                    <div class="u-container-style u-shape-rectangle u-tab-pane" id="tab-3cb8" role="tabpanel" aria-labelledby="link-tab-3cb8">
                        <div class="u-container-layout u-container-layout-4">

                            <div class=" u-table u-table-responsive">
                                <table class="u-table-entity table-hover table-striped table-responsive u-table-4">
                                    <colgroup>
                                        <col width="6.1%">
                                        <col width="14.5%">
                                        <col width="11.9%">
                                        <col width="11.4%">
                                        <col width="11.6%">
                                        <col width="13.3%">
                                        <col width="14.9%">
                                        <col width="8.1%">
                                        <col width="8.200000000000003%">
                                    </colgroup>

                                    <thead class="u-grey-50 u-table-header u-table-header-1">
                                        <tr style="height: 25px;"> 
                                            <td class="u-table-cell u-table-cell-41">ID</td>
                                            <td class="u-table-cell u-table-cell-42">Username</td>
                                            <td class="u-table-cell u-table-cell-43">Password</td>
                                            <td class="u-table-cell u-table-cell-44">Name</td>
                                            <td class="u-table-cell u-table-cell-45">Phone&nbsp;</td>
                                            <td class="u-table-cell u-table-cell-46">Email</td>
                                            <td class="u-table-cell u-table-cell-47">Role</td>
                                            <td class="u-table-cell u-table-cell-48"></td>
                                            <td class="u-table-cell u-table-cell-49"></td>
                                        </tr>
                                    </thead>
                                    <tbody class="u-table-alt-palette-1-light-3 u-table-body">

                                        <c:forEach var="user" items="${requestScope.listUserPaging}">
                                            <%--<c:forEach var="user" items="${requestScope.listUser}">--%>

                                            <tr style="height: 75px; border-bottom: 1px solid #21e5dc">
                                                <c:url var="linkViewEditUser" value="${request.ContextPath}/UserController/editUser">
                                                    <c:param name="userID" value="${user.userId}"></c:param>
                                                    <c:param name="action" value="ViewUser"></c:param>
                                                </c:url>
                                                <td class="u-table-cell u-table-cell-50">
                                                    <a href="${linkViewEditUser}">${user.userId}</a>
                                                </td>
                                                <td class="u-table-cell u-table-cell-51">${user.username}</td>
                                                <td class="u-table-cell u-table-cell-52">${user.password}</td>
                                                <td class="u-table-cell u-table-cell-53">${user.name}</td>
                                                <td class="u-table-cell u-table-cell-54">${user.phone}</td>
                                                <td class="u-table-cell u-table-cell-55">${user.email}</td>
                                                <td class="u-table-cell u-table-cell-56">User</td>
                                                <td class="u-table-cell u-table-cell-57">
                                                    <c:url var="linkEditUser" value="${request.ContextPath}/UserController/editUser">
                                                        <c:param name="userID" value="${user.userId}"></c:param>
                                                    </c:url>
                                                    <c:url var="linkRemoveUser" value="${request.ContextPath}/UserController/removeUser">
                                                        <c:param name="userID" value="${user.userId}"></c:param>
                                                    </c:url>
                                                    <a href="${linkEditUser}">Edit</a>
                                                </td>
                                                <td class="u-table-cell u-table-cell-58">
                                                    <a href="${linkRemoveUser}" onclick="return confirmMessage()"><i class="fa-solid fa-trash"></i></a>
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
                                        <c:url var="list" value="${request.contextPath}/UserController/listUser"></c:url>
                                        <c:set var="search" value="${requestScope.search}"></c:set>
                                        <c:set var="currentPage" value="${requestScope.currentPage}"></c:set>
                                        <c:set var="endPage" value="${requestScope.endPage}"></c:set>
                                        <li class="page-item ${requestScope.currentPage == 1 ? "disabled" : ""}">
                                            <a class="page-link" href="${list}?indexPage=${currentPage - 1}&search=${search}" tabindex="-1">Previous</a>
                                        </li>
                                        <c:forEach begin="1" end="${endPage}" var="page">
                                            <li class="page-item ${currentPage == page ? "active" : ""}">
                                                <a class="page-link " href="${list}?indexPage=${page}&search=${search}">${page}<span class="sr-only"></span></a>
                                            </li>
                                        </c:forEach>

                                        <li class=" page-item ${currentPage == endPage ? "disabled" : ""}">
                                            <a class="page-link" href="${list}?indexPage=${currentPage + 1}&search=${search}">Next</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <script>
            function confirmMessage() {
                let text = "Do you want to remove this user ?";
                let status = false;
                if (confirm(text) === true) {
                    status = true;
                }
                return status;
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

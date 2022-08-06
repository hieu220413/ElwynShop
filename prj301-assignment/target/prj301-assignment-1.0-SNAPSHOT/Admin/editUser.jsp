<%-- 
    Document   : editUser
    Created on : Feb 28, 2022, 10:07:54 PM
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
        <title>Ad_Edit_User</title>
        <link rel="stylesheet" href="../css/nicepageAdmin.css" media="screen">
        <link rel="stylesheet" href="../css/Ad_Edit_User.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jqueryAdmin.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/nicepageAdmin.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.6.5, nicepage.com">
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
        <meta property="og:title" content="Ad_Edit_User">
        <meta property="og:description" content="">
        <meta property="og:type" content="website">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            * {
                padding: 0;
                margin: 0;
            }

            .container {
                height: 85vh;
                display: flex;
                justify-content: center;
                align-items: center;
                /*background-color: #eee*/
                background-color: #fff;
            }

            .card {
                width: 350px;
                height: auto;
                background-color: #fff;
                box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden
            }

            .card .info {
                padding: 15px;
                display: flex;
                justify-content: space-between;
                border-bottom: 1px solid #e1dede;
                background-color: #e5e5e5
            }

            .card .info button {
                height: 30px;
                width: 80px;
                border: none;
                color: #fff;
                border-radius: 4px;
                background-color: #000;
                cursor: pointer;
                text-transform: uppercase
            }

            .card .forms {
                padding: 15px
            }

            .card .inputs {
                display: flex;
                flex-direction: column;
                margin-bottom: 10px
            }

            .card .inputs span {
                font-size: 12px
            }

            .card .inputs input {
                height: 40px;
                padding: 0px 10px;
                font-size: 17px;
                box-shadow: none;
                outline: none
            }

            .card .inputs input[type="text"][readonly] {
                border: 2px solid rgba(0, 0, 0, 0)
            }
        </style>
    </head>
    <body class="u-body u-xl-mode">
        <jsp:include flush="true" page="header.jsp"></jsp:include>
        <c:url var="editUser" value="${request.contextPath}/UserController/editUser"></c:url>
        <c:set var="userDetail" value="${requestScope.user}"></c:set>
        <c:set var="errors" value="${requestScope.errors}"></c:set>

            <div style="margin-top: 2%; margin-left: 15%"><button onclick="history.back()" type="button" class="btn btn-dark"><i class="fa-solid fa-arrow-left-long"></i> Back</button></div>

            <form action="${editUser}">
            <div class="container">

                <div class="card">
                    <div class="info"> <span>Edit form</span> 

                        <button type="submit" name="action" value="Edit" onclick="return confirmMessage()">Save</button> 
                    </div>
                    <div class="forms">
                        <div class="inputs"> <span>ID</span> <input type="hidden" name="userID" value="${userDetail.userId}">${userDetail.userId}</div>
                        <div class="inputs"> <span>Username</span> <input type="text" name="username" value="${userDetail.username}" required=""> </div>
                        <div class="inputs"> <span>Password</span> <input type="text" name="password" value="${userDetail.password}" required=""> </div>
                        <div class="inputs"> <span>Name</span> <input type="text" name="name" value="${userDetail.name}" required="" autocomplete="off"> </div>
                        <p style="font-size: 12px; color: red">${errors.nameError}</p>
                        <div class="inputs"> <span>Email</span> <input type="email" name="email" value="${userDetail.email}" required="" autocomplete="off"> </div>
                        <p style="font-size: 12px; color: red">${errors.emailError}</p>
                        <div class="inputs"> <span>Phone</span> <input type="text" name="phone" value="${userDetail.phone}" required="" autocomplete="off"> </div>
                        <p style="font-size: 12px; color: red">${errors.phoneError}</p>
                    </div>


                </div>
            </div>
        </form>

        <script>
            function confirmMessage() {
                let text = "Do you want to edit this user ?";
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
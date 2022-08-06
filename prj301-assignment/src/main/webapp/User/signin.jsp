<%-- 
    Document   : signin
    Created on : Mar 6, 2022, 6:55:25 AM
    Author     : phamquang
--%>

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
        <title>Sign in</title>
        <link rel="stylesheet" href="../css/user0.css" media="screen">
        <link rel="stylesheet" href="../css/Sign-in.css" media="screen">
        <script class="u-script" type="text/javascript" src="../js/jquery.js" defer=""></script>
        <script class="u-script" type="text/javascript" src="../js/user0.js" defer=""></script>
        <meta name="generator" content="Nicepage 4.4.3, nicepage.com">
        <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


        <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "Site1",
            "logo": "images/Screenshot2022-02-08152835.png"
            }</script>
        <meta name="theme-color" content="#478ac9">
        <meta property="og:title" content="Sign in">
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
    <header style="border-bottom: 2px solid black; width: 85%; margin: 0 auto">
        <img src="../images/Logo.png" style="height: 50%">

        <ul class="u-nav u-unstyled u-nav-1" style="left: 700px"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/home.jsp" style="padding: 22px 26px;" title="Home"><i class="fa-solid fa-house"></i></a>
            </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;" title="Login"><i class="fa-solid fa-right-to-bracket"></i></a>
            </li>
        </ul>

    </header>
    <!--    <header class="u-clearfix u-header u-valign-middle u-header" id="sec-e70b"><a href="https://nicepage.com/c/sports-website-templates" class="u-image u-logo u-image-1" data-image-width="242" data-image-height="111">
                <img src="../images/Logo.png" class="u-logo-image u-logo-image-1">
            </a><nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
                <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
                    <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
                        <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
                        <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
                        </g></svg>
                    </a>
                </div>
                <div class="u-custom-menu u-nav-container">
                    <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/home.jsp" style="padding: 22px 26px;" title="Home"><i class="fa-solid fa-house"></i></a>
                        </li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;" title="Login"><i class="fa-solid fa-right-to-bracket"></i></a>
                        </li></ul>
                </div>
                <div class="u-custom-menu u-nav-container-collapse">
                    <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                        <div class="u-inner-container-layout u-sidenav-overflow">
                            <div class="u-menu-close"></div>
                            <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html" style="padding: 22px 26px;">Home</a>
                                </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Contact.html" style="padding: 22px 26px;">Contact</a>
                                </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Cart.html" style="padding: 22px 26px;">Cart</a>
                                </li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 22px 26px;">Login</a>
                                </li></ul>
                        </div>
                    </div>
                    <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
                </div>
            </nav></header>-->
    <section class="u-clearfix u-palette-2-light-3 u-section-1" id="sec-4d4b">
        <div class="u-clearfix u-sheet u-sheet-1">
            <h2 class="u-text u-text-default u-text-1">Create new account</h2>
            <div class="u-form u-form-1">
                <form action="<%= request.getContextPath()%>/UserController/signin" method="GET" style="padding: 15px;" source="custom">
                    <div class="u-form-password u-form-group">
                        Email<input type="email" placeholder="ElwynShop@gmail.com" id="email-ef64" name="email" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required="" autocomplete="off">
                    </div>
                    <div class="u-form-group u-form-name ">
                        Username<input type="text" id="name-ef64" name="username" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required="" placeholder="Name" value="${requestScope.username}" autocomplete="off">
                    </div>
                    <div class="u-form-password u-form-group">
                        Phone<input type="text" placeholder="Phone number" id="email-ef64" name="phone" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required="" value="${requestScope.phone}" autocomplete="off">
                    </div>
                    <div class="u-form-password u-form-group">
                        Password<input type="password" placeholder="Password" id="email-ef64" name="password" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required="">
                    </div>
                    <div class="u-form-password u-form-group">
                        Repassword<input type="password" placeholder="Repassword" id="email-ef64" name="repassword" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required="">
                    </div>
                    <div style="color: red">
                        <%
                            if (request.getAttribute("signin-msg") != null && !request.getAttribute("signin-msg").equals("")) {
                                out.print(request.getAttribute("signin-msg"));
                            } else if (request.getAttribute("signin-msg1") != null && !request.getAttribute("signin-msg1").equals("")) {
                                out.print(request.getAttribute("signin-msg1"));
                            } else if (request.getAttribute("signin-msg2") != null && !request.getAttribute("signin-msg2").equals("")) {
                                out.print(request.getAttribute("signin-msg2"));
                            } else if (request.getAttribute("signin-msg3") != null && !request.getAttribute("signin-msg3").equals("")) {
                                out.print(request.getAttribute("signin-msg3"));
                            } else if (request.getAttribute("signin-msg4") != null && !request.getAttribute("signin-msg4").equals("")) {
                                out.print(request.getAttribute("signin-msg4"));
                            } else if (request.getAttribute("signin-msg5") != null && !request.getAttribute("signin-msg5").equals("")) {
                                out.print(request.getAttribute("signin-msg5"));
                            }
                        %>
                    </div>

                    <div style="text-align: center">
                        <input type="submit" value="submit" class="u-btn u-btn-submit u-button-style" >
                    </div>
                </form>
            </div>
        </div>
    </section>


    <c:url var="home" value="${request.contextPath}/UserController/home"></c:url>
        <tag:footer home="${home}"></tag:footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>

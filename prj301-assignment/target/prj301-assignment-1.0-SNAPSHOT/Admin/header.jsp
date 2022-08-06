<%-- 
    Document   : header
    Created on : Mar 6, 2022, 9:29:42 AM
    Author     : Acer.Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="u-clearfix u-header u-header" id="sec-ea3f" style="border-bottom: 2px solid black; width: 85%; margin: 0 auto">
    <div class="u-clearfix u-sheet u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
            <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
                <a class="u-button-style u-custom-active-border-color u-custom-active-color u-custom-border u-custom-border-color u-custom-borders u-custom-color u-custom-hover-border-color u-custom-hover-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
                    <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
                    <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
                        </g></svg>
                </a>
            </div>
            <div class="u-custom-menu u-nav-container">
                
                <ul class="u-nav u-spacing-20 u-unstyled u-nav-1">
                    <li class="u-nav-item"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="<%=request.getContextPath()%>/ProductController/list" rel="nofollow" style="padding: 10px 26px;">PRODUCT</a></li>
                    <li class="u-nav-item"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="<%= request.getContextPath()%>/OrderController/list" rel="nofollow" style="padding: 10px 26px;">FINANCE</a></li>
                    <li class="u-nav-item"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="<%= request.getContextPath()%>/UserController/listUser" rel="nofollow" style="padding: 10px 26px;">USER</a></li>
                    <li class="u-nav-item"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="<%= request.getContextPath()%>/SupportController/list" rel="nofollow" style="padding: 10px 26px;" title="Support">SUPPORT</a></li>
                    <li class="u-nav-item"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="<%= request.getContextPath()%>/Admin/home.jsp" style="padding: 10px 26px;" title="Home"><i class="fa-solid fa-house"></i></a></li>
                    <li class="u-nav-item"><a class="u-active-black u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-hover-palette-2-base u-nav-link u-text-active-palette-4-light-3 u-text-grey-90 u-text-hover-white u-white" href="<%= request.getContextPath()%>/UserController/logout" rel="nofollow" style="padding: 10px 26px;" title="Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
                </ul>
            </div>
            <div class="u-custom-menu u-nav-container-collapse">
                <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                    <div class="u-inner-container-layout u-sidenav-overflow">
                        <div class="u-menu-close"></div>
                        <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="Admin/home.jsp" style="padding: 10px 26px;" title="Home">HOME</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="<%=request.getContextPath()%>/ProductController/list" rel="nofollow" style="padding: 10px 26px;">PRODUCT</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="Admin/finance" rel="nofollow" style="padding: 10px 26px;">FINANCE</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="Admin/userList.jsp" rel="nofollow" style="padding: 10px 26px;">USER</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="<%= request.getContextPath()%>/SupportController/list" rel="nofollow" style="padding: 10px 26px;">SUPPORT</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="Admin/login.jsp" rel="nofollow" style="padding: 10px 26px;">LOGOUT <i class="fa-solid fa-right-from-bracket"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
            </div>
        </nav>


        <a href="<%= request.getContextPath()%>/Admin/home.jsp" class="u-image u-logo u-image-1" data-image-width="80" data-image-height="40">
            <img src="../images/Logo.png" class="u-logo-image u-logo-image-1">
        </a>
    </div>
</header>

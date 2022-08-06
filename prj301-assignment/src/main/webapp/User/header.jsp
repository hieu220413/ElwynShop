<%-- 
    Document   : header
    Created on : Mar 19, 2022, 11:52:26 PM
    Author     : Acer.Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="u-clearfix u-header" id="sec-e70b"><a href="/prj301-assignment/User/home.jsp" class="u-image u-logo u-image-1" data-image-width="242" data-image-height="111">
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
                </li><% if (session.getAttribute("usersession") == null) { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;" title="Contact"><i class="fa-solid fa-envelope"></i></a>
                </li><% } else { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/contact.jsp" style="padding: 22px 26px;" title="Contact"><i class="fa-solid fa-envelope"></i></a>
                </li><% }%><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/cart.jsp" style="padding: 22px 26px;" title="Cart"><i class="fa-solid fa-cart-shopping"></i></a>
                </li><% if (session.getAttribute("usersession") == null) { %> <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/login.jsp" style="padding: 22px 26px;" title="Login"><i class="fa-solid fa-right-to-bracket"></i></a>
                </li><% } else { %><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/prj301-assignment/User/edit-info.jsp" style="padding: 22px 26px;" title="User Information"> <i class="fa-solid fa-user"></i></a>
                </li>
                <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="${pageContext.request.contextPath}/UserController/logout" style="padding: 22px 26px;" title="Logout"><i class="fa-solid fa-right-from-bracket"></i></a>
                </li><% }%></ul>
        </div>
        <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                <div class="u-inner-container-layout u-sidenav-overflow">
                    <div class="u-menu-close"></div>
                    <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/home.jsp" style="padding: 22px 26px;">Home</a>
                        </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/contact.jsp" style="padding: 22px 26px;">Contact</a>
                        </li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/cart.jsp" style="padding: 22px 26px;">Cart</a>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="/prj301-assignment/User/edit-info.jsp" style="padding: 22px 26px;" title="User Information"> <i class="fa-solid fa-user"></i> User Info</a>
                            </li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/UserController/logout" style="padding: 22px 26px;">Logout</a>
                            </li>
                    </ul>
                </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
        </div>
    </nav></header>

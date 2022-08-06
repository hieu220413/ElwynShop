<%-- 
    Document   : footer
    Created on : Mar 15, 2022, 11:49:26 PM
    Author     : Acer
--%>

<%@tag description="Footer of the page" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="insta_link"%>
<%@attribute name="snappchat_link"%>
<%@attribute name="twitter_link"%>
<%@attribute name="facebook_link"%>
<%@attribute name="home" required="true"%>

<%-- any content can be specified here e.g.: --%>

<style>
    .footer-basic {
  padding:40px 0;
  background-color:#ffffff;
  color:#4b4c4d;
}

.footer-basic ul {
  padding:0;
  list-style:none;
  text-align:center;
  font-size:18px;
  line-height:1.6;
  margin-bottom:0;
}

.footer-basic li {
  padding:0 10px;
}

.footer-basic ul a {
  color:inherit;
  text-decoration:none;
  opacity:0.8;
}

.footer-basic ul a:hover {
  opacity:1;
}

.footer-basic .social {
  text-align:center;
  padding-bottom:25px;
}

.footer-basic .social > a {
  font-size:24px;
  width:40px;
  height:40px;
  line-height:40px;
  display:inline-block;
  text-align:center;
  border-radius:50%;
  border:1px solid #ccc;
  margin:0 8px;
  color:inherit;
  opacity:0.75;
}

.footer-basic .social > a:hover {
  opacity:0.9;
}

.footer-basic .copyright {
  margin-top:15px;
  text-align:center;
  font-size:13px;
  color:#aaa;
  margin-bottom:0;
}
</style>
<div class="footer-basic" style="padding: 10px 0px;">
    <footer>
        <div class="social"><a href="${insta_link}"><i class="icon ion-social-instagram"></i></a>
            <a href="">${snappchat_link}<i class="icon ion-social-snapchat"></i></a>
            <a href="${twitter_link}"><i class="icon ion-social-twitter"></i></a>
            <a href="${facebook_link}"><i class="icon ion-social-facebook"></i></a>
        </div>
<!--        <ul class="list-inline">
            <li class="list-inline-item"><a href="${home}">Home</a></li>
            <li class="list-inline-item"><a href="#">Services</a></li>
            <li class="list-inline-item"><a href="#">About</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
        </ul>-->
        <p class="copyright">Elwyn Shop © 2022 - Tel: 0909090909</p>
       
    </footer>
</div>

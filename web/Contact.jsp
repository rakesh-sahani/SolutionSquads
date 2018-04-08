<%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Contact</title>
        <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.png" />
        <link rel="apple-touch-icon" sizes="57x57" href="/images/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="/images/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/images/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="/images/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/images/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="/images/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="/images/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="/images/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="/images/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="/images/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/images/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="/images/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/images/images/favicon-16x16.png">
        <link rel="manifest" href="/images/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/images/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--[if IE 7]>
                <link rel="stylesheet" href="css/ie7.css" type="text/css">
        <![endif]-->
    </head>
    <body>
        <div id="header">
            <div>
                <div>
                    <span></span>
                    <a href="index.jsp" class="logo"><img src="images/logo.png" width="150px" height="150px" alt="logo"></a>
                    <span class="tagline"></span>
                </div>
                <ul>
                    <li>
                        <a href="index.jsp">home</a>
                    </li>
                    <li>
                        <a href="About.jsp">about</a>
                    </li>
                    <li >
                        <a href="Pricing.jsp">Pricing</a>
                    </li>
                    <li>
                        <a href="Services.jsp">services</a>
                    </li>
                    <li class="selected">
                        <a href="Contact.jsp">contact</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="body">
            <div class="content">
                <div id="section">
                    <h2>contact</h2>
                    <b><a href="#">visit our office</a></b> <br> <br> <br> 
                    <iframe class="col-xs-12"  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2966.4236089222527!2d-71.47807258455606!3d41.969713979215!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e469f8ca1bbac7%3A0xc898b8d7c558f269!2s130+Central+St%2C+Manville%2C+RI+02838%2C+USA!5e0!3m2!1sen!2sin!4v1492168637813"  frameborder="0" style="border:0;height:600px;width:570px;" allowfullscreen></iframe>

                </div>
                <div id="sidebar">
                    <div class="search">

                    </div>
                    <div class="contact">
                        <h3>contact information</h3>
                        <ul class="first">
                            <li class="office">
                                <b>office</b><span>130 Central St., Manville, RI, USA 02838</span>
                            </li>
                            <li class="telephone">
                                1-877-773-1523
                            </li>
                            <li class="email">
                                <a href="">support@solutionsquads.com</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3>office hours:</h3>
                        <span>Monday - Friday <span>7:00 a.m. - 4:30 p.m.</span></span> <span>Saturdays &amp; Sundays <span>7:00 a.m. - 12:00 p.m.</span></span>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
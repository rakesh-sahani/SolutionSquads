<%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>

<!DOCTYPE HTML>
<html>
    <head>

        <title>About</title>
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
                    <li class="selected">
                        <a href="About.jsp">about</a>
                    </li>
                    <li >
                        <a href="Pricing.jsp">Pricing</a>
                    </li>
                    <li >
                        <a href="Services.jsp">services</a>
                    </li>
                    <li>
                        <a href="Contact.jsp">contact</a>
                    </li>                
                </ul>
            </div>
        </div>
        <%
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            try {
                con = OnsiteTeckies.Connect.makeConnection();
                String query = "select * from about";
                pst = con.prepareStatement(query);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String toptext = rs.getString(2);
                    String img = rs.getString(3);
                    String bottomtext = rs.getString(4);
                    String disc = rs.getString(5);

        %>
        <div id="body">
            <div class="content">
                <div id="section">
                    <h2>about</h2>
                    <p>
                        <%=toptext%>
                    </p>
                    <img src="images/<%=img%>" alt="">
                    <p>
                        <%=bottomtext%>
                    </p>
                </div>
                <div id="sidebar">
                    <div class="search">
                        <h3>Disclaimer</h3>
                        <p><%=disc%></p>
                    </div>
                    <div class="awards">
                        <h3><center>Call Now : 1-877-773-1523</center></h3>
                    </div>
                </div>
            </div>
        </div>	
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <%@include file="footer.html" %>
    </body>
</html>
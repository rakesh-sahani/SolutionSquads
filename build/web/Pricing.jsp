<%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pricing</title>
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
                    <li class="selected">
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
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                con = OnsiteTeckies.Connect.makeConnection();
                String query = "select * from pricing";
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();


        %>
        <div id="body">
            <div class="section">
                <h2>Plans</h2>

                <ul class="article">
                    <%  while (rs.next()) {
                            String pname = rs.getString(3);
                            String img = rs.getString(4);
                            String detail = rs.getString(5);
                    %>
                    <li>
                        <img src="images/<%=img%>" alt="plan"> <b><a href="#"><%=pname%></a></b> 
                        <p>
                            <%=detail%>
                        </p>
                    </li>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>


                </ul>
                <h2>Disclaimer</h2>

                <p> <b>SolutionSquads</b> is an independent service provider that provides services at affordable rates. We are third part independent service provider for all kind of Computer ( Microsoft windows & Apple Computer) and Printer ,Routers, Antivirus and Ipad and Iphone Support . We do not claim that we represent any particular brand in any way, all branding is purely for demonstrative purposes only and does and do not signify any association with any brands or any organization.
                <p>

                <h2><center>Call Now : 1-877-773-1523</center></h2>

            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
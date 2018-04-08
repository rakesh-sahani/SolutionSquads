<%-- 
    Document   : index
    Created on : Jun 16, 2017, 8:27:16 AM
    Author     : Rakesh Sahani
--%>
<%@ page language="java" contentType="text/html;" pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Home</title>
        <link rel="apple-touch-icon" sizes="57x57" href="../images/apple-icon-57x57.png">
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
        <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta http-equiv="keywords" name="keywords" content="IT Support" />
        <meta http-equiv="description" name="description" content="IT Support" />
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
                    <li class="selected">
                        <a href="index.jsp">home</a>
                    </li>
                    <li>
                        <a href="About.jsp">about</a>
                    </li>
                    <li>
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
                String query = "select * from homepage";
                pst = con.prepareStatement(query);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String img = rs.getString(2);
                    String msg = rs.getString(3);
                    String test = rs.getString(4);

        %>
        <div id="body">
            <div class="header">
                <div>
                   <img src="images/<%=img%>" width="940px" height="406px" alt="logo">
                    <ul>
                        <li>
                            <a href="#">we truly care</a>
                        </li>
                        <li>
                            <a href="#">modern equipments</a>
                        </li>
                        <li>
                            <a href="#">highly trained professionals</a>
                        </li>
                        <li>
                            <a href="#">fast and accurate results</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="body">
                <div class="section">
                    <div class="article">
                        <h2>Welcome to SolutionSquad..!!</h2>
                        <a href="index.jsp"> <img src="images/logo.png" alt="" width="200px" height="200px"></a>
                        <p>
                            <%=msg%>
                        </p>
                    </div>
                    <div class="aside">
                        <b>Disclaimer</b>
                        <p>
                            <%=test%>
                        </p>	
                        <h3 style="color: red;"><center>      Call Now : 1-877-773-1523</center></h3>
                    </div>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <div class="footer">
                <div>
                    <a href="Services.jsp"><img src="images/team.jpg" alt=""></a>
                    <h3>our services</h3>				
                </div>
                <div>
                    <a href="Pricing.jsp"><img src="images/what.jpg" alt=""></a>
                    <h3>what we can do for you</h3>				
                </div>
                <div>
                    <a href="Contact.jsp"><img src="images/where.jpg" alt=""></a>
                    <h3>where you can find us</h3>				
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
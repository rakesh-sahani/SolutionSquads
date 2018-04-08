<%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Services</title>
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
                    <li>
                        <a href="Pricing.jsp">Pricing</a>
                    </li>
                    <li class="selected">
                        <a href="Services.jsp">services</a>
                    </li>
                    <li>
                        <a href="Contact.jsp">contact</a>
                    </li>
                    <li>
                </ul>
            </div>
        </div>
        <div id="body">
            <div id="content">
                <div id="sidebar">
                    <h3>Services</h3>

                    <ul>
                        <li>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                String scat;
                                try {
                                    con = OnsiteTeckies.Connect.makeConnection();
                                    String query = "select * from services";
                                    ps = con.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {

                                        int sid = rs.getInt(2);
                                        scat = rs.getString(3);


                            %>
                            <ul>
                                <li>
                                    <a href="Pages.jsp?Categories=<%=sid%>"><%=scat%></a>
                                </li>                                
                            </ul>
                            <%}

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>   
                        </li>

                    </ul>
                </div>

                <div id="section">
                    <h2>Services</h2>
                    <img src="images/ima.jpg" width="580px" alt="">
                    <p>

                        SolutionSquads is best provider of outsourced IT infrastructure maintenance and support services to all most all the major and minor organizations in the states. These service are designed to provide companies with remote and on-site IT support for employees working outside of the 9 - 5  work environment or in odd hours
                        SolutionSquads Offerings include Standard Business hours support for all contracted devices and applications. All thickets and monitoring alerts are addressed remotely through the Help Desk or by on-site dispatch during these hours. Every effort is made to ensure that our network will be ready for business by 8 AM each business day. After-hours and 24*7 hour 365 days Emergency services are available as optional services..
                    </p>
                    <h1><center>Call Now : 1-877-773-1523</center></h1>


                    <h2>Disclaimer</h2>

                    <p> <b>SolutionSquads</b> is an independent service provider that provides services at affordable rates. We are third part independent service provider for all kind of Computer ( Microsoft windows & Apple Computer) and Printer ,Routers, Antivirus and Ipad and Iphone Support . We do not claim that we represent any particular brand in any way, all branding is purely for demonstrative purposes only and does and do not signify any association with any brands or any organization.
                    <p>
                </div>
            </div>
        </div>

        <%@include file="footer.html" %>
    </body>
</html>
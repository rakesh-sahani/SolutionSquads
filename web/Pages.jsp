<%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
<!DOCTYPE HTML>
<html>

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
    <head>
        <meta charset="UTF-8">
        <%
            String sca = request.getParameter("Categories");
            Connection con = null;
            PreparedStatement p1, p2, p3, p4 = null;
            ResultSet r1, r2, r3, r4 = null;
            int sid;
            String img, scontent, scat, title, key, des, sql1, sql2, sql3, sql4;
            try {
                con = OnsiteTeckies.Connect.makeConnection();
                sql1 = "select * from seo  where pid =" + sca;
                p1 = con.prepareStatement(sql1);
                r1 = p1.executeQuery();
                while (r1.next()) {
                    key = r1.getString(4);
                    des = r1.getString(5);


        %>
        <meta http-equiv="keywords" name="keywords" content="<%=key%>" />
        <meta http-equiv="description" name="description" content="<%=des%>" />
        <%}
            sql4 = "select * from seo  where pid =" + sca;
            p4 = con.prepareStatement(sql4);
            r4 = p4.executeQuery();
            if (r4.next()) {
                title = r4.getString(3);
        %>
        <title><%=title%></title> <%}%>
        <link rel="shortcut icon" type="image/x-icon" href="../images/logo.png" />
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
                    <li class="selected">
                        <a href="Services.jsp">services</a>
                    </li>
                    <li>
                        <a href="Contact.jsp">contact</a>
                    </li>
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

                                sql2 = "select * from services";
                                p2 = con.prepareStatement(sql2);
                                r2 = p2.executeQuery();
                                while (r2.next()) {
                                    sid = r2.getInt(2);
                                    scat = r2.getString(3);
                                    scontent = r2.getString(4);


                            %>
                            <ul>
                                <li>
                                    <a href="Pages.jsp?Categories=<%=sid%>"><%=scat%></a>
                                </li>                                
                            </ul>

                        </li>
                        <%}
                            sql3 = "select * from services where sid =" + sca;
                            p3 = con.prepareStatement(sql3);
                            r3 = p3.executeQuery();
                            while (r3.next()) {
                                scat = r3.getString(3);
                                scontent = r3.getString(4);
                                img = r3.getString(5);%>
                    </ul>
                    <ul>
                        <li><br>
                            <h3>Disclaimer</h3>


                            <p> <b>SolutionSquads</b> is an independent service provider that provides services at affordable rates. We are third part independent service provider for all kind of Computer ( Microsoft windows & Apple Computer) and Printer ,Routers, Antivirus and Ipad and Iphone Support . We do not claim that we represent any particular brand in any way, all branding is purely for demonstrative purposes only and does and do not signify any association with any brands or any organization.
                            <p>
                            <h2><center>Call Now : 1-877-773-1523</center></h2>

                        </li>                                
                    </ul>
                </div>
                <div id="section">
                    <span> <a href="Services.jsp">&lt;&nbsp;&nbsp;Back to Services</a> </span>
                    <h2><%=scat%></h2>
                    <img src="images/<%=img%>" width="580px" alt="">
                    <p>
                        <%=scontent%>  
                    </p>
                </div>
                <%}

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
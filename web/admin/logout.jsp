<%-- 
    Document   : newjsp
    Created on : 12 Apr, 2018, 11:41:43 PM
    Author     : Ryu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <body>
          

                        
                        <%
                            session.invalidate();
                            response.setHeader("Refresh", "2;URL=login.jsp");

                        %>
                       
                 
    </body>
</html>

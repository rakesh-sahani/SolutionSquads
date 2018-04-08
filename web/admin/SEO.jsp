<%-- 
    Document   : Home
    Created on : Jun 16, 2017, 3:42:18 PM
    Author     : Ryu
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
        <title>SEO</title>
    </head>
    <body>    

        <script >
            function fillText(obj)
            {
                document.getElementById("Title").value = obj.options[obj.selectedIndex].value;
            }
        </script>
        <%@include file="dashboard.jsp" %>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Dashboard
                    <small>Control panel</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Dashboard</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">SEO Page</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form  action="SEOServlet" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Service Category</label>
                                        <select class="form-control select2" style="width: 100%;" name="pid" id="pid">
                                            <option selected="selected" disabled="">Choose Category</option>
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
                                            <option value="<%=sid%>"><%=scat%></option>   
                                            <%}


                                            %>  
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Page Title</label>
                                        <select class="form-control select2" style="width: 100%;" name="title" id="title">
                                            <option selected="selected" disabled="">Choose Title</option>
                                            <%                        String quer = "select * from services";
                                                PreparedStatement p = con.prepareStatement(quer);
                                                ResultSet r = p.executeQuery();
                                                while (r.next()) {

                                                    String cat = r.getString(3);


                                            %>
                                            <option value="<%=cat%>"><%=cat%></option>   
                                            <%}

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>  
                                        </select>
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Keyword</label>
                                        <input type="text" class="form-control" id="key" name="key"  placeholder="Keyword">
                                    </div>               

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Description</label>
                                        <input type="text" class="form-control" id="desc" name="desc"  placeholder="Description">
                                    </div>
                                </div>


                                <%
                                    String res = (String) session.getAttribute("result");
                                    if (res != null) {
                                %>

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="callout callout-success">
                                        <h4><%=res%></h4>
                                    </div>         
                                </div>
                                <!-- /.box-body -->

                                <%
                                        session.removeAttribute("result");
                                    } else {

                                        session.setAttribute("result", "");
                                    }
                                %>


                                <!-- /.box -->

                                <!-- /.box-body -->

                                <div class="box-footer">
                                    <center><input type="submit" name="Submit" class="btn btn-primary" onclick="return check();"></center>
                                </div>
                            </form>
                        </div>
                        <!-- /.box -->

                        </section>
                        <!-- /.content -->
                    </div>
                    <!-- /.content-wrapper -->
   <script>
                        function check() {

                           if (document.getElementById('pid').selectedIndex == "") {
                                alert('Category Cannot be Blank Left !!');
                                return false;
                            }
                            if (document.getElementById('title').selectedIndex == "") {
                                alert('Title Cannot be Blank Left !!');
                                return false;
                            }
                            
                            if (document.getElementById('key').value == "") {
                                alert('Keyword Cannot be Blank Left !!');
                                return false;
                            }
                            if (document.getElementById('desc').value == "") {
                                alert('Description Cannot be Blank Left !!');
                                return false;
                            }
                        }
                    </script>

                    <%@include file="footer.html" %>
                    </body>
                    </html>

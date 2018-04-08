<%-- 
    Document   : Home
    Created on : Jun 16, 2017, 3:42:18 PM
    Author     : Ryu
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
        <title>Services Update</title>
    </head>
    <script>
        function url()
        {
            var sid = document.getElementById('Title').value;
            location.href = 'DisplayServiceServlet?sid=' + sid;
        }

    </script>
    <body>

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
                    <li><a href="#"><i class="fa fa-dashboard"></i> Services Update</a></li>
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
                                <h3 class="box-title">Services Update Page</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form  action="ServiceUpdate" enctype="multipart/form-data" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Services Title</label>
                                        <select class="form-control select2" style="width: 100%;" name="Title" id="Title" onchange="return url();">

                                            <%! int sid;%>
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
                                            %> 
                                            <option selected="selected" disabled="">Choose Category</option>
                                            <%
                                                while (rs.next()) {

                                                    sid = rs.getInt(2);
                                                    scat = rs.getString(3);


                                            %>
                                            <option value="<%=sid%>"><%=scat%></option>   
                                            <%}

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                            
                                            <%
                                                String cat;
                                                cat = (String) request.getAttribute("cat");

                                                if (cat != null) {
                                            %> <option selected="selected" value="<%=sid%>"><%=cat%></option><%}%>
                                        </select>
                                    </div>
                                          <% 
                      String content,img;
                  content =(String)request.getAttribute("con");
                  img= (String)request.getAttribute("img");
  if(content!=null){
      %> 
                                    <div class="box">
                                        <div class="box-header">                                                                           
                                            <h3 class="box-title">Services Content                                      
                                            </h3>  
                                            <!-- tools box -->
                                            <div class="pull-right box-tools">
                                                <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                                    <i class="fa fa-minus"></i></button>
                                            </div>
                                            <!-- /. tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body pad">
                                            <textarea class="textarea" id="content" name="Content" placeholder="Content" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=content%></textarea>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <div class="box-header">                                                                           
                                            <h3 class="box-title">Banner Image                                      
                                            </h3>  
                                            <!-- tools box -->
                                            <div class="pull-right box-tools">
                                                <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                                    <i class="fa fa-minus"></i></button>
                                            </div>
                                            <!-- /. tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body pad">
                                            <img src="../images/<%=img%>" width="100%" height="300px" >
                                        </div>
                                    </div>  <% }%>
                                    <div class="box-body">                                    
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-xs-5">                                            
                                                    <input type="file" id="img" name="img">
                                                </div>
                                            </div>                            
                                        </div>
                                    </div> 
                                </div>


                                <%
                                    String res = (String) session.getAttribute("result");
                                    if (res!=null) {
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
                                    }

                                    
                                        else {

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

                           if (document.getElementById('Title').selectedIndex == "") {
                                alert('Title Cannot be Blank Left !!');
                                return false;
                            }
                            
                            if (document.getElementById('content').value == "") {
                                alert('Testimonial Cannot be Blank Left !!');
                                return false;
                            }
                            if (document.getElementById('img').value == "") {
                                alert('Image Cannot be Blank Left !!');
                                return false;
                            }
                        }
                    </script>

                    <%@include file="footer.html" %>
                    </body>
                    </html>

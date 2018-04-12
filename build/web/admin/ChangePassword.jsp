<%-- 
    Document   : Home
    Created on : Jun 16, 2017, 3:42:18 PM
    Author     : Ryu
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
        <title>Home Page</title>
    </head>
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
              <h3 class="box-title">Change Password</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form  action="ChangeServlet" method="post">
                <input type="hidden" name="access" value="<%=user%>"/>
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Old Password</label>
                  <input type="text" class="form-control" id="old" name="old"  placeholder="Old Password">
                </div>  
                  <div class="form-group">
                  <label for="exampleInputEmail1">New Password</label>
                  <input type="text" class="form-control" id="newp" name="newp"  placeholder="New Password">
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
                                                } else {

                                                    session.setAttribute("result", "");
                                                }
                                            %>
            
          
          <!-- /.box -->
       
              <!-- /.box-body -->

              <div class="box-footer">
                  <input type="hidden" name="services" value="insert">
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

                           if (document.getElementById('old').value == "") {
                                alert('Old Password Cannot be Blank Left !!');
                                return false;
                            }
                            
                            if (document.getElementById('newp').value == "") {
                                alert('New Password Cannot be Blank Left !!');
                                return false;
                            }
                        }
                    </script>
  
  <%@include file="footer.html" %>
    </body>
</html>

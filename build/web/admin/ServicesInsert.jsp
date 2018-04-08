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
              <h3 class="box-title">Services Insert Page</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form  action="ServicesServlet" enctype="multipart/form-data" method="post">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Services Title</label>
                  <input type="text" class="form-control" id="Title" name="Title"  placeholder="Title">
                </div>
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
                                        <textarea class="textarea" id="content" name="Content" placeholder="Content" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                    </div>
                                </div>
                  
               <div class="form-group">
                  <label for="exampleInputFile">Banner</label>
                  <input type="file" id="img" name="img">
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

                           if (document.getElementById('Title').value == "") {
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

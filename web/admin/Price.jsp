

<!DOCTYPE html>
<html>
    <head>
        <%@page language="java" contentType="text/html" pageEncoding="windows-1252" import="java.util.*,java.sql.*"%>
        <title>Price</title>
    </head>
    <script>
        function url()
        {
            var pid = document.getElementById('pid').value;          
            location.href ='DisplayServlet?pid=' + pid;
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
              <h3 class="box-title">Price Page</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form  action="PriceServlet" enctype="multipart/form-data" method="post" name="myform" id="myform">
              <div class="box-body">
                  <div class="form-group">
                <label>Plan ID</label>
                <select class="form-control select2" style="width: 100%;" name="pid" id="pid" onchange="return url();">
                    <%! int pid;%>
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
                    <option selected="selected" disabled="">Choose Category</option>
                    <%
 while (rs.next()) {
     pid = rs.getInt(2);
     String pname = rs.getString(3);                           
          
                           
 %>
                     <option  value="<%=pid%>"><%=pname%></option>
                     <%
                        }  }catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>                  
                   
                     <% 
                      String pname;
                     
                 
                  pname =(String)request.getAttribute("RS");
                  
  if(pname!=null){
      %> <option selected="selected" value="<%=pid%>"><%=pname%></option><%}%>
                 
                </select>
              </div>
    <% 
                      String detail,img;
                  detail =(String)request.getAttribute("de");
                  img= (String)request.getAttribute("img");
  if(detail!=null){
      %> 
                <div class="form-group">
                  <label for="exampleInputEmail1">Plan Name</label>
                  <input type="text" value="<%=pname%>"class="form-control" id="pname" name="pname"  placeholder="Plan Name">
                </div>            
                 
                
                <div class="box">
                                    <div class="box-header">                                                                           
                                        <h3 class="box-title">Plan Detail                                      
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
                                        <textarea class="textarea" id="detail" name="detail"  placeholder="Plan Detail" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=detail%></textarea>
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
                                        <img src="../images/<%=img%>" width="30%" height="300px" >
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
                                alert('Plan ID Cannot be Blank Left !!');
                                return false;
                            }

                            if (document.getElementById('pname').value == "") {
                                alert('Plan Name Cannot be Blank Left !!');
                                return false;
                            } if (document.getElementById('detail').value == "") {
                                alert('Detail Cannot be Blank Left !!');
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

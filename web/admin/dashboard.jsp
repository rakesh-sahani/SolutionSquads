<%@ page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Dashboard</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
        <!-- Morris chart -->
        <link rel="stylesheet" href="plugins/morris/morris.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/logo.png" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>SS</b></span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Solution</b>Squad</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <% String user = (String) session.getAttribute("user");                  
                            if (user == null) {
                                response.sendRedirect("login.jsp");
                            }%>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="dist/img/avatar5.png" class="user-image" alt="User Image">
                                    <span class="hidden-xs"><%=user%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">

                                        <p>
                                            <%=user%>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="ChangePassword.jsp" class="btn btn-default btn-flat">Change Password</a>
                                            
                                        </div>
                                        <div class="pull-right">
                                            <a href="logout.jsp" class="btn btn-default btn-flat" >Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><%=user%></p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="active treeview">
                            <a href="welcome.jsp">
                                <i class="fa fa-dashboard"></i><span>Dashboard</span>
                            </a>          
                        </li>
                        <li class="treeview">
                            <a href="Home.jsp">
                                <i class="fa fa-edit"></i> <span>Home</span>           
                            </a>         
                        </li>
                        <li class="treeview">
                            <a href="About.jsp">
                                <i class="fa fa-laptop"></i>
                                <span>About</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="Price.jsp">
                                <i class="fa fa-money"></i> <span>Pricing</span></a>
                        </li>
                        <li class="treeview">
                            <a href="SEO.jsp">
                                <i class="fa fa-money"></i> <span>SEO</span>
                        </li>
                        <li class="treeview">
                            <i class="fa fa-folder"></i> <span>Services</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>

                            <ul class="treeview-menu">
                                <li><a href="ServicesInsert.jsp"><i class="fa fa-circle-o"></i>Insert</a></li>
                                <li><a href="ServiceUpdate.jsp"><i class="fa fa-circle-o"></i>Update</a></li>
                                <li><a href="ServiceRemove.jsp"><i class="fa fa-circle-o"></i>Remove</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
                            
                        

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- loader-->
  <link href="assets/css/pace.min.css" rel="stylesheet"/>
  <script src="assets/js/pace.min.js"></script>
  <!--favicon-->
  <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
  <!-- simplebar CSS-->
  <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
  <!-- Bootstrap core CSS-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Sidebar CSS-->
  <link href="assets/css/sidebar-menu.css" rel="stylesheet"/>
  <!-- Custom Style-->
  <link href="assets/css/app-style.css" rel="stylesheet"/>
  <style type="text/css">
     
th,td{
text-transform:uppercase;

  }
  </style>
  
</head>

<body class="bg-theme bg-theme1">

<!-- start loader -->
   <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
   <!-- end loader -->

<!-- Start wrapper-->
 <div id="wrapper">

 <!--Start sidebar-wrapper-->
  <div id="wrapper">
		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar=""
			data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="index.html"> <img src="assets/images/logo-icon.png"
					class="logo-icon" alt="logo icon">
					<h5 class="logo-text">Dashtreme Admin</h5>
				</a>
			</div>
			<ul class="sidebar-menu do-nicescrol">
				<li class="sidebar-header">MAIN NAVIGATION</li>
				<li><a href="byproduct.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i> <span>Product</span>
				</a></li>

				<li><a href="viewspecific.jsp"> <i class="zmdi zmdi-view-dashboard"></i> <span>Category</span>
				</a></li>
				<li><a href="byproduct.jsp"><i
						class="zmdi zmdi-chart-donut text-success"></i> <span>Back</span></a></li>


				<li class="sidebar-header">LABELS</li>
				<li><a href="javaScript:void();"><i
						class="zmdi zmdi-coffee text-danger"></i> <span>Important</span></a></li>
				<li><a href="indexfront.html"><i
						class="zmdi zmdi-chart-donut text-success"></i> <span>Logout</span></a></li>
				<li><a href="javaScript:void();"><i
						class="zmdi zmdi-share text-info"></i> <span>Information</span></a></li>

			</ul>

		</div>

  

<!--Start topbar header-->
<header class="topbar-nav">
 <nav class="navbar navbar-expand fixed-top">
  <ul class="navbar-nav mr-auto align-items-center">
    <li class="nav-item">
      <a class="nav-link toggle-menu" href="javascript:void();">
       <i class="icon-menu menu-icon"></i>
     </a>
    </li>
    <li class="nav-item">
      <form class="search-bar">
        <input type="text" class="form-control" placeholder="Enter keywords">
         <a href="javascript:void();"><i class="icon-magnifier"></i></a>
      </form>
    </li>
  </ul>
     
   <ul class="navbar-nav align-items-center right-nav-link">
    <li class="nav-item dropdown-lg">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
      <i class="fa fa-envelope-open-o"></i></a>
    </li>
    <li class="nav-item dropdown-lg">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
      <i class="fa fa-bell-o"></i></a>
    </li>
    <li class="nav-item language">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();"><i class="fa fa-flag"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
          <li class="dropdown-item"> <i class="flag-icon flag-icon-gb mr-2"></i> English</li>
          <li class="dropdown-item"> <i class="flag-icon flag-icon-fr mr-2"></i> French</li>
          <li class="dropdown-item"> <i class="flag-icon flag-icon-cn mr-2"></i> Chinese</li>
          <li class="dropdown-item"> <i class="flag-icon flag-icon-de mr-2"></i> German</li>
        </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
        <span class="user-profile"><img src="https://via.placeholder.com/110x110" class="img-circle" alt="user avatar"></span>
      </a>
      <ul class="dropdown-menu dropdown-menu-right">
       <li class="dropdown-item user-details">
        <a href="javaScript:void();">
           <div class="media">
             <div class="avatar"><img class="align-self-start mr-3" src="https://via.placeholder.com/110x110" alt="user avatar"></div>
            <div class="media-body">
            <%
					String email = Email.getEmail();
				%>
            <p class="user-subtitle"><%=email%></p>
            </div>
           </div>
          </a>
        </li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-envelope mr-2"></i> Inbox</li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-wallet mr-2"></i> Account</li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-settings mr-2"></i> Setting</li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-power mr-2"></i> <a href="indexfront.html">Logout</a></li>
      </ul>
    </li>
  </ul>
</nav>
</header>

<!--End topbar header-->
<div class="clearfix"></div>
<center>	
  <div id="page-wrapper" style="background-color:rgb(183, 218, 241);margin-top:10%;margin-left:19%;" > 
			<table class="table table-bordered" style="background-color:rgb(205, 222, 236); margin-top:10%;margin-left:0%;" > 
			
			<tr>
                    <th style="background-color:rgb(5, 26, 43); color:white;">Id</th>
                     <th style="background-color:rgb(5, 26, 43); color:white;">Name</th>
                    <th style="background-color:rgb(5, 26, 43); color:white;">Product Name</th>
                    <th style="background-color:rgb(5, 26, 43); color:white;">Quantity</th>
                    <th style="background-color:rgb(5, 26, 43); color:white;">Total Amount</th>
                     <th style="background-color:rgb(5, 26, 43); color:white;">Action</th>
           </tr>
				
			 <%
                    
					 
            		try
            		{
            			
            			Connection con=ConnectionDb.connect();
            			
            			PreparedStatement ps1=con.prepareStatement("select * from orderproduct where email=? ");
            			ps1.setString(1,email);
            			ResultSet rs=ps1.executeQuery();
            			while(rs.next())
            			{
                    %>
                       <tr>
                          <td style="color:black;"><%=rs.getString(1) %>  </td>
                          <td style="color:black;"><%=rs.getString(2) %>  </td>
                          <td style="color:black;"><%=rs.getString(3) %>  </td>
                          <td style="color:black;"><%=rs.getString(4) %>  </td>
                          <td style="color:black;"><%=rs.getString(5) %>  </td>
                          <td ><a href="odelete.jsp?oid=<%=rs.getString(1)%>">Cancel</a></td>
                      </tr> 
                    <%
            			}
            		}catch(Exception e)
            		{
            			e.printStackTrace();
            		}
                      %>  
                </table> 
			
			
		</div>
    </center>
      <div class="overlay toggle-menu"></div>
    
      <!--end overlay-->

  </div>
  <!-- End container-fluid-->
  
 </div><!--End content-wrapper-->
 <!--Start Back To Top Button-->
  <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
  <!--End Back To Top Button-->
  
  <!--Start footer-->
 
  <!--End footer-->
  
  <!--start color switcher-->
 <div class="right-sidebar">
  <div class="switcher-icon">
    <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
  </div>
  <div class="right-sidebar-content">

    <p class="mb-0">Gaussion Texture</p>
    <hr>
    
    <ul class="switcher">
      <li id="theme1"></li>
      <li id="theme2"></li>
      <li id="theme3"></li>
      <li id="theme4"></li>
      <li id="theme5"></li>
      <li id="theme6"></li>
    </ul>

    <p class="mb-0">Gradient Background</p>
    <hr>
    
    <ul class="switcher">
      <li id="theme7"></li>
      <li id="theme8"></li>
      <li id="theme9"></li>
      <li id="theme10"></li>
      <li id="theme11"></li>
      <li id="theme12"></li>
      <li id="theme13"></li>
      <li id="theme14"></li>
      <li id="theme15"></li>
    </ul>
    
   </div>
 </div>
<!--end color switcher-->
 
</div><!--End wrapper-->


<!-- Bootstrap core JavaScript-->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
  
<!-- simplebar js -->
<script src="assets/plugins/simplebar/js/simplebar.js"></script>
<!-- sidebar-menu js -->
<script src="assets/js/sidebar-menu.js"></script>

<!-- Custom scripts -->
<script src="assets/js/app-script.js"></script>
  <script src="language.js"></script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div id="google_translate_element"></div>
</body>
</html>
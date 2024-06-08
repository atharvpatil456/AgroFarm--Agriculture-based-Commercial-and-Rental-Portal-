<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<%@ page import="com.Rental.Admin"%>
<%@ page import="java.util.Base64"%>
<%@ page import="com.Rental.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Display</title>

<!-- Add your CSS links here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/icons.css">
<link rel="stylesheet" href="assets/css/app-style.css">
<link href="assets/css/pace.min.css" rel="stylesheet" />
<script src="assets/js/pace.min.js"></script>
<!--favicon-->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- simplebar CSS-->
<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
<!-- Bootstrap core CSS-->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- animate CSS-->
<link href="assets/css/animate.css" rel="stylesheet" type="text/css" />
<!-- Icons CSS-->
<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
<!-- Sidebar CSS-->
<link href="assets/css/sidebar-menu.css" rel="stylesheet" />
<!-- Custom Style-->
<link href="assets/css/app-style.css" rel="stylesheet" />
<style type="text/css">
    /* Style for product grid container */
    
    .product-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center; /* Space between the products */
    }

    .product-grid {
        background: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 15px; /* Add padding to the product boxes */
        margin: 15px; /* Add margin to create space between boxes */
        text-align: center;
        flex: 0 1 calc(33.33% - 30px); /* Each product takes 1/3 of the container width with some margin */
        border-radius: 25px;
    }

    .product-grid img {
        max-width: 100%;
        height: auto;
        border: 1px solid #e0e0e0;
        padding: 10px;
    }

    .product-grid h4 {
        font-size: 14px;
        color: #555; /* Black color for product name */
        margin-top: 5px;
    }

    .product-grid p {
        font-size: 12px;
        color: #555; /* Black color for product description */
        margin-top: 5px;
    }

    .product-grid button {
        background: #f0c14b;
        border: none;
        color: #111;
        font-weight: 700;
        padding: 10px 20px;
        margin-top: 10px;
        cursor: pointer;
    }

    .product-grid button:hover {
        background: #d0b848;
    }

    /* Custom media queries for responsiveness */
    @media screen and (max-width: 768px) {
        .product-grid {
            margin: 10px;
        }
    }
</style>

</head>

<body class="bg-theme bg-theme1">

    <!-- start loader -->
    <div id="pageloader-overlay" class="visible incoming">
        <div class="loader-wrapper-outer">
            <div class="loader-wrapper-inner">
                <div class="loader"></div>
            </div>
        </div>
    </div>
    <!-- end loader -->

    <!-- Start wrapper-->
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
                        <form action="viewspecific.jsp" method="get">
                            <label for="category">Category:</label>
                            <input type="text" name="category" id="category">
                            <button type="submit">Search</button>
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

        <!-- End sidebar-wrapper -->
        <div class="content-wrapper">
            <div class="product-container">
                <%
                String category = request.getParameter("category");
				String status="approve";
                if (category != null && !category.isEmpty()) {
                    try {
                        Connection con = ConnectionDb.connect();
                        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM product WHERE category = ? and status=?");
                        pstmt.setString(1, category);
                        pstmt.setString(2,status);
                        ResultSet rs = pstmt.executeQuery();

                        while (rs.next()) {
                            byte[] imageData = rs.getBytes("file");
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                %>
                <div class="product-grid">
                    <img src="data:image/jpeg;base64, <%=base64Image%>" alt="Product Image">
                    <h4><%=rs.getString("pname")%></h4>
                       
                    <p><%=rs.getString("pdesc")%></p>
                    <p>Price: <%=rs.getDouble("pamt")%></p>
                   <a href="productBuy.jsp?pid=<%=rs.getString(1)%>"><button class="btn btn-light px-5">Buy</button></a>
                </div>
                <%
                        }
                        rs.close();
                        pstmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                %>
                <p>Please enter a category to search for products.</p>
                <%
                }
                %>
            </div>
        </div>

        <!-- Bootstrap core JavaScript and any additional scripts -->
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
    </div>
</body>
</html>


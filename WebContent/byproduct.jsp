<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Rental.ConnectionDb"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.Admin"%>
<%@ page import="java.util.Base64"%>
<%@ page import="com.Rental.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Product Listing</title>
<!-- Add your CSS and JavaScript links here -->
<!-- loader-->
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
<link href="assets/css/app-style.css" rel="stylesheet" />

<script src="language.js"></script>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<style type="text/css">
/* Style for product grid container */
.product-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center; /* Center-align the products */
}

.product-grid {
	background: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	padding: 15px; /* Add padding to the product boxes */
	margin: 15px; /* Add margin to create space between boxes */
	text-align: center;
	flex: 1; /* Make each product take equal space in the container */
	max-width: 300px; /* Set a maximum width for each product */
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
	color: #555;
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

 h4{
text-transform:uppercase;
}

</style>
<header class="topbar-nav"> <nav
	class="navbar navbar-expand fixed-top">
<ul class="navbar-nav mr-auto align-items-center">
	<li class="nav-item"><a class="nav-link toggle-menu"
		href="javascript:void();"> <i class="icon-menu menu-icon"></i>
	</a></li>
	<li class="nav-item"></li>
</ul>

	
		
</nav> </header>


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
				<a href="product.jsp"> <img src="assets/images/logo-icon.png"
					class="logo-icon" alt="logo icon">
					<h5 class="logo-text" href="product.jsp">Buyer</h5>
				</a>
			</div>
			<ul class="sidebar-menu do-nicescrol">
				<li class="sidebar-header">MAIN NAVIGATION</li>
				<li><a href="byproduct.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i> <span>Product</span>
				</a></li>

				<li><a href="viewspecific.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i> <span>Category</span>
				</a></li>
				<li><a href="viewOrder.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i> <span>My Order</span>
				</a></li>
				<li><a href="product.jsp"><i
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
		<!--End sidebar-wrapper-->
		<div class="content-wrapper">
			<div class="product-container">
				<%
					String status = "approve";
					Connection con = ConnectionDb.connect();
					PreparedStatement pstmt = con.prepareStatement("SELECT * from product where status=?");
					pstmt.setString(1, status);
					ResultSet rs = pstmt.executeQuery();
					int productCount = 0;
					while (rs.next()) {
						byte[] imageData = rs.getBytes("file");
						String base64Image = Base64.getEncoder().encodeToString(imageData);
				%>
				<div class="col-md-4 product-grid">
					<div class="product-items">
						<!-- Existing HTML structure (as in your original code) -->
						<!-- Add or modify the HTML structure for displaying product details -->
						<img class="img-responsive"
							src="data:image/jpeg;base64, <%=base64Image%>" height="100%"
							width="100%" alt="">
						<h4><%=rs.getString("pname")%></h4>
						<h4><%=rs.getString("pdesc")%></h4>
						<h4>
							Price:
							<%=rs.getDouble("pamt")%></h4>
						<a href="productBuy.jsp?pid=<%=rs.getString(1)%>"><button
								class="btn btn-light px-5">Buy</button></a>
					</div>
				</div>
				<%
					productCount++;
						if (productCount % 3 == 0) {
				%>
			</div>
			<div class="product-container">
				<%
					}
					}
					rs.close();
					pstmt.close();
					con.close();
				%>
			</div>

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
	<div id="google_translate_element"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Rental.ConnectionDb"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.Admin"%>
<%@ page import="java.util.Base64"%>
<%@ page import="com.Rental.User"%>
<%@ page import="com.Rental.DistanceCalculator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

.h3, h4 {
	text-transform: uppercase;
}

/* Custom media queries for responsiveness */
@media screen and (max-width: 768px) {
	.product-grid {
		margin: 10px;
	}
}

/* Add this style for the "Add to Cart" button */
.btn-block {
	background-color: white; /* Set the background color to white */
	color: #333; /* Set the text color */
	border: 1px solid #333; /* Add a border */
	transition: background-color 0.3s; /* Add a smooth transition effect */
}

.btn-block:hover {
	background-color: #f0f0f0; /* Change the background color on hover */
}

/* Style for date-time inputs */
input[type="datetime-local"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
}
</style>

</head>
<body class="bg-theme bg-theme1">

	<%
		Connection con = ConnectionDb.connect();
		String no = request.getParameter("no");

		String km = request.getParameter("km");
		//int a=Integer.parseInt(no);

		PreparedStatement pstmt = con.prepareStatement(
				"SELECT equipment.image, equipment.eid, equipment.ename, admininfo.Name,admininfo.Mobile, equipment.ehoursprice,equipment.edayprice, equipment.eavailibilty,admininfo.Latitude,admininfo.Lognitude,equipment.eno FROM equipment JOIN admininfo ON equipment.eid = admininfo.id  where eno=?");
		pstmt.setString(1, no);
		ResultSet rs = pstmt.executeQuery();
		int a = 0;
	%>
	<div>

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
					<a href="index.jsp"> <img src="assets/images/logo-icon.png"
						class="logo-icon" alt="logo icon">
						<h5 class="logo-text">Dashtreme Admin</h5>
					</a>
				</div>
				<ul class="sidebar-menu do-nicescrol">
					<li class="sidebar-header">MAIN NAVIGATION</li>
					<li><a href="index.jsp"> <i
							class="zmdi zmdi-view-dashboard"></i> <span>User</span>
					</a></li>




					<li><a href="category.jsp"> <i
							class="zmdi zmdi-chart-donut text-success"></i><span>Back</span>
					</a></li>



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



			<!--End topbar header-->
			<div class="content-wrapper">
				<div class="container-fluid Row--">


					<!-- add image and card view here -->

					<center>
						<%
							while (rs.next()) {
								byte[] imageData = rs.getBytes(1);

								String base64Image = Base64.getEncoder().encodeToString(imageData);
								a = rs.getInt(11);
						%>
						<div class="col-md-3"></div>
						<div class="col-md-3 product-grid">
							<div class="product-items">
								<div class="project-eff">
									<div>
										<div id="nivo-lightbox-demo">
											<p>
												<a href="images/pro1.jpg" data-lightbox-gallery="gallery1"
													id="nivo-lightbox-demo"><span class="rollover1">
												</span> </a>
											</p>
										</div>
										<img class="img-responsive"
											src="data:image/jpeg;base64, <%=base64Image%>" height="100%"
											width="100%" alt="">
									</div>
								</div>
								<br>
								<div class="produ-cost">
									<h3><%=rs.getString(3)%></h3>
									<h4>
										Hour price:
										<%=rs.getInt(6)%></h4>
									<h4>
										Day price:
										<%=rs.getInt(7)%>
									</h4>
									<h4>
										Owner:
										<%=rs.getString(4)%>
									</h4>
									<h4>
										Status:
										<%=rs.getString(8)%></h4>
									<h4>
										distance:<%=km%>
										km
									</h4>


								</div>
							</div>
						</div>
						      <%
							}
						%>



						<div id="wrapper">

							<div class="loader-wrapper">
								<div class="lds-ring">
									<div></div>
									<div></div>
									<div></div>
									<div></div>
								</div>
							</div>
							<div class="card card-authentication1 mx-auto my-5">
								<div class="card-body">
									<div class="card-content p-2">

										<div class="card-title text-uppercase text-center py-3">Add
											To Cart</div>
										<form action="Bill.jsp" method="post">
											<!-- define action here -->
											<div class="form-group">
												<div class="form-group">
													<label for="input-3">Todays Date</label>
													<div class="position-relative has-icon-right">
														<input type="datetime-local" name="today"
															class="form-control" id="today"
															placeholder="date and time">
														<div class="form-control-position"></div>
													</div>
												</div>
											</div>
											<div>
												<input type="hidden" name="no" value="<%=a%>">
											</div>
											<div class="form-group">
												<label for="input-3">release date</label>
												<div class="position-relative has-icon-right">
													<input type="datetime-local" name="release"
														class="form-control" id="release"
														placeholder="date and time">
													<div class="form-control-position"></div>
												</div>
											</div>
									</div>
									<button type="submit" class="btn btn-light btn-block">buy</button>

									</form>


									<!--Start Back To Top Button-->
									<a href="javaScript:void();" class="back-to-top"><i
										class="fa fa-angle-double-up"></i> </a>
									<!--End Back To Top Button-->

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

								</div>
								<!--wrapper-->

								<!-- Bootstrap core JavaScript-->
								<script src="assets/js/jquery.min.js"></script>
								<script src="assets/js/popper.min.js"></script>
								<script src="assets/js/bootstrap.min.js"></script>

								<!-- sidebar-menu js -->
								<script src="assets/js/sidebar-menu.js"></script>

								<!-- Custom scripts -->
								<script src="assets/js/app-script.js"></script>
							</div>
							<div id="google_translate_element"></div>
</body>
</html>
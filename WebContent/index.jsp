<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Rental Dashboard</title>
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

</head>
<body class="bg-theme bg-theme1">
	<div>
		<img
			src="https://images.pexels.com/photos/1719669/pexels-photo-1719669.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
			height="100%" width="100%" alt="saw">
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
						<h5 class="logo-text">Rental</h5>
					</a>
				</div>
				<ul class="sidebar-menu do-nicescrol">
					<li class="sidebar-header">MAIN NAVIGATION</li>
					<li><a href="login.jsp"> <i class="zmdi zmdi-lock"></i> <span>User
								Login</span>
					</a></li>



					<li><a href="Adtable.jsp"> <i class="zmdi zmdi-lock">
								<%
									String emailorg = Email.getEmail();

									Connection con = ConnectionDb.connect();

									int id = 0;
									String name = null;
									String city = null;
									String taluka = null;
									String mobile = null;
									String email = null;
									try {
										PreparedStatement pstmt = con.prepareStatement("select * from admininfo where email=? ");
										pstmt.setString(1, emailorg);

										ResultSet rs = pstmt.executeQuery();
										int i = 0;
										while (rs.next()) {
											id = rs.getInt(1);
											name = rs.getString(2);
											mobile = rs.getString(3);
											city = rs.getString(6);
											taluka = rs.getString(7);
											i = 1;
										}

										Admin.setId(id);
										Admin.setCity(city);
										Admin.setMobile(mobile);
										Admin.setName(name);
										Admin.setTaluka(taluka);
										Admin.setEmail(emailorg);

										if (i > 1) {
											response.sendRedirect("index.jsp");
										}

									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</i> <span>Rent Product </span>
					</a></li>


					<!-- <li><a href="AdminReg.jsp" > <i
							class="zmdi zmdi-account-circle"></i> <span>Admin Signup</span>
					</a></li>
					 -->
					<li><a href="index2.jsp"><i
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



			<!--End topbar header-->
			<div></div>

		</div>
		<script src="language.js"></script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div id="google_translate_element"></div>
</body>
</html>
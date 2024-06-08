<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Register</title>
<!-- loader-->
<link href="assets/css/pace.min.css" rel="stylesheet" />
<script src="assets/js/pace.min.js"></script>
<!--favicon-->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- Bootstrap core CSS-->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- animate CSS-->
<link href="assets/css/animate.css" rel="stylesheet" type="text/css" />
<!-- Icons CSS-->
<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
<!-- Custom Style-->
<link href="assets/css/app-style.css" rel="stylesheet" />
  <script src="language.js"></script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
      

</head>

<body class="bg-theme bg-theme1">

	<%
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String address = request.getParameter("address");

		System.out.println("lat " + lat);
		System.out.println("lng " + lng);

		// double lati=Double.parseDouble(lat);
		//double log=Double.parseDouble(lng);
		//int id=0;

		//Connection con=Auth.connect();
		//PreparedStatement pstmt=con.prepareStatement("insert into map values(?,?,?,?)");
	%>

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

		<div class="card card-authentication1 mx-auto my-4">
			<div class="card-body">
				<div class="card-content p-2">
					<div class="text-center">
						<img src="assets/images/logo-icon.png" alt="logo icon">
					</div>
					<div class="card-title text-uppercase text-center py-3">Admin
						Sign Up</div>

					<form action="Adsignup">


						<a href="GetLocationOnMap.html">Location</a>

						<div class="form-group">
							<label for="exampleInputPassword" class="sr-only">Latitude</label>
							<div class="position-relative has-icon-right">
								<input type="double" name="latitude" value="<%=lat%>"
									id="exampleInputPassword" class="form-control input-shadow"
									placeholder="latitude">
								<div class="form-control-position"></div>
							</div>
						</div>

						<div class="form-group">
							<label for="exampleInputPassword" class="sr-only">lognitude</label>
							<div class="position-relative has-icon-right">
								<input type="double" name="lognitude" value="<%=lng%>"
									id="exampleInputPassword" class="form-control input-shadow"
									placeholder="Lognitude">
								<div class="form-control-position"></div>
							</div>
						</div>


						<!-- admin signup here -->
						<div class="form-group">
							<label for="exampleInputName" class="sr-only">Name</label>
							<div class="position-relative has-icon-right">
								<input type="text" name="username" id="exampleInputName"
									class="form-control input-shadow" placeholder="Enter Your Name">
								<div class="form-control-position"></div>
							</div>
						</div>


						<div class="form-group">
							<label for="exampleInputEmailId" class="sr-only">Location</label>
							<div class="position-relative has-icon-right">
								<input type="Location" name="location" id="exampleInputEmailId"
									class="form-control input-shadow" placeholder="Location">
								<div class="form-control-position"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmailId" class="sr-only">Location</label>
							<div class="position-relative has-icon-right">
								<input type="Location" name="city" id="exampleInputEmailId"
									class="form-control input-shadow" placeholder="city">
								<div class="form-control-position"></div>
							</div>
						</div>


						<div class="form-group">
							<label for="exampleInputEmailId" class="sr-only">Location</label>
							<div class="position-relative has-icon-right">
								<input type="Location" name="taluka" id="exampleInputEmailId"
									class="form-control input-shadow" placeholder="Taluka">
								<div class="form-control-position"></div>
							</div>
						</div>



						<div class="form-group">
							<div class="icheck-material-white">
								<input type="checkbox" id="user-checkbox" checked="" /> <label
									for="user-checkbox">I Agree With Terms & Conditions</label>
							</div>
						</div>

						<button type="submit"
							class="btn btn-light btn-block waves-effect waves-light">Sign
							Up</button>
						<div class="text-center mt-3">Sign Up With</div>


					</form>
				</div>
			</div>
			<div class="card-footer text-center py-3">
				<p class="text-warning mb-0">
					Already have an account? <a href="signin.html"> Sign In here</a>
				</p>
			</div>
		</div>

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
<div id="google_translate_element"></div>
	<!-- Bootstrap core JavaScript-->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- sidebar-menu js -->
	<script src="assets/js/sidebar-menu.js"></script>

	<!-- Custom scripts -->
	<script src="assets/js/app-script.js"></script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Rental.ConnectionDb"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
      


</head>
<style>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        #wrapper {
            display: flex;
        }

        #sidebar-wrapper {
            /* Add your sidebar styles here */
        }

        .content-wrapper {
            flex: 1;
            padding: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        .table th {
            background-color: #007bff;
            color: #fff;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table a {
            color: #007bff;
            text-decoration: none;
        }

        .table a:hover {
            text-decoration: underline;
        }
    
th,td{
text-transform:uppercase;
}
</style>
<body class="bg-theme bg-theme1">

	<%
		int id = Admin.getId();
		Connection con = ConnectionDb.connect();
		PreparedStatement pstmt = con.prepareStatement("select * from equipment where eid=?");
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		int i = 0;
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
				<li><a href="index.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i> <span>Dashboard</span>
				</a></li>

				<li><a href="Addequi.html"> <i
						class="zmdi zmdi-view-dashboard"></i> <span>Add item</span>
				</a></li>

				<li><a href="AdminReg.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i><span> Add Info</span>
				</a></li>

				<li><a href="index.jsp"> <i
						class="zmdi zmdi-view-dashboard"></i><span> Back</span>
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

		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row mt-6">
					<div class="col-lg-6">
						<div class="">
							<div class="">
								<h5 class="card-title">Basic Table</h5>
								<div class="">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Name</th>
												<th scope="col">Deposite</th>
												<th scope="col">price</th>
												<th scope="col">Status</th>
												<th scope="col">update</th>
												<th scope="col">date Time</th>
												<th scope="col">delete</th>
												<th scope="col">update status</th>

											</tr>
										</thead>
										<tbody>
											<%
												while (rs.next()) {
											%>
											<tr>
												<th scope="row"><%=i = i + 1%></th>
												<td><%=rs.getString(3)%></td>
												<td><%=rs.getInt(8)%></td>
												<td><%=rs.getInt(7)%></td>
												<td><%=rs.getString(4)%></td>
												<td><a href="update.jsp?no=<%=rs.getInt(2)%>">update</a></td>
												<td><%=rs.getString(9)%></td>
												<td><a href="Delete.jsp?no=<%=rs.getInt(2)%>">delete</a></td>

												<td><a href="change.jsp?no=<%=rs.getInt(2)%>">update
														status</a></td>
												<td><a href="viewadtable.jsp?no=<%=rs.getInt(1)%>">View Image</a></td>
												
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>



					<!--End Row-->

					<!--start overlay-->
					<div class="overlay toggle-menu"></div>
					<!--end overlay-->

				</div>
				<!-- End container-fluid-->

			</div>
			<!--End content-wrapper-->
			<!--Start Back To Top Button-->
			<a href="javaScript:void();" class="back-to-top"><i
				class="fa fa-angle-double-up"></i> </a>
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

		</div>
		<!--End wrapper-->
<div id="google_translate_element"></div>

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
</body>
</html>
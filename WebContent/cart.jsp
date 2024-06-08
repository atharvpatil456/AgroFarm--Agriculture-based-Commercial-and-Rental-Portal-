<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.Rental.ConnectionDb"  %>
<%@ page import="java.sql.*" %>
<%@ page import="com.Rental.Admin"%>
<%@ page import="java.util.Base64"%>
<%@ page import="com.Rental.User" %>
<%@ page import="com.Rental.DistanceCalculator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
  /* Style for product grid container */
  .product-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* Center-align the products */
  }

  .product-grid {
    background: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 15px;
    margin: 15px;
    text-align: center;
    flex: 1;
    max-width: 250px; /* Adjust this value to your desired width */
    border-radius: 25px;
    height: 100%; /* Make each product box take up the full height */
    display: flex;
    flex-direction: column;
  }

  .product-items {
    flex: 1; /* Make this div take up the remaining space */
    display: flex;
    flex-direction: column;
  }

  .product-grid img {
    max-width: 100%;
    flex: 1; /* Make the image take up the remaining space */
    border: 1px solid #e0e0e0;
    padding: 10px;
    object-fit: contain; /* Ensure the image fits within the box */
  }

  .product-grid h3 {
    font-size: 16px;
    color: #333;
    margin-top: 10px;
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
h3,h4{
text-transform:uppercase;
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
<%
String cat=request.getParameter("category");
Connection con =ConnectionDb.connect();
PreparedStatement pstmt=con.prepareStatement("SELECT equipment.image, equipment.eid, equipment.ename, admininfo.Name,admininfo.Mobile, equipment.ehoursprice,equipment.edayprice, equipment.eavailibilty,admininfo.Latitude,admininfo.Lognitude,equipment.eno,equipment.ecategory FROM equipment JOIN admininfo ON equipment.eid = admininfo.id where ecategory=? order by dateTime desc");
pstmt.setString(1,cat);
ResultSet rs =pstmt.executeQuery();

double lat1;
double log1;

double Distance;
%>



<!-- start loader -->
   <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
   <!-- end loader -->

<!-- Start wrapper-->
 <div id="wrapper">

  <!--Start sidebar-wrapper-->
   <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
     <div class="brand-logo">
      <a href="index.html">
       <img src="assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
       <h5 class="logo-text">Dashtreme Admin</h5>
     </a>
   </div>
   <ul class="sidebar-menu do-nicescrol">
      <li class="sidebar-header">MAIN NAVIGATION</li>
      <li>
        <a href="index.html">
          <i class="zmdi zmdi-view-dashboard"></i> <span>Dashboard</span>
        </a>
      </li>

      <li>
        <a href="Addequi.html">
          <i class="zmdi zmdi-view-dashboard"></i> <span>Add item</span>
        </a>
      </li>

      <li>
        <a href="indexfront.html">
          <i class="zmdi zmdi-view-dashboard"></i><span>logout</span>
        </a>
      </li>

     
      <li class="sidebar-header">LABELS</li>
      <li><a href="javaScript:void();"><i class="zmdi zmdi-coffee text-danger"></i> <span>Important</span></a></li>
      <li><a href="javaScript:void();"><i class="zmdi zmdi-chart-donut text-success"></i> <span>Warning</span></a></li>
      <li><a href="javaScript:void();"><i class="zmdi zmdi-share text-info"></i> <span>Information</span></a></li>

    </ul>
   
   </div>
   
    <div class="content-wrapper">
    <div class="container-fluid row">
     
      
          <!-- add image and card view here -->
          
             
         
   
    	<% while(rs.next()){ 
    		byte[] imageData = rs.getBytes(1);

  	      String base64Image = Base64.getEncoder().encodeToString(imageData);
  	      
  	      lat1=rs.getDouble(9);
  	      log1=rs.getDouble(10);
  	  double lat2=User.getR_lat();
  	  double log2=User.getR_log();
  	      
  	      
	      System.out.println(log2);
	      System.out.println(lat2);
	      System.out.println(log1);
	      System.out.println(lat1);
  	      Distance=(int)DistanceCalculator.calculateDistance(lat1, log1, lat2, log2);
  	      
  	      
  	      System.out.println(Distance);
  	      
    	%>
    	<div class="col-md-2"></div>
        <div class="col-md-3 product-grid">
    		<div class="product-items">
	    		    <div class="project-eff">
	    		    <div>
						<div id="nivo-lightbox-demo"> <p> <a href="images/pro1.jpg"data-lightbox-gallery="gallery1" id="nivo-lightbox-demo"><span class="rollover1"> </span> </a></p></div>     
							<img class="img-responsive" src="data:image/jpeg;base64, <%= base64Image%>" height="100%" width="100%" alt="">
					</div>
					</div>
					<br>
	    		<div class="produ-cost">
                    <h3><%= rs.getString(3)%></h3>
                    <h4>Hour price: <%=rs.getInt(6)  %></h4>
                    <h4>Day price: <%= rs.getInt(7) %> </h4>
                    <h4>Owner: <%=rs.getString(4) %> </h4>
	    			<h4>Status: <%=rs.getString(8) %></h4>
	    			<h4>  distance:<%=Distance %> km</h4>
	    			
                   <a href="buy.jsp?no=<%=rs.getInt(11)%>&km=<%=Distance%>"><button class="btn btn-light px-5">View</button></a>    
	    		</div>
    		</div>
    	</div>
      <%} %>



            </div>
            </div>

        

      
    <!--End Row-->
	  
	  <!--start overlay-->
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
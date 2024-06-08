<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.Rental.ConnectionDb"  %>
<%@ page import="com.Rental.Admin"%>
<%@ page import="java.util.Base64"%>
<%@ page import="com.Rental.User" %>
<%@ page import="com.Rental.DistanceCalculator" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="com.Rental.RowData" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Math" %>
<%@ page import="com.Rental.DistanceCalculator" %>
<%@ page import="java.sql.*" %>

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
</head>
<body class="bg-theme bg-theme1">
<%
String cat=request.getParameter("category");
Connection con =ConnectionDb.connect();
PreparedStatement pstmt=con.prepareStatement("SELECT equipment.image, equipment.eid, equipment.ename, admininfo.Name,admininfo.Mobile, equipment.ehoursprice,equipment.edayprice, equipment.eavailibilty,admininfo.Latitude,admininfo.Lognitude,equipment.eno,equipment.ecategory FROM equipment JOIN admininfo ON equipment.eid = admininfo.id  order by dateTime desc");
//pstmt.setString(1,cat);

ResultSet rs =pstmt.executeQuery();

double userlatitude = User.getR_lat();
double userlongitude = User.getR_log();
double latitude;
double longitude;
double distance;

ArrayList<RowData> rows = new ArrayList<RowData>();
%>

<% while(rs.next()){ 
	int eid = rs.getInt(2);
	String ename = rs.getString(3);
	int hourprice = rs.getInt(6);
	int dayprice = rs.getInt(7);
	String aname = rs.getString(4);
	String status = rs.getString(8);
	
	byte[] imageData = rs.getBytes(1);

    String base64Image = Base64.getEncoder().encodeToString(imageData);
    latitude = rs.getDouble(9);
    longitude = rs.getDouble(10);
    
    distance = DistanceCalculator.calculateDistance(userlatitude, userlongitude, latitude, longitude);

    
    int dis = (int)distance;
    
    rows.add(new RowData(base64Image,eid,ename,hourprice,dayprice,aname,dis,status)); 
   
}
class RowDataComparator implements Comparator<RowData> {
    @Override
    public int compare(RowData r1, RowData r2) {
        return Double.compare(r1.getDistance(), r2.getDistance());
    }
}

// Sort the data based on distance in ascending order
Collections.sort(rows, new RowDataComparator());
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
        <a href="index.html">
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
          
             
         
   
    
  	      
    	<% for (RowData row : rows) { %>
    	<div class="col-md-2"></div>
        <div class="col-md-3 product-grid">
    		<div class="product-items">
	    		    <div class="project-eff">
					<div>   
						<div id="nivo-lightbox-demo"> <p> <a href="images/pro1.jpg"data-lightbox-gallery="gallery1" id="nivo-lightbox-demo"><span class="rollover1"> </span> </a></p></div>     
							<img class="img-responsive" src="data:image/jpeg;base64, <%= row.getImage() %>" height="100%" width="100%" alt="">
					</div>
			</div>
					<br>
	    		<div class="produ-cost">
                    
                   <h3><%=  row.getEname()%></h3>
                    <h4>Hour price: <%=row.getHourprice()  %></h4>
                    <h4>Day price: <%= row.getDayprice() %> </h4>
                    <h4>Owner: <%= row.getAname() %></h4>
                    <h4>Distance: <%= row.getDistance()%> km</h4>
	    			<h4>Status: <%=row.getStatus() %></h4>
	    			
	    			<a href="buy.jsp?no=<%=rs.getInt(11)%>&km=<%=row.getDistance()%>"><button class="btn btn-light px-5">View</button></a>    
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

                
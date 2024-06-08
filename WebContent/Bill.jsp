<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Rental.ConnectionDb"  %>
    <%@page import ="java.time.LocalDateTime" %>
       <%@page import ="java.time.Duration" %>
        
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>Dashtreme Admin - Free Dashboard for Bootstrap 4 by Codervent</title>
  <!-- loader-->
  <link href="assets/css/pace.min.css" rel="stylesheet"/>
  <script src="assets/js/pace.min.js"></script>
  <!--favicon-->
  <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
  <!-- Bootstrap core CSS-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Custom Style-->
  <link href="assets/css/app-style.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <script src="language.js"></script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

  <style>
    .card {
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 20px;
    }

    .total {
      font-size: 1.2rem;
      font-weight: bold;
    }
    p{
text-transform:uppercase;
}
    
  </style>
  
</head>

<body class="bg-theme bg-theme1">
  <div>
<%
String today=request.getParameter("today");
String release=request.getParameter("release");
String no=request.getParameter("no");

System.out.println(today+" "+release);

LocalDateTime startDate = LocalDateTime.parse(today);
LocalDateTime endDate = LocalDateTime.parse(release);

Duration duration = Duration.between(startDate, endDate);

long days = duration.toDays();
long hours = duration.minusDays(days).toHours();
long total=0;
int dprice=0;
int hprice=0;



System.out.println("Difference in days: " + days);
System.out.println("Difference in hours: " + hours);




Connection con =ConnectionDb.connect();
String km=request.getParameter("km");
//int a=Integer.parseInt(no);
PreparedStatement pstmt=con.prepareStatement("SELECT equipment.image, equipment.eid, equipment.ename, admininfo.Name,admininfo.Mobile, equipment.ehoursprice,equipment.edayprice, equipment.eavailibilty,admininfo.Latitude,admininfo.Lognitude,equipment.eno,equipment.Deposite FROM equipment JOIN admininfo ON equipment.eid = admininfo.id  where eno=?");
pstmt.setString(1,no);
ResultSet rs =pstmt.executeQuery();
int eno=0;

/*while(rs.next()){
	 hprice=rs.getInt(6);
	 dprice=rs.getInt(7);
}*/
//total=hprice*hours+dprice*dprice;

%>
    
    


<!-- Start wrapper-->
 

 
		  <div class="card-title text-uppercase text-center py-3">add to cart</div>
   
      <div class="container mt-6">
    <div class="row">
      <div class="col-md-6 mx-auto">
        <div class="card">
          <h3 class="text-center mb-4">Bill Details</h3>
          	<% while(rs.next()){
          		hprice=rs.getInt(6);
          		dprice=rs.getInt(7);
          		eno=rs.getInt(11);
          		total=hprice*hours+dprice*days;
          		%>
          <p><strong>equipment Name:</strong> <%=rs.getString(3)%></p>
          <p><strong>Owner Name:</strong> <%=rs.getString(4)%></p>
          <p><strong>Owner Name:</strong> <%=rs.getString(3)%></p>
          <p><strong>Booking Date:</strong> <%=today%></p>
          <p><strong>Release Date:</strong> <%=release%></p>
          <p><strong>day price:</strong><%=rs.getInt(7)%></</p>
          <p><strong>hours price:</strong><%=rs.getInt(6)%></</p>
          <p><strong>deposite:</strong><%=rs.getInt(12)%></</p>
          <hr>
          <div class="total text-right">
            <p><strong>Total Amount:<%=total %></strong></p>
          </div>
          
        <%}%>  
        
        <form action="Combo">
        <input type="hidden" name="no" value="<%=eno%>">
        <input type="hidden" name="amount" value="<%=total%>">
        <input type="hidden" name="release" value="<%=release%>">
        
        <button type="submit" class="btn btn-primary btn-block">Confirm Booking</button>
        </form>
        </div>
      </div>
    
    </div>
  </div>
		   
		  
    
     <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
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
	
	</div><!--wrapper-->
	
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
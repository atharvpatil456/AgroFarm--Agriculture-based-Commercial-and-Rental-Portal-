<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Rental.ConnectionDb"  %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <%  
      Connection con=ConnectionDb.connect();
      String acc=request.getParameter("no");
      int a=Integer.parseInt(acc);
      PreparedStatement pstmt=con.prepareStatement("delete from equipment where eno=?");
      pstmt.setInt(1,a);
      int i=pstmt.executeUpdate();
      
      if(i>0){
    	  response.sendRedirect("Adtable.jsp");
      }else{
    	  response.sendRedirect("Delete.jsp");
      }
     
   %>
   <script src="language.js"></script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div id="google_translate_element"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<head>
   <script src="language.js"></script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</head>    
<body>
<div id="google_translate_element"></div>
<%
try
{
	String pid=request.getParameter("pid");
	String approve="approve";
	Connection con=ConnectionDb.connect();
	PreparedStatement ps1=con.prepareStatement("update product set status=? where pid=?");
	ps1.setString(1,approve);
	ps1.setString(2,pid);
	int i=ps1.executeUpdate();
	if(i==1)
	{
		response.sendRedirect("adminview.jsp");
	}
	}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>
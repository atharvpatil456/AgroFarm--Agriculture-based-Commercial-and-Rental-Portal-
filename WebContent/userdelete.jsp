<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	String id=request.getParameter("id");
	Connection con=ConnectionDb.connect();
	PreparedStatement ps1=con.prepareStatement("delete from admininfo where id=?");
	ps1.setString(1,id);
	int i=ps1.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("adminview.jsp");
	}
	}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<script src="language.js"></script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div id="google_translate_element"></div>
</body>
</html>
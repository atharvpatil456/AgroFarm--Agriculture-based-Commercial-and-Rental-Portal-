<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<%@ page import="java.io.OutputStream" %>
<% Blob image = null;

	Connection con = null;

	byte[ ] imgData = null ;

	PreparedStatement stmt = null;

	ResultSet rs = null;

	try {

		String pid1=request.getParameter("pid");
		int pid=Integer.parseInt(pid1);
		con =ConnectionDb.connect();
		stmt=con.prepareStatement("select file from product where pid=?");
		stmt.setInt(1, pid);
		rs= stmt.executeQuery();
		
		if (rs.next()) {

		image = rs.getBlob(1);


		imgData = image.getBytes(1,(int)image.length());

	} else {

			out.println("Display Blob Example");

			out.println("image not found for given id>");

		return;

	}


// display the image

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);


o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");



return;

} finally {

try {

rs.close();


stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();


}

}

%>
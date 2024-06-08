<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<%@ page import="java.io.OutputStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    Blob image = null;
    Connection con = null;
    byte[] imgData = null ;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    OutputStream o = null; // Declare the OutputStream outside of try-catch

    try {
        String pid1 = request.getParameter("no");
        int no = Integer.parseInt(pid1);
        con = ConnectionDb.connect();
        stmt = con.prepareStatement("select * from equipment where eid=?");
        stmt.setInt(1, no);
        rs = stmt.executeQuery();

        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given id>");
            return;
        }

        // display the image
        response.setContentType("image/gif");

        o = response.getOutputStream();
        o.write(imgData);
    } catch (Exception e) {
        out.println("Unable To Display image");
        e.printStackTrace(); // Log the exception for debugging purposes
    } finally {
        try {
            if (o != null) {
                o.flush();
                o.close();
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging purposes
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Log the exception for debugging purposes
            }
        }
    }
%>
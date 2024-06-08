package com.Rental;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Adsignup
 */
public class Adsignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adsignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("username");
		String email = Email.getEmail();  // Assuming you have a method to get email from Email class
	    String loc = request.getParameter("location");
	    String city = request.getParameter("city");
	    String taluka = request.getParameter("taluka");
	    String lognitude = request.getParameter("lognitude");
	    String latitude = request.getParameter("latitude");

	    double log = Double.parseDouble(lognitude);
	    double lat = Double.parseDouble(latitude);

	    System.out.println(name + " " + loc + " " + city + " " + taluka + " " + lognitude + " " + latitude+" "+ email);
	    Connection con = ConnectionDb.connect();

	    try {
	        PreparedStatement pstmt = con.prepareStatement("UPDATE admininfo SET name=?, location=?, city=?, taluka=?, lognitude=?, latitude=? WHERE email=?");
	        pstmt.setString(1, name);
	        pstmt.setString(2, loc);
	        pstmt.setString(3, city);
	        pstmt.setString(4, taluka);
	        pstmt.setDouble(5, log);
	        pstmt.setDouble(6, lat);
	        pstmt.setString(7, email);

	        int i = pstmt.executeUpdate();

	        if (i > 0) {
	            response.sendRedirect("Adtable.jsp");
	        }
	        else {
	            response.sendRedirect("AdSignup.jsp");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}

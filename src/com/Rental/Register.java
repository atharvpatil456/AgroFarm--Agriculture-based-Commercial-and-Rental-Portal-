package com.Rental;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name=request.getParameter("username");
		String mobile=request.getParameter("mobile"); //convert
		String loc=request.getParameter("location");
		String city=request.getParameter("city");
		String taluka=request.getParameter("taluka");//convert
		String email = Email.getEmail(); 
		
		
		
		
		System.out.println(name+" "+mobile+" "+loc+" "+city+" "+taluka+" "+email);
		Connection con =ConnectionDb.connect();
		
		int d=0;
		
		try {
			PreparedStatement pstmt =con.prepareStatement("insert into userinfo values(?,?,?,?,?,?,?)");
			pstmt.setInt(1,d);
			pstmt.setString(2, name);
			pstmt.setString(3,mobile);
			pstmt.setString(4,loc);
			pstmt.setString(5, taluka);
			pstmt.setString(6, city);
			pstmt.setString(7, email);
			
			
			int i=pstmt.executeUpdate();
			 
			if(i>0){
				response.sendRedirect("login.jsp");
			}else{
				response.sendRedirect("register.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

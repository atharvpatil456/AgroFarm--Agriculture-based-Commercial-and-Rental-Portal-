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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String email=Email.getEmail();
		
		Connection con=ConnectionDb.connect();
		
		  String lat=request.getParameter("latitude");
		  String lng=request.getParameter("lognitude");
		 

		  System.out.println("lat "+lat);
		  System.out.println("lng "+lng); 
		  double lati=Double.parseDouble(lat);
		  double log=Double.parseDouble(lng);
		  String name=null;
		  String location=null;
		  String mobile=null;
		  String dist = null;
		  String talu = null;

		 int uid=0;
		  
		   User.setR_lat(lati);
		   User.setR_log(log);
		
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from userinfo where email=?");
			pstmt.setString(1,email);
			
			
			ResultSet rs=pstmt.executeQuery();
			int i=0;
			while(rs.next()){
				uid=rs.getInt(1);
				name=rs.getString(2);
				mobile=rs.getString(3);
				dist=rs.getString(4);
				talu=rs.getString(5);
				location=rs.getString(6);
				email = rs.getString(7 );
				i=1;
			}
			
	System.out.println(name);
	User.setLoc(location);
	User.setName(name);
	User.setContact(mobile);
	User.setR_id(uid);
	User.setEmail(email);
	User.setDist(dist);
	User.setTalu(talu);
	
	
			
			if(i==1){
				response.sendRedirect("category.jsp");
			}
			else{
				response.sendRedirect("login.jsp");
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

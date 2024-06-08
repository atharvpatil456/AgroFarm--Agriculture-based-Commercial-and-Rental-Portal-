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

import com.Rental.ConnectionDb;
//import com.agro.Email;

/**
 * Servlet implementation class AdLogin
 */
public class AdLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());	
		String username=request.getParameter("email");
		String pass=request.getParameter("password");
		
		Connection con=ConnectionDb.connect();
		
		int id=0;
		String name=null;
		String city=null;
		String taluka=null;
		String mobile=null;
		
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from admininfo where Name=? and Password=? ");
			pstmt.setString(1,username);
			pstmt.setString(2,pass);
			
			ResultSet rs=pstmt.executeQuery();
			int i=0;
			while(rs.next()){
				id=rs.getInt(1);
				name=rs.getString(2);
				mobile=rs.getString(3);
				city=rs.getString(6);
				taluka=rs.getString(7);
				i=1;
			}
			
			
			Admin.setId(id);
			Admin.setCity(city);
			Admin.setMobile(mobile);
			Admin.setName(name);
			Admin.setTaluka(taluka);
			
			if(i==1){
				response.sendRedirect("Adtable.jsp");
			}
			else{
				response.sendRedirect("signin.html");
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
//		String email = request.getParameter("email");
//		String password=request.getParameter("password");
//		
//		Connection con = ConnectionDb.connect();
//		try{
//			PreparedStatement ps1 = con.prepareStatement("select * from admininfo where email =? and password =?");
//			ps1.setString(1,email);
//			ps1.setString(2,password);
//			ResultSet rs=ps1.executeQuery();
//			if(rs.next())
//			{
//				//Email.setEmail(email2);
//				response.sendRedirect("Adtable.jsp");
//			}
//			else
//			{
//				response.sendRedirect("signin.html");
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

}

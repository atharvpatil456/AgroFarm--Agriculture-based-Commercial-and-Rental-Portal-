package com.Rental;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Loginfront
 */
public class Loginfront extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginfront() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String email2 = request.getParameter("email2");
		String password2=request.getParameter("password2");
		
		Connection con = ConnectionDb.connect();
		try{
			PreparedStatement ps1 = con.prepareStatement("select * from admininfo where email =? and password =?");
			ps1.setString(1,email2);
			ps1.setString(2,password2);
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				Email.setEmail(email2);
				
				response.sendRedirect("index2.jsp");
	
				
			}
			else
			{
				response.sendRedirect("loginfront.html");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

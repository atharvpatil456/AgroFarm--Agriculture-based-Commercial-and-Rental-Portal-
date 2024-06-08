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
 * Servlet implementation class Combo
 */
public class Combo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Combo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int eid=Integer.parseInt(request.getParameter("no"));
		String rdate=request.getParameter("release");
		String  amount=request.getParameter("amount");
		int amm=Integer.parseInt(amount);
		
		
		int uid=User.getR_id();
		String loc=User.getLoc();
		String uname=User.getName();
		String mobile=User.getContact();
		System.out.println(uid);
		System.out.println(uname);
		System.out.println(mobile);
		System.out.println(loc);
		
		
		
		Connection con=ConnectionDb.connect();
		String query = "SELECT  equipment.ename, admininfo.Name,admininfo.id FROM equipment JOIN admininfo ON equipment.eid = admininfo.id where eno=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(query);
			stmt.setInt(1, eid);
			ResultSet rs = stmt.executeQuery();
			String ename = null;
			String aname = null;
			int aid = 0;
			if(rs.next())
			{
				ename = rs.getString(1);
				aname = rs.getString(2);
				aid = rs.getInt(3);
			}
			
	    stmt=con.prepareStatement("insert into combine values(?,?,?,?,?,?,?,?,?,?,?)");
		stmt.setInt(1, 0);
		stmt.setInt(2, eid);
		stmt.setInt(3, aid);
		stmt.setInt(4, uid);
		stmt.setString(5, ename);
		stmt.setString(6, aname);
		stmt.setString(7, uname);
		stmt.setString(8, loc);
		stmt.setString(9, mobile);
		stmt.setInt(10, amm);
		stmt.setString(11, rdate);
		stmt.executeUpdate();
		
		query = "update equipment set eavailibilty = 'unavailable ' where eno = ?;";
		stmt = con.prepareStatement(query);
		stmt.setInt(1, eid);
		int i = stmt.executeUpdate();
		
		
	
		
		if(i>0){
		response.sendRedirect("user.jsp");
		}else{
			response.sendRedirect("cart.jsp");
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

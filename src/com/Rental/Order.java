package com.Rental;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Order
 */
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			String name = request.getParameter("name");
			String quantity = request.getParameter("quantity");	
			int qnt=Integer.parseInt(quantity);
			String addr = request.getParameter("addr");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pname = Email.getPname();
			String pamt = Email.getPamt();
			String email = Email.getEmail();
			int pamt1=Integer.parseInt(pamt);
			int price=qnt*pamt1;
			
		
				// connects to the database
				Connection con = ConnectionDb.connect();

				// constructs SQL statement
				PreparedStatement ps1 = con.prepareStatement("insert into orderproduct values(?,?,?,?,?,?,?,?,?)");
				ps1.setInt(1, 0);
				ps1.setString(2, name);
				ps1.setString(3, pname);
				ps1.setString(4, quantity);
				ps1.setInt(5, price);
				ps1.setString(6, addr);
				ps1.setString(7, city);
				ps1.setString(8, state);
				ps1.setString(9, email);
				int i = ps1.executeUpdate();
				if(i>0)
					{
						Email.setName(name);
						response.sendRedirect("success.html");
					}
					else
					{
						response.sendRedirect("order.jsp");
					}
				} catch (Exception e) {
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

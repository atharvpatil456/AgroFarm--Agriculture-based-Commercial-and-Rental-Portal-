package com.Rental;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Addequi
 */
@MultipartConfig(maxFileSize = 16177215)
public class Addequi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addequi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name=request.getParameter("equiname");
		String details=request.getParameter("equidetails");
		String cat=request.getParameter("category");
		String dprice=request.getParameter("dprice");
		String hprice=request.getParameter("hprice");
		String deposite=request.getParameter("deposite");
		String dt=request.getParameter("datetime");
		
		int day=Integer.parseInt(dprice);
		int hours=Integer.parseInt(hprice);
		int depo=Integer.parseInt(deposite);
		int id=Admin.getId();
		int no=0;
		String availability="available"; //for testing purpose only
		
		InputStream inputStream = null; // input stream of the upload file
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            //obtains input stream of the upload file
            //the InputStream will point to a stream that contains
            //the contents of the file
            inputStream = filePart.getInputStream();
        }
		
		
		
		Connection con=ConnectionDb.connect();
		
		try {
			
			//applied condition of all field are mandotary by using add statement
			//String query="insert into equipment(eid,eno,ename,eavailability,ecategory,ehoursprice,edayprice,Deposite,DateTime,eabout) values(?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt=con.prepareStatement("insert into equipment(eid,eno,ename,eavailibilty,ecategory,ehoursprice,edayprice,Deposite,DateTime,image,eabout) values(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1,id);
			pstmt.setInt(2,no);
			pstmt.setString(3, name);
			pstmt.setString(4,availability);
			pstmt.setString(5, cat);
			pstmt.setInt(6,hours);
			pstmt.setInt(7, day);
			pstmt.setInt(8,depo);
			pstmt.setString(9,dt);
		
			
			 if(inputStream!=null){
				 pstmt.setBinaryStream(10, inputStream,inputStream.available());
			 }
			 pstmt.setString(11,details);
			
			int a=pstmt.executeUpdate();
			if(a>0){
				response.sendRedirect("Adtable.jsp");
			}else{
				response.sendRedirect("Addequi.html");
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

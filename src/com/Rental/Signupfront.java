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

import com.Rental.ConnectionDb;
@MultipartConfig(maxFileSize = 16177215)
/**
 * Servlet implementation class Signupfront
 */
public class Signupfront extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signupfront() {
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
		String message = null;
		Connection con = null;

		String email = request.getParameter("email");
		String password= request.getParameter("password");
		String mobile = request.getParameter("mobile");
		String name = request.getParameter("name");
		
		InputStream inputStream = null;
		Part filePart = request.getPart("file");
		if (filePart != null){
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		try {
			// connects to the database
			con = ConnectionDb.connect();

			// constructs SQL statement
			String sql = ("INSERT INTO admininfo (id,name, email, password, mobile,file) values(?,?,?,?,?,?)");
			PreparedStatement ps1 = con.prepareStatement(sql);
			ps1.setInt(1, 0);
			ps1.setString(2, name);
			ps1.setString(3, email);
			ps1.setString(4, password);
			ps1.setString(5, mobile);
		

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				//ps1.setBlob(6, inputStream);
				ps1.setBinaryStream(6, inputStream, (int) filePart.getSize());
			}

			// sends the statement to the database server
			int row = ps1.executeUpdate();
			if (row > 0) {
				message = "File uploaded and saved into database";
			}
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (con != null) {
				// closes the database connection
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			request.setAttribute("Message", message);

			// forwards to the message page
			getServletContext().getRequestDispatcher("/loginfront.html").forward(request, response);
		}
	}
	}



package com.Rental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDb {
	public static  Connection connect(){
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("driver loaded");
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/rentaldata","root","");
			System.out.println("Connnection Established");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   return (con);	
	}
}

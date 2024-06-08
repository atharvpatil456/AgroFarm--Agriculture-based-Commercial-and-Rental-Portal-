package com.Rental;

public class Admin {

	
	public static int id;
	public static String name;
	public static String taluka;
	public static String city;
	public static String mobile;
	public static String email;
	
	public static int getId() {
		return id;
	}
	public static void setId(int id) {
		Admin.id = id;
	}
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		Admin.name = name;
	}
	public static String getTaluka() {
		return taluka;
	}
	public static void setTaluka(String taluka) {
		Admin.taluka = taluka;
	}
	public static String getCity() {
		return city;
	}
	public static void setCity(String city) {
		Admin.city = city;
	}
	public static String getMobile() {
		return mobile;
	}
	public static void setMobile(String mobile) {
		Admin.mobile = mobile;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String Email) {
		Admin.email = email;
	}
}


//String name=request.getParameter("username");
//String mobile=request.getParameter("mobile"); //convert
//String pass=request.getParameter("password");
//String loc=request.getParameter("location");
//String city=request.getParameter("city");
//String taluka=request.getParameter("taluka");
//String lognitude=request.getParameter("lognitude");//convert
//String latitude
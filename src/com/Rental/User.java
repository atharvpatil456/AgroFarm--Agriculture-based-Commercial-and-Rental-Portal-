package com.Rental;



public class User {

	public static double r_lat;
	public static double r_log;
	public static String r_add;
	public static int r_id;
	public static String name;
	public static String loc;
	public static String contact;
	public static String email;
	public static String talu;
	public static String dist;
	
	
	
	public static String getContact() {
		return contact;
	}
	public static void setContact(String contact) {
		User.contact = contact;
	}
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		User.name = name;
	}
	public static String getLoc() {
		return loc;
	}
	public static void setLoc(String loc) {
		User.loc = loc;
	}
	public static double getR_lat() {
		return r_lat;
	}
	public static void setR_lat(double r_lat) {
		User.r_lat = r_lat;
	}
	public static double getR_log() {
		return r_log;
	}
	public static void setR_log(double r_log) {
		User.r_log = r_log;
	}
	public static String getR_add() {
		return r_add;
	}
	public static void setR_add(String r_add) {
		User.r_add = r_add;
	}
	public static int getR_id() {
		return r_id;
	}
	public static void setR_id(int r_id) {
		User.r_id = r_id;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		User.email= email;
	}
	
	
	public static String getTalu() {
		return talu;
	}
	public static void setTalu(String talu) {
		User.talu= talu;
	}
	public static String getDist() {
		return dist;
	}
	public static void setDist(String dist) {
		User.dist= dist;
	}

}

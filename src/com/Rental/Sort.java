package com.Rental;

public class Sort {
		private String image;
		private int eid;
		private String ename;
		private float hourprice;
		private float dayprice;
		private String aname;
		private int distance;
		private String status;
		
		
		public Sort(String image, int eid, String ename, float hourprice, float dayprice, String aname, int distance,String status) {
			super();
			this.image = image;
			this.eid = eid;
			this.ename = ename;
			this.hourprice = hourprice;
			this.dayprice = dayprice;
			this.aname = aname;
			this.distance = distance;
			this.status = status;
		}
		public String getImage() {
			return image;
		}
		public int getEid() {
			return eid;
		}
		public String getEname() {
			return ename;
		}
		public float getHourprice() {
			return hourprice;
		}
		public float getDayprice() {
			return dayprice;
		}
		public String getAname() {
			return aname;
		}
		public int getDistance() {
			return distance;
		}
		public String getStatus() {
			return status;
		}


		
		
		
	}


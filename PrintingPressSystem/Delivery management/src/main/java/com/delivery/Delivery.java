package com.delivery;

public class Delivery {
	private int id ;
	   private int cus_id;
	   private String customername ;
	   private String deliverytype;
	   private String deliverydate ;
	   private String orderid;
	   private String shortname;
	   private String location;
	   private String postalcode;
	   
	   
	   
	public Delivery(int id, int cus_id,String customername, String deliverytype, String deliverydate, String orderid, String shortname,
			String location, String postalcode) {
		
		this.id = id;
		this.cus_id=cus_id;
		this.customername = customername;
		this.deliverytype =deliverytype;
		this.deliverydate = deliverydate;
		this.orderid = orderid;
		this.shortname = shortname;
		this.location = location;
		this.postalcode = postalcode;
	}



	public int getId() {
		return id;
	}



	


	public int getCus_id() {
		return cus_id;
	}



	


	public String getCustomername() {
		return customername;
	}



	



	public String getDeliverytype() {
		return deliverytype;
	}



	


	public String getDeliverydate() {
		return deliverydate;
	}



	


	public String getOrderid() {
		return orderid;
	}



	


	public String getShortname() {
		return shortname;
	}



	


	public String getLocation() {
		return location;
	}



	



	public String getPostalcode() {
		return postalcode;
	}



	

	
	
	   
	   
	   
}

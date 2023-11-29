package com.delivery;

  
public class Driver {
	private int dr_id ;
	private String drivername;
	private String nic;
	private String team;
	private String vehicle;
	private String phone;
	
	
	
	public Driver(int dr_id, String drivername, String nic, String team, String vehicle, String phone) {
		
		this.dr_id = dr_id;
		this.drivername = drivername;
		this.nic = nic;
		this.team = team;
		this.vehicle = vehicle;
		this.phone = phone;
	}



	public int getDr_id() {
		return dr_id;
	}



	


	public String getDrivername() {
		return drivername;
	}





	public String getNic() {
		return nic;
	}





	public String getTeam() {
		return team;
	}



	


	public String getVehicle() {
		return vehicle;
	}






	public String getPhone() {
		return phone;
	}



	
	
	

}

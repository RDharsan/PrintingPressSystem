package com.delivery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class DriverDBUtil {
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;

	public static List<Driver> validate(String DriverName, String Nic)
	{
		
		ArrayList<Driver> driver=new ArrayList<>();
		
		
		//validate
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="select * from driver where drivername='"+DriverName+"' and nic='"+Nic+"'";
			
			rs=stmt.executeQuery(sql);
			
			
			if(rs.next()) {
				 int dr_id=rs.getInt(1);
				 String drivername=rs.getString(2);
				 String nic=rs.getString(3);
				 String team=rs.getString(4);
				 String vehicle=rs.getString(5);
				 String phone=rs.getString(6);
				
				 
				 Driver a=new  Driver(dr_id, drivername ,nic, team, vehicle,  phone);
				driver.add(a);
				 
			}
		}
		
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
			
		return driver;
		
	}
	
	
	
	
	//Insert Data
	public static boolean insertdriver(String drivername,String nic,String team,String vehicle ,String phone)
	{
		boolean isSuccess=false;
		
		
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql="insert into driver values(0,'"+drivername+"','"+nic+"','"+ team+"','"+vehicle+"','"+phone+"')";
		    int rs=stmt.executeUpdate(sql);
		    
		    if(rs>0)
		     {
		    	isSuccess=true;
		     }
		    else
		     {
		    	isSuccess=false;
		     }
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public  static boolean updatedriver (String dr_id,String drivername,String nic,String team,String vehicle ,String phone)
	{
		
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql="update  driver set drivername='"+drivername+"',nic='"+nic+"',team='"+team+"',vehicle='"+vehicle+"',phone='"+phone+"'"
			            +"where dr_id='"+dr_id+"'";
		    int rs=stmt.executeUpdate(sql);
		    
		    if(rs>0)
		     {
		    	isSuccess=true;
		     }
		    else
		     {
		    	isSuccess=false;
		     }
		}
		
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	
	public static List<Driver> getDriverDetails(String Id)
	{
		int convertedID =Integer.parseInt(Id);
		ArrayList<Driver> driver=new ArrayList<>();
		
		try {
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="select * from driver where dr_id='"+convertedID+"'";
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next())
			{
				int dr_id=rs.getInt(1);
				 String drivername=rs.getString(2);
				 String nic=rs.getString(3);
				 String team=rs.getString(4);
				 String vehicle=rs.getString(5);
				 String phone=rs.getString(6);
				
				 
				 
				 Driver m=new  Driver(dr_id, drivername ,nic, team, vehicle,  phone);
				driver.add(m);
			}
		}
		
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return driver;
	}
	
	public  static boolean deletedriver (String deleteid)
	{
		int convId =Integer.parseInt(deleteid);
		try 
		{

			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="delete from driver where dr_id='"+convId+"'";
			int r=stmt.executeUpdate(sql);
			if(r>0)
		     {
		    	isSuccess=true;
		     }
		    else
		     {
		    	isSuccess=false;
		     }
		}
		
		
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	
	
}

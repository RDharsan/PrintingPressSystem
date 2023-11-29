package com.delivery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;








   public class DeliveryDBUtil {

	   private static boolean isSuccess;
		private static Connection con=null;
		private static Statement stmt=null;
		private static ResultSet rs=null;

	   
	public static List<Delivery> validate(String customerName,String orderId){
		
		ArrayList<Delivery> delivery=new ArrayList<>();
		
		
     try {
    	    con=DBConnect.getConnection();
    	    stmt=con.createStatement();
			String sql="select * from adddelivery where customername='"+customerName+"' and orderid='"+orderId+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			if(rs.next()) {
				 int id=rs.getInt(1);
				 int cus_id=rs.getInt(2);
				 String customername=rs.getString(3);
				 String deliverytype=rs.getString(4);
				 String deliverydate=rs.getString(5);
				 String orderid=rs.getString(6);
				 String shortname=rs.getString(7);
				 String location=rs.getString(8);
				 String postalcode=rs.getString(9);
				 
				 Delivery d =new  Delivery(id, cus_id, customername,deliverytype,deliverydate ,orderid,shortname,
						 location, postalcode);
				 delivery.add(d);
				 
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return delivery;
		
		
	}
	
	
	//Insert Data
		public static boolean insertdelivery(int cus_id,String customername,String deliverytype ,String deliverydate ,String orderid ,String shortname ,String location ,String postalcode)
		{
			boolean isSuccess=false;
			
		
			
			try {
					
				 con=DBConnect.getConnection();
		    	 stmt=con.createStatement();				
				 String sql="insert into adddelivery values(0,'"+cus_id+"','"+customername+"','"+deliverytype+"','"+deliverydate+"','"+orderid+"','"+shortname+"','"+location+"','"+postalcode+"')";
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
	
		
		public  static boolean updatedelivery (String id,String cus_id,String customername,String deliverytype ,String deliverydate ,String orderid ,String shortname ,String location ,String postalcode)
		{
			
			
			try {
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				
				String sql="update  adddelivery set cus_id='"+cus_id+"',customername='"+customername+"',deliverytype='"+deliverytype+"',deliverydate='"+deliverydate+"',orderid ='"+orderid +"',shortname='"+shortname+"',location='"+location+"',postalcode='"+postalcode+"'"
				            +"where id='"+id+"'";
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
		
		
		
	
		public static List<Delivery> getDeliveryDetails(String Id)
		{
			int convertedID =Integer.parseInt(Id);
			ArrayList<Delivery> delivery=new ArrayList<>();
			
			try {
				
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				String sql="select * from adddelivery where id='"+convertedID+"'";
				rs=stmt.executeQuery(sql);
				
				
				while(rs.next())
				{
					 int id=rs.getInt(1);
					 int cus_id=rs.getInt(2);
					 String customername=rs.getString(3);
					 String deliverytype=rs.getString(4);
					 String deliverydate=rs.getString(5);
					 String orderid=rs.getString(6);
					 String shortname=rs.getString(7);
					 String location=rs.getString(8);
					 String postalcode=rs.getString(9);
					 
					 Delivery m=new Delivery(id,cus_id,  customername,deliverytype,deliverydate ,orderid , shortname ,
							 location, postalcode);
					 
					 delivery.add(m);
				}
			}
			
			catch(Exception e) 
			{
				e.printStackTrace();
			}
			
			return delivery;
		}
		
		public  static boolean deletedelivery (String id)
		{
			int convId =Integer.parseInt(id);
			try 
			{

				con=DBConnect.getConnection();
				stmt=con.createStatement();
				String sql="delete from adddelivery where id='"+convId+"'";
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		//Driver class
		public static boolean insertdriver(int dr_id,String drivername,String type ,String team ,String vehicle ,String phone )
		{
			boolean isSuccess=false;
			
		
			
			try {
					
				 con=DBConnect.getConnection();
		    	 stmt=con.createStatement();				
				 String sql="insert into adddelivery values(0,'"+drivername+"','"+type+"','"+team+"','"+vehicle+"','"+phone+"')";
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
	
		

}

		
		
		
		


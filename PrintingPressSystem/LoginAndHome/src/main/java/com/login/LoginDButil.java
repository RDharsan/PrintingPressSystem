package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDButil {

	private String url="jdbc:mysql://localhost:3306/newveenaprinters";
	private String userU="root";
	private String pass="dharsanravi.33";
	
	private String dbDriver="com.mysql.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con=null;
		try {
			con=DriverManager.getConnection(url, userU, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	public boolean validate(Login login) {
		// TODO Auto-generated method stub
		boolean status=false;
		loadDriver(dbDriver);
		Connection con=getConnection();
		
		String sql="select * from login where username=? and password=? ";
		
		PreparedStatement ps;
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, login.getUsername());
			ps.setString(2, login.getPassword());
			
			ResultSet rs=ps.executeQuery();
			status=rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status;
		
	}
	
	
	
}

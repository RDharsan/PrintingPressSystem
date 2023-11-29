package ReturnProduct;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException; 
public class Database {
	 public static Connection initializeDatabase() 
		        throws SQLException, ClassNotFoundException 
		    { 
		        // Initialize all the information regarding 
		        // Database Connection 
		        String dbDriver = "com.mysql.cj.jdbc.Driver"; 
		        String dbURL = "jdbc:mysql:// localhost:3306/"; 
		        // Database name to access 
		        String dbName = "newveenaprinters"; 
		        String dbUsername = "root"; 
		        String dbPassword = "dharsanravi.33"; 
		  
		        Class.forName(dbDriver); 
		        Connection con = DriverManager.getConnection(dbURL + dbName, 
		                                                     dbUsername,  
		                                                     dbPassword); 
		        return con; 
		    } 
		} 

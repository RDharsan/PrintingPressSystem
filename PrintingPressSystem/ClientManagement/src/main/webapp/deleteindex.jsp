<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %> 
    
    
    <%	

		String id=request.getParameter("id");
	
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("delete from customers where id=?");
		pst.setString(1, id);
		pst.executeUpdate();
		
		
		%>
		
		<script>
			alert("Record Deleteddd");
			location.href = 'index.jsp';
			
		</Script>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
</head>
<body>
<div align="center">
<h1>Record Deleted</h1>
<a href="index.jsp"><input type="button" name="back" value="Back"></a>
</div>
</body>
</html>
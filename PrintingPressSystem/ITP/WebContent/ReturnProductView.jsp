<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "newveenaprinters";
String userid = "root";
String password = "dharsanravi.33";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/table.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">
<style>
.button1 {
  background-color: #0080c0;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
.button2 {
  background-color: #ff0000;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
//Header and Navigation

<meta charset="ISO-8859-1">
<title>Return Product</title>
</head>
<body>

<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="img/img.jpeg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="ReturnProductCreate.jsp">Add Return Product</a></li>
  	<li><a href="ReturnProductView.jsp">Return Product details</a></li>
  	<li><a href="ProductReport.jsp">Return Product Report</a></li>
  <li><a href="Feedback.jsp">Feedback details</a></li>
   <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li><br>
  </ul>
 </div>

    
 </div>
 
 
<br>
<br>
<h2>Return Product Details</h2>

<div class="">
			  <center>
							
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">ID</th>
								 <th scope="col">Product No</th>
								 <th scope="col">Product Type</th>
								  <th scope="col">Product QTY</th>
								   <th scope="col">Received Date</th>
								   <th scope="col">Reason for Return</th>
								   <th scope="col">No of Returning Product</th>
								   
								  
									<th>Update</th>
									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from returnp";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("pID") %></td>
				  <td><%=resultSet.getString("pNo") %></td>
				  <td><%=resultSet.getString("pType") %></td>
				  <td><%=resultSet.getString("pQty") %></td>
				  <td><%=resultSet.getString("pDate") %></td>
				  <td><%=resultSet.getString("pReason") %></td>
				  <td><%=resultSet.getString("pReturn") %></td>
				  
				  
				   <td><a href="ReturnProductUpdate.jsp?pID=<%=resultSet.getInt("pID") %>"><button class="button1" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				 
				  <td><a href="ReturnProductDelete.jsp?pID=<%=resultSet.getInt("pID") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				  
				  </tbody>
					  
			  </table>
			</center>
			
		</div>



//footer
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
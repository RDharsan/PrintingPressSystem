<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="ReturnProduct.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>NEW VEENA PRINTERS</title>
	
<link href="css/Report.css" rel="stylesheet">
	
		
<style>
    tab1 { padding-left: 16em; }
    </style>
    
</head>
<body>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

 		<%
	String pID = request.getParameter("pID");
	String driverName = "com.mysql.jdbc.Driver";
	String ConnectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "newveenaprinters";
	String UserId="root";
	String password = "dharsanravi.33";
	
	try{
		Class.forName(driverName);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	
	String Rid = request.getParameter("rID");
	String Rname = request.getParameter("rName");

%>

<div class="A4" style="border:1px solid black; padding:20px; height:39.7cm; ">

	<div class="content">
	<table width="100%">
<tr>
<td><img src="img/icon." width="750px" heigth="1122px"></td>


</tr>
	</div>
	</table>
<hr>
<br>
<p><tab1><b><u><font size="+2" color="886C65">RETURN PRODUCT REPORT</b></u></font></tab1></p>

<center><h1 class="font-weight-bold"><%=Rname%> </h1></center>
<left><p class="font-weight"><%=Rid%> </p></left>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM returnp";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
while(rs.next()){
Countrow = rs.getString(1);
out.println("Return Product  :" +Countrow);
}
}
catch (Exception e){
e.printStackTrace();
}
%>

  		<table class="table table-striped" cellspacing="18" align="center">
									<thead>
									  <th scope="col">ID</th>
								 <th scope="col">Product No</th>
								 <th scope="col">Product Type</th>
								  <th scope="col">Product QTY</th>
								   <th scope="col">Received Date</th>
								   <th scope="col">Reason for Return</th>
								   <th scope="col">No of Returning Product</th>
									  
									
										<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT * from returnp";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
													
												
											
										
									%>
									<tr>
									<td><%=resultset.getInt("pID") %></td>
									<td><%=resultset.getString("pNo") %></td>
									<td><%=resultset.getString("pType") %></td>
									<td><%=resultset.getString("pQty") %></td>
									<td><%=resultset.getString("pDate") %></td>
									<td><%=resultset.getString("pReason") %></td>
									<td><%=resultset.getString("pReturn") %></td>
									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
									
									
								  </table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer>
<p align="center"><b>PAGE NO:: 01<b></p>
<p align="center"><i><b>----------------------------CREATED BY:: NEW VEENA PRINTERS----------------------------</i><b></p>
</footer>

</div>

        
     


      <script>
        window.print();
      </script>
	
</body>
</html>
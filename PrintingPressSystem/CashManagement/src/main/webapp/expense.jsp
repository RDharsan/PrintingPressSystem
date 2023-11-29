<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@include file="nav.jsp" %>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "newveenaprinters";
String userId = "root";
String password = "dharsanravi.33";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement pst;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>EXPENSES</title>
		<link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type = "text/css" />
		<link href = "bootstrap/css/bootstrap.min.css" rel = "stylesheet" type = "text/css" />
		<link href = "styles.css" rel = "stylesheet" type = "text/css" />

</head>
<body>
<div class = "col-sm-8 container ex" >
 	<div class="panel-body">	
 		<form action="expense.jsp" method="POST">
 			<div class= "generate-top">
	 			<div><h2>Expense Summary</h2></div>
		 		<div class= "generate-pdf">
		 			<div>
		 				<select name="type" class="form-control" onchange="this.form.submit();">
				 			<option value="0">Select Expense Type</option>
				 			<option value="all">All</option>
				 			<%
				 			try {
				 				Statement stm = connection.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct type from expenxe_history");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("type") %>">
				 						<%=rs.getString("type") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
				 	</div>
			 		
	 			</div>
			</div>
	 		<table id="tbl-expense" class="table table-responsive table-bordered tbl-contain" cellpadding="0" width="100%">
		 			<thead>
						<tr>
							<th>DATE</th>
							<th>DESCRIPTION</th>
							<th>AMOUNT</th>
							<th>TYPE</th>
							<th>ID</th>
						</tr>
						<%
						ResultSet rs;
						try{ 
						String type = request.getParameter("type");
						if (type.equals("all")){
							System.out.print("1");
							String sql ="SELECT * FROM expenxe_history";
							System.out.print("2");
							statement=connection.createStatement();
							System.out.print("3");
							rs = statement.executeQuery(sql);
						}
						else {
							System.out.print(type);
							pst = connection.prepareStatement("select * from expenxe_history where type=?");
							pst.setString(1,type);
							rs = pst.executeQuery();
						}
						
						while(rs.next()){
						%>
						<tr>
							<td><%=rs.getString("date") %></td>
							<td><%=rs.getString("description") %></td>
							<td><%=rs.getString("amount") %></td>
							<td><%=rs.getString("type") %></td>
							<td><%=rs.getString("id") %></td>
						</tr>
						
						<% 
						}
						
						} catch (Exception e) {
							System.out.print(e);
						}
						%>
				</table>
 		</form>
	</div>
 </div>
</body>
</html>

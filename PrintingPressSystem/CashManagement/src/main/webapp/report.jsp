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
String sum = null;
String sum2 = null;

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>REPORT</title>
		<link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type = "text/css" />
		<link href = "bootstrap/css/bootstrap.min.css" rel = "stylesheet" type = "text/css" />
		<link href = "styles.css" rel = "stylesheet" type = "text/css" />
</head>
<body>
<div class = "col-sm-8 container ex" >
 	<div class="panel-body">
 	 
 		<form action="report.jsp" method="POST">
 			<div class= "generate-top">
	 			<h2>Generate Report</h2>
			</div>
			
		 				 		
		 	<div class ="border generate">
		 		<div style="flex-grow: 12" class="side report-filter">
		 			<label class="form-label"><b>Start Date</b></label>
		 			<input type="date" class="form-control" placeholder="Date Month year" name="startdate" id="startdate" required>
		 		</div>		
		 		<div style="flex-grow: 12" class="side report-filter">
		 			<label class="form-label"><b>End Date</b></label>
		 			<input type="date" class="form-control" placeholder="Date Month year" name="enddate" id="enddate" required>
		 		</div>
		 		<div style="flex-grow: 1" class= "report-filter">
		 			<input type="submit"  id="submit" value="Generate" name="submit"  class="button btn generate-btn" onclick="this.form.submit();">
	 			</div>
		 	</div>	
			</br>
			<div class ="report-tbl">
				<div style="flex-grow: 1">
					<div class="total-report">
					<div><p><b>Total Income:</b></p></div>
					<%
						ResultSet res;
						String d = request.getParameter("startdate");
						String d2 = request.getParameter("enddate");
						
						pst = connection.prepareStatement("select SUM(amount) Sum from income_history where (date BETWEEN ? AND ?)");
						pst.setString(1,d);
						pst.setString(2,d2);
						res = pst.executeQuery();
						while(res.next()){
							sum = res.getString("Sum");
						}
						if (sum==null){
							sum = "0";
						}
					%>
					<div><p><%=sum%></p></div>
					</div>
		 			<table id="tbl-expense" class="table table-responsive table-bordered tbl-contain" cellpadding="0" width="100%">
			 			<thead>
							<tr>
								<th>Date</th>
								<th>Income</th>
								<th>Rs.</th>
							</tr>
							<%
							ResultSet rs;
													
							String date = request.getParameter("startdate");
							String date2 = request.getParameter("enddate");
	
							
			 				pst = connection.prepareStatement("select * from income_history where (date BETWEEN ? AND ?) ORDER BY date ASC");
							pst.setString(1,date);
							pst.setString(2,date2);
							rs = pst.executeQuery();
								
							while(rs.next()){
								%>
								<tr>
									<td><%=rs.getString("date") %></td>
									<td><%=rs.getString("description") %></td>
									<td><%=rs.getString("amount") %></td>
								</tr>
								
								<%
								}
							%>
					</table>
				</div>
				<div style="flex-grow: 1">
					<div class="total-report">
					<div><p><b>Total Expense:</b></p></div>
						<%
						ResultSet res2;
							
						String d3 = request.getParameter("startdate");
						String d4 = request.getParameter("enddate");
						
						pst = connection.prepareStatement("select SUM(amount) Sum from expenxe_history where (date BETWEEN ? AND ?)");
						pst.setString(1,d3);
						pst.setString(2,d4);
						res2 = pst.executeQuery();
						while(res2.next()){
							sum2 = res2.getString("Sum");
						}
						if (sum2==null){
							sum2 = "0";
						}
					%>
					<div><p><%=sum2%></p></div>
					</div>
					<table id="tbl-expense" class="table table-responsive table-bordered tbl-contain" cellpadding="0" width="100%">
			 			<thead>
							<tr>
								<th>Date</th>
								<th>Expense</th>
								<th>Rs.</th>
							</tr>
							<%
							ResultSet rs2;
													
							String date3 = request.getParameter("startdate");
							String date4 = request.getParameter("enddate");
	
							
			 				pst = connection.prepareStatement("select * from expenxe_history where (date BETWEEN ? AND ?) ORDER BY date ASC");
							pst.setString(1,date3);
							pst.setString(2,date4);
							rs2 = pst.executeQuery();
								
							while(rs2.next()){
								%>
								<tr>
									<td><%=rs2.getString("date") %></td>
									<td><%=rs2.getString("description") %></td>
									<td><%=rs2.getString("amount") %></td>
								</tr>
								
								<%
								}
							%>
					</table>
				</div>
			</div>
 		</form>
	</div>
 </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" type="text/css">

</head>
<body>
 <div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="index.jsp">Add Customer</a></li>
  	<li><a href="product.jsp">Product details</a></li>
  	<li><a href="payment.jsp">Payment</a></li>
  	<li><a href="Report.jsp">Summary</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>

<div class="row">
	<div class="col-sm-4" style="margin-left:40%; margin-top:10%" >
		<form  method="post" action="#">
				<h1>Client Management</h1><br>
				<h2 style="color:red">Customer report</h2><br>
				
				<div align=left >
					
						
						<select name="cName" id="cName" class="form-select" onchange="this.form.submit();" style="width:300px">
				 			<option value="0">Select Customer</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct c.id,c.name from customers c");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("c.name") %>">
				 						<%=rs.getString("c.id") %>, <%=rs.getString("c.name") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
					
				</div><br>
				
				<br>
				
				<div style="margin-left:25%">
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info" style="background-color:#006478; color:white"/>
					
					
				</div>
			</form>
			<br><br>
			<div class="col-sm-8" style="margin-left:-5%">
		
		<div class="panel-body" style="margin-top:5%">
			<table id="tbl-product"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%"  >

					<thead>
						<tr>
							<th> Name </th>
							<th>Contact number</th>
							<th>Email</th>
							<th>Ordered Products</th>
						
							
						</tr>

						<%
						
						Connection con3;
						PreparedStatement pst3;
						ResultSet rs3;

						Class.forName("com.mysql.jdbc.Driver");
						con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						
						Statement st3 = con3.createStatement();
						String cName2=request.getParameter("cName");
						String query3 = "select c.name, c.phone, c.email, count(pr.id) from newveenaprinters.product pr, newveenaprinters.customers c where pr.cus_id=c.id and c.name='"+cName2+"'";
					
						rs3=st3.executeQuery(query3);
						

				
						while (rs3.next()) {
							
						%>
							<tr>
								<td><%=rs3.getString("c.name") %></td>
								<td><%=rs3.getString("c.phone") %></td>
								<td><%=rs3.getString("c.email") %></td>
								<td><%=rs3.getString("count(pr.id)") %></td>
								
								
							</tr>
							
						<% }

						%>
						
						
						
						
				</table>
				</div>
				</div>
			
			
			
	
	</div>
	
	
	<div class="col-sm-8" style="margin-left:25%">
		
		<div class="panel-body" style="margin-top:5%">

				<table id="tbl-product"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%" >

					<thead>
						<tr>
							<th>Product ID</th>
							<th>Product Type</th>
							<th>Ordered Date</th>
							<th>order quantity</th>
							<th>Payable amount</th>
							<th>Paid Amount</th>
							<th>Balance amount </th>
							
							
							
						</tr>

						<%
						
						Connection con;
						PreparedStatement pst;
						ResultSet rs1;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						
						Statement st = con.createStatement();
						String cName=request.getParameter("cName");
						String query2 = "select pr.id,pr.type, pr.ordered_date, pr.quantity, py.payableamount, py.paidamount, c.phone, c.email from customers c, product pr, cus_payment py where py.productid=pr.id and pr.cus_id=c.id and c.name='"+cName+"'";
						rs1=st.executeQuery(query2);

				
						while (rs1.next()) {
							
						%>
							<tr>
								<td><%=rs1.getString("pr.id") %></td>
								<td><%=rs1.getString("pr.type") %></td>
								<td><%=rs1.getString("pr.ordered_date") %></td>
								<td><%=rs1.getString("pr.quantity") %></td>
								<td><%=rs1.getString("py.payableamount") %></td>
								<td><%=rs1.getString("py.paidamount") %></td>
								<td><%= (Integer.parseInt(rs1.getString("py.payableamount")))-(Integer.parseInt(rs1.getString("py.paidamount"))) %></td>
							
								
							</tr>
							
						<% }

						%>
						
						
						
						
				</table>
				<br><br>
				
				
				
			</div>
		
		
		
		
		
	</div>

</div>

	<div style="margin-left: 50%; margin-bottom: 5%; margin-top:0%">
		<a href="getall.jsp"><input type="submit" id="getAll" value="Get All" name="getAll" 
			class="btn btn-info" style="background-color: #006478; color: white" /></a>


	</div>

	
	
	
	

	<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
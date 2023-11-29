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
 <div class="col-sm-8" style="margin-left:20%">
		
		<div class="panel-body" style="margin-top:15%">
			<h1 style="color:red">All records</h1><br>

				<table id="tbl-product"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%" >

					<thead>
						<tr>
							<th>Customer name</th>
							<th>Phone number</th>
							<th>Email id</th>
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
						String query2 = "select c.name, c.phone, c.email,pr.id,pr.type, pr.ordered_date, pr.quantity, py.payableamount, py.paidamount from customers c, product pr, cus_payment py where py.productid=pr.id and pr.cus_id=c.id";
						rs1=st.executeQuery(query2);

				
						while (rs1.next()) {
							
						%>
							<tr>
								<td><%=rs1.getString("c.name") %></td>
								<td><%=rs1.getString("c.phone") %></td>
								<td><%=rs1.getString("c.email") %></td>
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
 
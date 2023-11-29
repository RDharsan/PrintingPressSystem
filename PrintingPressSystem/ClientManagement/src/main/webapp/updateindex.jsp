<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%	
	if(request.getParameter("submit")!=null){
		
		//String cusid=request.getParameter("cid");
		String id=request.getParameter("id");
		String cname=request.getParameter("cname");
		String caddress=request.getParameter("caddress");
		String cemail=request.getParameter("cemail");
		String cnumber=request.getParameter("cnumber");
		String cnic=request.getParameter("cnic");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("update customers set name=?, address=?, email=?, phone=?, nic=? where id=?");
		pst.setString(1, cname);
		pst.setString(2, caddress);
		pst.setString(3, cemail);
		pst.setString(4, cnumber);
		pst.setString(5, cnic);
		pst.setString(6, id);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record Updateddd");
			location.href = 'index.jsp';
			
		</Script>
	<%		
	}

%>






<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" text="text/css">
</head>
<body>
<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
 <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
  <ul>
  <li><a href="index.jsp" active>Add Customer</a></li>
  	<li><a href="product.jsp">Product details</a></li>
  	<li><a href="payment.jsp">Payment</a></li>
  	<li><a href="Report.jsp">Summary</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>
 </div>
 
	
	
	<div class="row">
		<div class="col-sm-4"  style="margin-left:40%; margin-top:10%">
			<form method="post" action="#">
				<h1>Client Management</h1><br>
				<h2>Update Customer data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from customers where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{
					
				
					
				%>

				<div align="left">
					<label class="form-label">Customer Name</label> <input type="text"
						class="form-control" placeholder="Enter Customer name" pattern="[a-zA-Z]{1,15}" title="Name length should type between 1 to 15"
						value="<%=rs.getString("name")%>" name="cname" id="cname" style="width:300px"
						required> 
				</div>
				<br>
				<div align="left">
					<label class="form-label">Customer Address</label> <input
						type="text" class="form-control"
						placeholder="Enter Customer address" name="caddress" id="caddress" style="width:300px"
						value="<%=rs.getString("address")%>" required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Customer Email</label> <input type="text" style="width:300px"
						value="<%=rs.getString("email")%>" class="form-control" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'  title='Please enter valid email address!!'
						placeholder="Enter Customer email" name="cemail" id="cemail"
						required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Customer Contact number</label> <input
						type="text" class="form-control"
						placeholder="Enter Customer contact number" name="cnumber" style="width:300px"  pattern='[0-9]{10}' title='Please enter 10 digits!!'
						value="<%=rs.getString("phone")%>" id="cnumber" required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Customer NIC</label> <input type="text" style="width:300px"  pattern='^(?:19|20)?\d{2}(?:[0-35-8]\d\d(?<!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[vVxX0-9])$' title='Please enter valid NIC '
						value="<%=rs.getString("nic")%>" class="form-control"
						placeholder="Enter Customer nic" name="cnic" id="cnic" required>
				</div>
				<br>

				<%
				}
				%>


				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit"
						class="btn btn-info"> <input type="reset" id="reset"
						value="Reset" name="reset" class="btn btn-warning">

				</div>

				<div align="left">
					<p>
						
						<a href="index.jsp"><input type="button" id="submit" value="Back" name="submit" style="margin-top:-15%";
						class="btn btn-info"></a>
					</p>

				</div>
			</form>

		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		//String cusid=request.getParameter("cid");
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
		pst=con.prepareStatement("insert into customers(name, address, email, phone, nic )values (?,?,?,?,?)");
		pst.setString(1, cname);
		pst.setString(2, caddress);	
		pst.setString(3, cemail);
		pst.setString(4, cnumber);
		pst.setString(5, cnic);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record Added Successfully");
			
		</Script>
	<%		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesjeet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
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
	
	<br><div class="col-sm-4" style="margin-left:40%; margin-top:10%" >
		
		<form  method="post" action="#">
				<h1>Client Management</h1><br>
				<h2>Add Customer </h2>
				
				<div align=left >
					<label class="form-label">Customer Name</label> <input type="text"
						class="form-control" placeholder="Enter Customer name" style="width:300px" pattern="[a-zA-Z]{1,15}" title="Name length should type between 1 to 15"
						name="cname" id="cname" required>
				</div><br>
				<div align="left">
					<label class="form-label">Customer Address</label> <input
						type="text" class="form-control"
						placeholder="Enter Customer address" name="caddress" id="caddress" style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Customer Email</label> <input type="email" style="width:300px"
						class="form-control" placeholder="Enter Customer email"
						name="cemail" id="cemail" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'  title='Please enter valid email address!!' required>
						
				</div><br>
			
				
			
				<div align="left">
					<label class="form-label">Customer Contact number</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Customer contact number" pattern='[0-9]{10}' title='Please enter 10 digits!!'
						name="cnumber" id="cnumber" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Customer NIC</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Customer nic" pattern='^(?:19|20)?\d{2}(?:[0-35-8]\d\d(?<!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[vVxX0-9])$' title='Please enter valid NIC '
						name="cnic" id="cnic" required>
				</div>
				
				
				<br>
				
				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info"  style="background-color:#006478; color:white" />
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-info" style="background-color:#006478; color:white;">
					
				</div>
				
				<br>
			</form>
	</div>
	</div>
	
	<div class="col-sm-8" style="margin-left:18%">
		
		<div class="panel-body" style="margin-top:5%">

				<table id="tbl-customer"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%" >

					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Contact No</th>
							<th>NIC</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from customers";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("name") %></td>
							<td><%=rs.getString("address") %></td>
							<td><%=rs.getString("email") %></td>
							<td><%=rs.getString("phone") %></td>
							<td><%=rs.getString("nic") %></td>
							
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="updateindex.jsp?id=<%=id%>">EDIT</button></a></td>
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="deleteindex.jsp?id=<%=id%>">DELETE</button></td>
						
						</tr>
						
						<%
							}
						%>
				</table>
				<br><br>

			</div>
		
		
		
		
		
	</div>

</div>

<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
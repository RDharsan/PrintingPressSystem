<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    
<%	
	if(request.getParameter("submit")!=null){
		
		String pid=request.getParameter("pid");
		int pi_d=Integer.parseInt(pid);
		String type=request.getParameter("type");
		String amount=request.getParameter("amount");
		int p_amount=Integer.parseInt(amount);
		String paid=request.getParameter("paid");
		int p_paid=Integer.parseInt(paid);
		String dated=request.getParameter("dated");
		String meth=request.getParameter("method");
	
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("insert into cus_payment(productid,type,payableamount,paidamount,date,method )values (?,?,?,?,?,?)");
		pst.setInt(1, pi_d);
		pst.setString(2, type);
		pst.setInt(3,p_amount);
		pst.setInt(4,p_paid);
		pst.setString(5,dated);
		pst.setString(6,meth);

		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record Added Successfully!!");
			
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
  	<li><a href="index.jsp">Add Customer</a></li>
  	<li><a href="product.jsp">Product details</a></li>
  	<li><a href="payment.jsp">Payment</a></li>
  	<li><a href="Report.jsp">Summary</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>
 
 
<div class="row">
	<div class="col-sm-4" style="margin-left:38%; margin-top:10%" >
		<form  method="post" action="#">
				<h1>Client Management</h1><br>
				<h2>Add Payment Data </h2><br>
				
				<div align=left >
				
					
					<select name="pid" id="pid" class="form-select	" onchange="this.form.submit();" style="width:400px" >
				 			<option  >Product ID | Product type | Customer name</option>

						<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct pr.id,pr.type, c.name from product pr,customers c where pr.cus_id=c.id ");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("pr.id") %>">
				 						<%=rs.getString("pr.id") %> | <%=rs.getString("type") %> | <%=rs.getString("name") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
						
						
				</div><br>
				
				<div align="left">
					<label>Payment type</label>
					<select name="type" id="type" class="form-select" style="width:300px" required>
						<option>Advance Payment</option>
						<option>Half Payment</option>
						<option>Full Payment</option>
						<option>Random Payment</option>
					</select>
					
				</div><br>

				<div align="left">
					<label class="form-label">Payable Amount</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter payable amount" min="0"
						name="amount" id="amount" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Paid amount</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter paid amount" min="0"
						name="paid" id="paid" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Paid Date</label> <input type="Date" style="width:300px"
						class="form-control" placeholder="Enter Date "
						name="dated" id="dated" required>
				</div>
				<br>
				
				<div align="left">
					<label>Payment method</label>
					<select name="method" id="method" class="form-select" style="width:300px" required>
						<option>Online</option>
						<option>Cash</option>
						<option>Card</option>
					</select>
					
				</div>
				<br>
				<br>
				
				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info" style="background-color:#006478; color:white"/>
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning" style="background-color:#006478; color:white">
					
				</div>
			</form>
	
	</div>
	
	<div class="col-sm-8" style="margin-left:18%">
		
		<div class="panel-body" style="margin-top:5%">

				<table id="tbl-customer"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%" >

					<thead>
						<tr>
							<th>Payment ID</th>
							<th>Product ID</th>
							<th>Payment Type</th>
							<th>Payable amount</th>
							<th>Paid Amount</th>
							<th>Paid date</th>
							<th>Payment method</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from cus_payment";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("productid") %></td>
							<td><%=rs.getString("type") %></td>
							<td><%=rs.getString("payableamount") %></td>
							<td><%=rs.getString("paidamount") %></td>
							<td><%=rs.getString("date") %></td>
							<td><%=rs.getString("method") %></td>
							
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="updatePayment.jsp?id=<%=id%>">EDIT</button></a></td>
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="deletePayment.jsp?id=<%=id%>">DELETE</button></td>
						
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
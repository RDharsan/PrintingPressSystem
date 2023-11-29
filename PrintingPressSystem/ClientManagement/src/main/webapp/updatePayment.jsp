<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %> 
      
   
<%	
	if(request.getParameter("submit")!=null){
		
		String id=request.getParameter("id");
		String pid=request.getParameter("pid");
		int p_id=Integer.parseInt(pid);
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
		pst=con.prepareStatement("update cus_payment set productid=?,type=?,payableamount=?,paidamount=?,date=?,method=? where id=?");
		pst.setInt(1, p_id);
		pst.setString(2, type);
		pst.setInt(3,p_amount);
		pst.setInt(4,p_paid);
		pst.setString(5,dated);
		pst.setString(6,meth);
		pst.setString(7,id);

		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record updated Successfully!!");
			location.href = 'payment.jsp';
			
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
				<h2>Update Payment data</h2><br>
				
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from cus_payment where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{
					
				
					
				%>
				
				<div align=left >
					<label class="form-label">Product ID</label> <input type="text"
						class="form-control" placeholder="Enter product ID" style="width:300px" value="<%=rs.getString("productid")%>" readonly
						name="pid" id="pid" >
				</div><br>
				<div align="left">
				<select name="type" id="type" class="form-select" style="width:300px" value="<%=rs.getString("type")%>" required>
						<option>Advance Payment</option>
						<option>Half Payment</option>
						<option>Full Payment</option>
						<option>Random Payment</option>
					</select>
					
				</div><br>

				<div align="left">
					<label class="form-label">Payable Amount</label> <input type="Number" style="width:300px" value="<%=rs.getString("payableamount")%>"
						class="form-control" placeholder="Enter payable amount" min="0"
						name="amount" id="amount" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Paid amount</label> <input type="Number" style="width:300px" value="<%=rs.getString("paidamount")%>"
						class="form-control" placeholder="Enter paid amount" min="0"
						name="paid" id="paid" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Paid Date</label> <input type="Date" style="width:300px" value="<%=rs.getString("date")%>"
						class="form-control" placeholder="Enter Date "
						name="dated" id="dated" required>
				</div>
				<br>
				
				<div align="left">
				<select name="method" id="method" class="form-select" style="width:300px" value="<%=rs.getString("method")%>" required>
						<option>Online</option>
						<option>Cash</option>
						<option>Card</option>
					</select>
					
				</div>
				<br>
				<br>
				
				<%
				}
				%>
				
				<div align=center >
					<input type="submit" id="submit" value="Submit" name="submit"
						class="btn btn-info"  style="background-color:#006478; color:white"> <input type="reset" id="reset"
						value="Reset" name="reset" class="btn btn-info"  style="background-color:#006478; color:white">
				</div>
				<div align="right">
					<p>
						<a href="payment.jsp"><input type="button" id="submit" value="Back" name="submit" style="margin-top:-15%; margin-right: 350px";
						class="btn btn-info"></a>
					</p>

				</div>
			</form>
	</div>
 </div>

</body>
</html>
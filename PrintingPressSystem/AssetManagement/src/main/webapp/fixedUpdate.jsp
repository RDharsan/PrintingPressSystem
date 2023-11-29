<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>


<%	
	if(request.getParameter("submit")!=null){
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String brand=request.getParameter("brand");
		String date=request.getParameter("date");
		String shop=request.getParameter("shop");
		String cost=request.getParameter("cost");
		String amount=request.getParameter("amount");
		String type=request.getParameter("type");
		String count=request.getParameter("count");
		String warrenty=request.getParameter("warrenty");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("update fixed_assets set name=?, brand=?, purchaseddate=?, purchasedshop=?, cost=?, Payableamount=?, type=?, count=?, warrenty=? where id=?" );
		pst.setString(1,name);
		pst.setString(2,brand);
		pst.setString(3,date);
		pst.setString(4,shop);
		pst.setString(5,cost);
		pst.setString(6,amount);
		pst.setString(7,type);
		pst.setString(8,count);
		pst.setString(9,warrenty);
		pst.setString(10,id);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record updated Successfully");
			location.href = 'fixedassetsInsert.jsp';
		</Script>
	<%		
	}

%>
!DOCTYPE html>
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
 <li><a href="dashBoard.jsp" active>Dash Board</a></li>
  	<li><a href="fixedassetsInsert.jsp" active>Add Fixed Asset</a></li>
  	<li><a href="paperMaterial.jsp">Add paper material</a></li>
  	<li><a href="liquidInsert.jsp" active>Add liquid material</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>

	<div class="row">
		<br>
		<div class="col-sm-4" style="margin-left: 38%; margin-top: 10%">

			<form method="post" action="#">
				<h1>Edit Fixed Assets</h1>
				<%

				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");
				pst=con.prepareStatement("select * from fixed_assets where id=?");
				pst.setString(1, id);
				rs=pst.executeQuery();
				
				while(rs.next()){
					
				
				
				
				%>
				
				
				

				<div align=left>
					<label class="form-label">Name</label> <input type="text"
						class="form-control" placeholder="Enter Customer name" value="<%=rs.getString("name") %>"
						style="width: 300px" name="name" id="name" required>
				</div>
				<br>
				<div align="left">
					<label class="form-label">Brand</label> <input type="text"
						class="form-control" placeholder="Enter Customer address" value="<%=rs.getString("brand") %>"
						name="brand" id="brand" style="width: 300px" required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Purchased Date </label> <input
						type="Date" style="width: 300px" class="form-control" value="<%=rs.getString("purchaseddate") %>"
						placeholder="Enter Customer email" name="date" id="date" required>
				</div>
				<br>



				<div align="left">
					<label class="form-label">Purchased Shop</label> <input type="text" value="<%=rs.getString("purchasedshop") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer contact number" name="shop" id="shop" 
						required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Cost</label> <input type="text"  pattern="[0-9]{4,}.[0]{2}" title="Type valid cost!"  value="<%=rs.getString("cost") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer nic" name="cost" id="cost" required>
				</div>
				<br>
				<div align="left">
					<label class="form-label">Payable amount</label> <input type="text" pattern="[0-9]{4,}.[0]{2}"  title="type valid amount!"  value="<%=rs.getString("Payableamount") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer nic" name="amount" id="amount"
						required>
				</div>
				<br>
				<div align="left">
					
					<label class="form-label">Payment Type</label> <input type="text"  value="<%=rs.getString("type") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer nic" name="type" id="type" required>
				</div>
				<br>
				<div align="left">
					<label class="form-label">Count</label> <input type="text" pattern="[0-9]{2,}"value="<%=rs.getString("count") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer nic" name="count" id="count" required>
				</div>
				<br>
				<div align="left">
					<label class="form-label">Warrenty</label> <input type="text"  value="<%=rs.getString("warrenty") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer nic" name="warrenty" id="warrenty"
						required>
				</div>
				<br> <br>
				
				<%
				}
				%>

				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit"
						class="btn btn-info"
						style="background-color: #006478; color: white" /> <input
						type="reset" id="reset" value="Reset" name="reset"
						class="btn btn-info"
						style="background-color: #006478; color: white;">

				</div>
		
		<div align="left">
					<p>
						
						<a href="asset.jsp"><input type="button" id="submit" value="Back" name="submit" style="margin-top:-15%";
						class="btn btn-info"></a>
					</p>

				</div>
				<br>
			</form>
		</div>
	</div>
	</body>
	</html>
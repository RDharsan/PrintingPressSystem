<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>


<%	
	if(request.getParameter("submit")!=null){
		
		String re_fid=request.getParameter("re_fid");
		String name=request.getParameter("name");
		String description=request.getParameter("description");
		String status=request.getParameter("status");
		String return_date=request.getParameter("return_date");
		String repired_shop=request.getParameter("repired_shop");
		
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("update repair_fixedasset set name=?, description=?, status=?, return_date=?, repired_shop=? where re_fid=?" );
		pst.setString(1,name);
		pst.setString(2,description);
		pst.setString(3,status);
		pst.setString(4,return_date);
		pst.setString(5,repired_shop);
		pst.setString(6,re_fid);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record updated Successfully");
			location.href = 'repairedAssetsInsert.jsp';
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
				
				String re_fid=request.getParameter("re_fid");
				pst=con.prepareStatement("select * from repair_fixedasset where re_fid=?");
				pst.setString(1, re_fid);
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
					<label class="form-label">Description</label> <input type="text"
						class="form-control" placeholder="Enter Customer address" value="<%=rs.getString("description") %>"
						name="description" id="description" style="width: 300px" required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Status</label> <input
						type="text" style="width: 300px" class="form-control" value="<%=rs.getString("status") %>"
						placeholder="Enter Customer email" name="status" id="status" required>
				</div>
				<br>



				<div align="left">
					<label class="form-label">Return date</label> <input type="text" value="<%=rs.getString("return_date") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer contact number" name="return_date" id="return_date" 
						required>
				</div>

				
				<br>
				<div align="left">
					<label class="form-label">Repaired shop</label> <input type="text"  value="<%=rs.getString("repired_shop") %>"
						style="width: 300px" class="form-control"
						placeholder="Enter Customer nic" name="repired_shop" id="repired_shop"
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
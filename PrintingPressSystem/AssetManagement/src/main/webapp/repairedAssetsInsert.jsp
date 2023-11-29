<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		
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
		pst=con.prepareStatement("insert into repair_fixedasset(name,description,status,return_date,repired_shop)values(?,?,?,?,?)" );
		pst.setString(1,name);
		pst.setString(2,description);
		pst.setString(3,status);
		pst.setString(4,return_date);
		pst.setString(5,repired_shop);
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
 <li><a href="dashBoard.jsp" active>Dash Board</a></li>
  	<li><a href="fixedassetsInsert.jsp" active>Add Fixed Asset</a></li>
  	<li><a href="paperMaterial.jsp">Add paper material</a></li>
  	<li><a href="liquidInsert.jsp" active>Add liquid material</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>

<div class="row">
	
	<br><div class="col-sm-4" style="margin-left:38%; margin-top:10%" >
		
		<form  method="post" action="#">
		
				<h1>Repaired Fixed Assets </h1>
				
				<div align=left >
					<label class="form-label">Name</label> <input type="text"
						class="form-control" placeholder="Enter Customer name" style="width:300px"
						name="name" id="name" required>
				</div><br>
				<div align="left">
					<label class="form-label">Description</label> <input
						type="text" class="form-control"
						placeholder="Enter description " name="description" id="description" style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Status </label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter status"
						name="status" id="status" required>
				</div><br>
			
				
			
				<div align="left">
					<label class="form-label">Return date</label> <input type="date" style="width:300px"
						class="form-control"
						name="return_date" id="return_date" required>
				</div><br>
				
			
					<div align="left">
					<label class="form-label">Repaired shop</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter shop name"
						name="repired_shop" id="repired_shop" required>
				</div><br>
				
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
							<th>Description</th>
							<th>Status</th>
							<th>Return date</th>
							<th>Repaired shop</th>
							<th>edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from repair_fixedasset";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String re_fid = rs.getString("re_fid");
						%>

						<tr>
							<td><%=rs.getString("re_fid") %></td>
							<td><%=rs.getString("name") %></td>
							<td><%=rs.getString("description") %></td>
							<td><%=rs.getString("status") %></td>
							<td><%=rs.getString("return_date") %></td>
							<td><%=rs.getString("repired_shop") %></td>
							
						
						
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="repairedAssetsEdit.jsp?re_fid=<%=re_fid%>">EDIT</button></a></td>
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="repairedAssertsDelete.jsp?re_fid=<%=re_fid%>">DELETE</button></td>
						
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
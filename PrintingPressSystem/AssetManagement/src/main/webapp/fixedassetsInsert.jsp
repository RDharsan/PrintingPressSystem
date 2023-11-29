<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		
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
		pst=con.prepareStatement("insert into fixed_assets(name,brand,purchaseddate,purchasedshop,cost,Payableamount,type,count,warrenty)values(?,?,?,?,?,?,?,?,?)" );
		pst.setString(1,name);
		pst.setString(2,brand);
		pst.setString(3,date);
		pst.setString(4,shop);
		pst.setString(5,cost);
		pst.setString(6,amount);
		pst.setString(7,type);
		pst.setString(8,count);
		pst.setString(9,warrenty);
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
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
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
		
		<div align=left >
			
					 <a href="repairedAssetsInsert.jsp"><input type="button"
						class="btn btn-info" value="+ Repaired assets" style="background-color: #006478;color:white;margin-left:40%"
						name="reset" id="name" required></a>
				</div><br>
				<h2>Fixed Assets</h2>
		<div align=left >
			
					<label class="form-label">Name</label> <input type="text"
						class="form-control" placeholder="Enter name" style="width:300px"
						name="name" id="name" required>
				</div><br>
				<div align="left">
					<label class="form-label">Brand</label> <input
						type="text" class="form-control"
						placeholder="Ex: LG" name="brand" id="brand" style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Purchased Date </label> <input type="Date" style="width:300px"
						class="form-control" 
						name="date" id="date" required>
				</div><br>
			
				
			
				<div align="left">
					<label class="form-label">Purchased Shop</label> <input type="text"  style="width:300px"
						class="form-control" placeholder="Enter shop name"
						name="shop" id="shop" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Cost</label> <input type="text"  pattern="[0-9]{4,}.[0]{2}"  style="width:300px"
						class="form-control" placeholder="Ex: 10000.00"
						name="cost" id="cost" required >
				</div><br>
					<div align="left">
					<label class="form-label">Payable amount</label> <input pattern="[0-9]{4,}.[0]{2}"  type="text" style="width:300px"
						class="form-control" placeholder="Ex: 1000.00"
						name="amount" id="amount" required>
				</div><br>
					<div align="left">
					<label class="form-label">Type</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter type"
						name="type" id="type" required>
				</div><br>
					<div align="left">
					<label class="form-label">Count</label> <input type="text" pattern="[0-9]{2,}" style="width:300px"
						class="form-control" placeholder="Ex: 10"
						name="count" id="count" required>
				</div><br>
					<div align="left">
					<label class="form-label">Warrenty</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Ex: yes"
						name="warrenty" id="warrenty" required>
				</div><br>
				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info"  style="background-color:#006478; color:white" />
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-info" style="background-color:#006478; color:white;">
					
				</div>
				
				<br>
                     
                     
                   
				
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
							<th>Brand</th>
							<th>Purchased date</th>
							<th>Purchased shop</th>
							<th>cost</th>
							<th>payable amount</th>
							<th>type</th>
							<th>count</th>
							<th>warrenty</th>
							<th>edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from fixed_assets";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("name") %></td>
							<td><%=rs.getString("brand") %></td>
							<td><%=rs.getString("purchaseddate") %></td>
							<td><%=rs.getString("purchasedshop") %></td>
							<td><%=rs.getString("cost") %></td>
							<td><%=rs.getString("Payableamount") %></td>
							<td><%=rs.getString("type") %></td>
							<td><%=rs.getString("count") %></td>
							<td><%=rs.getString("warrenty") %></td>
						
						
							<td><button class="button btn"><a href="fixedUpdate.jsp?id=<%=id%>"><i class="fa fa-pencil" style="color:black"></i></button></a></td>
							<td><button class="button btn"><a href="fixedAssetsDelete.jsp?id=<%=id%>"><i class="fa fa-trash" style="color:black"></i></</button></td>
						
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
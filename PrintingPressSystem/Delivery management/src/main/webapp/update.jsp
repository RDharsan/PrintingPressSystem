<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%	
	if(request.getParameter("submit")!=null){
		
		
		String id=request.getParameter("id");
		String duration = request.getParameter("duration");
                String distance = request.getParameter("distance");
                String price = request.getParameter("price");
                String discount = request.getParameter("discount");
                String total = request.getParameter("total");
                String collected = request.getParameter("collected");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("update pricing set duration = ?,distance =?,price= ?,discount=?,total= ?,collected= ? where id=?");
		 pst.setString(1, duration);
                 pst.setString(2, distance);
                 pst.setString(3, price);
                 pst.setString(4, discount);
                 pst.setString(5, total);
                 pst.setString(6,collected);
		 pst.setString(7, id);
		 pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record Updateddd");
			location.href = 'Price.jsp';
			
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
   <li><a href="Driver.jsp"><i class="fas fa-person-booth"></i>Driver</a></li>
    <li><a href="Driverinsert.jsp"><i class="fas fa-male"></i>Add Driver</a></li>
    <li><a href="Price.jsp"><i class="fas fa-money-bill-alt"></i>Pricing</a></li>
    <li><a href="delivery.jsp"><i class="fas fa-truck"></i> Delivery</a></li>
    <li><a href="Deliveryinsert.jsp"><i class="fas fa-undo-alt"></i>Add Delivery</a></li>
      <li><a href="../../LoginAndHome/Home.jsp"><i class="fas fa-home"></i>Home</a></li>
  </ul>
 </div>
 </div>
 
	
	
	<div class="row">
		<div class="col-sm-4"  style="margin-left:40%; margin-top:10%">
			<form method="post" action="#">
				<h1>Pricing Rule</h1><br>
				<h2>Update Pricing data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from pricing where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{
					
				
					
				%>

				<div align="left">
					<label class="form-label">Duration</label> <input type="text"
						class="form-control" placeholder="Enter Duration"
						value="<%=rs.getString("duration")%>" name="duration" id="duration" style="width:300px"
						required> 
				</div>
				<br>
				<div align="left">
					<label class="form-label">Distance</label> <input
						type="text" class="form-control"
						placeholder="Enter Distance" name="distance" id="distance" style="width:300px"
						value="<%=rs.getString("distance")%>" required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Price</label> <input type="text" style="width:300px"
						value="<%=rs.getString("price")%>" class="form-control"
						placeholder="Enter Price" name="price" id="price"
						required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Discount</label> <input
						type="text" class="form-control"
						placeholder="Enter Discount" name="discount" style="width:300px"
						value="<%=rs.getString("discount")%>" id="discount" required>
				</div>
				<br>

				<div align="left">
					<label class="form-label">Total</label> <input type="text" style="width:300px"
						value="<%=rs.getString("total")%>" class="form-control"
						placeholder="Enter Total" name="total" id="total" required>
				</div>
				<br>
                                

                                <div align="left">
					<label class="form-label">Collected</label> <input type="text" style="width:300px"
						value="<%=rs.getString("collected")%>" class="form-control"
						placeholder="Enter Collected" name="collected" id="collected" required>
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
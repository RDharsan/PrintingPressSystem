<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		//String id=request.getParameter("id");
		String duration=request.getParameter("duration");
		String distance=request.getParameter("distance");
		String price=request.getParameter("price");
		String discount=request.getParameter("discount");
		String total=request.getParameter("total");
		String collected = request.getParameter("collected");

		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("insert into pricing(duration,distance,price,discount,total,collected )values (?,?,?,?,?,?)");
		pst.setString(1, duration);
		pst.setString(2, distance);	
		pst.setString(3, price);
		pst.setString(4, discount);
		pst.setString(5, total);
        pst.setString(6, collected);
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
	
	<br><div class="col-sm-4" style="margin-left:40%; margin-top:10%" >
		
		<form  method="post" action="#">
				<h1>Delivery Pricing</h1><br>
				<h2>Add Pricing </h2>
				
				<div align=left >
					<label class="form-label">Duration</label> <input type="Number" min="0"
						class="form-control" placeholder="Enter Duration" style="width:300px"
						name="duration" id="duration" required>
				</div><br>
				<div align="left">
					<label class="form-label">Distance</label> <input
						type="Number" min="0" class="form-control"
						placeholder="Enter Distance" name="distance" id="distance" style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Price</label> <input type="Number" min="0" style="width:300px"
						class="form-control" placeholder="Enter Price "
						name="price" id="price" required>
				</div><br>
			
				
			
				<div align="left">
					<label class="form-label">Discount</label> <input type="Number" min="0" style="width:300px"
						class="form-control" placeholder="Enter Discount"
						name="discount" id="discount" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Total</label> <input type="Number" min="0" style="width:300px"
						class="form-control" placeholder="Enter Total"
						name="total" id="total" required>
				</div>
				
				
				<br>
                                <div align="left">
					<label class="form-label">Collected</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Collected"
						name="collected" id="collected" required>
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
							
							 <th>Duration</th>
                                                         <th>Distance</th>
                                                         <th>Price</th>
                                                         <th>Discount</th>
                                                         <th>Total</th>
                                                         <th>Collected</th>
                                                         <th>Edit</th>
                                                         <th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from pricing";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
						
							 							<td><%=rs.getString("duration") %></td>
                                                         <td><%=rs.getString("distance") %></td>
                                                         <td><%=rs.getString("price") %></td>
                                                         <td><%=rs.getString("discount") %></td>
                                                         <td><%=rs.getString("total") %></td>
                                                        <td><%=rs.getString("collected") %></td>
							
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="update.jsp?id=<%=id%>">EDIT</button></a></td>
							<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="delete.jsp?id=<%=id%>">DELETE</button></td>
						
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
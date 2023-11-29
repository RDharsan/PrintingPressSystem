<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="driv.css" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/ecf73c482b.js" crossorigin="anonymous"></script>

<style>
 
 
  
  .title{
			text-align: center;
			font-size: 50px;
			font-family: Verdana;
			background-color: #006478;
			height :130px;
			color: white;
			position: absolute;
			top: 0px;
			left: 150px;
			right:0px;
			
		}
		.footer .footer-bottom{
			background: #006478;
			font-family: Verdana;
			color: white;
			height: 25px;
			width: 100%;
			text-align :center;
			position: absolute;
			bottom: 0px;
			left: 0px;

		}
		
		
		
</style>



</head>
<body>

<div id="header"><img src="veena.jpg" alt="" class="img"></div>
 <div class="wrapper">
 <div class="sidebar">
 
  <ul>
    <li><a href="Driver.jsp"><i class="fas fa-person-booth"></i>Driver</a></li>
    <li><a href="Driverinsert.jsp"><i class="fas fa-male"></i>Add Driver</a></li>
    <li><a href="Price.jsp"><i class="fas fa-money-bill-alt"></i>Pricing</a></li>
    <li><a href="delivery.jsp"><i class="fas fa-truck"></i> Delivery</a></li>
    <li><a href="Deliveryinsert.jsp"><i class="fas fa-undo-alt"></i>Add Delivery</a></li>
      <li><a href="../../LoginAndHome/Home.jsp"><i class="fas fa-home"></i>Home</a></li>
  </ul>
 </div>
 <div class="main_content">
   <div class="header"> View Driver Details</div>
    
 </div>
 </div>
 

<div class="container">
  <form action="log1" method="post">
  <h2>View  Driver Form</h2>
   <div id="name">
   
    <label class="form-label">Driver Name</label><br><br>
    <select name="drivername" id="drivername" class="form-select" onchange="this.form.submit();" style="width:300px;height:30px">
				 			<option value="0">Select Driver</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct drivername from driver");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("drivername") %>">
				 						 <%=rs.getString("drivername") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
   <br><br>
    
    <label class="form-label">Driver NIC</label><br><br>
     <select name="nic" id="nic" class="form-select" onchange="this.form.submit();" style="width:300px;height:30px">
				 			<option value="0">Select NIC</option>
				 			
				 			<%
				 			try {
				 				Connection con2;
				 				Class.forName("com.mysql.jdbc.Driver");
								con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm2 = con2.createStatement();
				 				ResultSet rs2 = stm2.executeQuery("select distinct nic, drivername from driver");
				 				while(rs2.next()){
				 					%>
				 					<option value="<%=rs2.getString("nic") %>">
				 						 <%=rs2.getString("nic") %> | <%=rs2.getString("drivername") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
    <br><br>
    
    <input class="button" style="margin-left:95px" type="submit" name="submit" value="Search Driver">
    
    </div>
  </div>
  </form>
  
  </div>
<div class="title"> NEW VEENA PRINTERS </div>
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
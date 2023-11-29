<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="driv.css" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/ecf73c482b.js" crossorigin="anonymous"></script>

 <style >
 .title{
			text-align: center;
			font-size: 50px;
			font-family: Verdana;
			background-color: #006478;
			height :140px;
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
   <div class="header"> Update Driver</div>
    
 </div>
 </div>



<%
String dr_id=request.getParameter("dr_id");
String drivername=request.getParameter("drivername");
String nic=request.getParameter("nic");
String team=request.getParameter("team");
String vehicle=request.getParameter("vehicle");
String phone=request.getParameter("phone");

%>
  <form action="update1" method="post">
        
        <table class="content-table">
        <thead>
        <tr>
          <th>Details</th>
          <th>Data</th>
        </tr>
        </thead>
        
        <tbody>
        <tr>
          <td>ID</td>
          <td><input class="patname" type="text" name="dr_id" value="<%=dr_id %>" readonly><br></td>
        </tr>
        
        <tr>
         <td>Driver Name</td>
         <td><input class="patname" type="text" name="drivername" value="<%=drivername %>"><br></td>
        </tr>
        
         <tr>
		  <td>NIC</td>
		  <td><input class="patname" type="text" name="nic" value="<%=nic %>"><br></td>
		
		</tr>
		
		 <tr>
		  <td>Team</td> 
		  <td><input class="patname" type="text" name="team" value="<%=team %>"><br></td>
		
		 </tr>
		 
		  <tr>
		  <td>Vehicle</td>
		  <td><input class="patname" type="text" name="vehicle" value="<%=vehicle %>"><br></td>
		
		 </tr>
		 
		  <tr>
		  <td>Phone</td> 
		  <td><input class="patname" type="text" name="phone" value="<%=phone %>"><br></td>
		
		 </tr>
		 </tbody>
 </table>
 <br>
       <input class="btn" type="submit" name="submit" value="Update Driver"><br>

</form>

	<div class="title"> NEW VEENA PRINTERS </div>
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
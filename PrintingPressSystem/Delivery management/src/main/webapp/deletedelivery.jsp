<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="decoration.css" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/ecf73c482b.js" crossorigin="anonymous"></script>

<style>
		.title{
			text-align: center;
			font-size: 50px;
			font-family: Verdana;
			background-color: #006478;
			height :95px;
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

 



<body>
  <%
     String id=request.getParameter("id");
     String cus_id=request.getParameter("cus_id");
     String customername=request.getParameter("customername");
     String deliverytype=request.getParameter("deliverytype");
     String deliverydate=request.getParameter("deliverydate");
     String orderid=request.getParameter("orderid");
     String shortname=request.getParameter("shortname");
     String location=request.getParameter("location");
     String postalcode=request.getParameter("postalcode");

%>

<div id="header"><img src="veena.jpg" alt="" class="img1"></div>
 <div class="wrapper1">
 <div class="sidebar1">
  
  <ul>
   <li><a href="Driver.jsp"><i class="fas fa-person-booth"></i>Driver</a></li>
    <li><a href="Driverinsert.jsp"><i class="fas fa-male"></i>Add Driver</a></li>
    <li><a href="Price.jsp"><i class="fas fa-money-bill-alt"></i>Pricing</a></li>
    <li><a href="delivery.jsp"><i class="fas fa-truck"></i> Delivery</a></li>
    <li><a href="Deliveryinsert.jsp"><i class="fas fa-undo-alt"></i>Add Delivery</a></li>
      <li><a href="../../LoginAndHome/Home.jsp"><i class="fas fa-home"></i>Home</a></li>
  </ul>
 </div>
 <div class="main_content1">
   
    
 </div>
 </div>
 

     <form action="delete" method="post">
        
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
          <td><input class="patname" type="text" name="id" value="<%=id %>" readonly></td>
        </tr>
        
       
        
        <tr>
          <td>CusID</td>
          <td><input class="patname" type="text" name="cus_id" value="<%=cus_id %>" readonly></td>
        </tr>
        
        <tr>
         <td>Customer Name</td>
         <td><input class="patname" type="text" name="customername" value="<%=customername %>" readonly></td>
        </tr>
        
         <tr>
		  <td>Delivery Type</td>
		  <td><input class="patname" type="text" name="deliverytype" value="<%=deliverytype %>" readonly></td>
		
		</tr>
		
		 <tr>
		  <td>Delivery Date</td> 
		  <td><input class="patname" type="text" name="deliverydate" value="<%=deliverydate %>" readonly></td>
		
		 </tr>
		 
		  <tr>
		  <td> OrderId </td>
		  <td><input class="patname"  type="text" name="orderid" value="<%=orderid %>" readonly></td>
		
		 </tr>
		 
		  <tr>
		  <td>Short name</td> 
		  <td><input class="patname" type="text" name="shortname" value="<%=shortname %>" readonly></td>
		
		 </tr>
		 
		  <tr>
		  <td>Location</td>
		  <td><input class="patname" type="text" name="location" value="<%=location %>" readonly></td>
		
		 </tr>
		 
		  <tr>
		<td>Postal code</td>
		<td><input class="patname" type="text" name="postalcode" value="<%=postalcode %>" readonly></td>
		
		 </tr>
</tbody>
 </table>
 <br>
       <input class="btn"  type="submit" name="submit" value="Delete Delivery"><br>

</form>
 
 <div class="title"> NEW VEENA PRINTERS </div>
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>


</body>
</html>
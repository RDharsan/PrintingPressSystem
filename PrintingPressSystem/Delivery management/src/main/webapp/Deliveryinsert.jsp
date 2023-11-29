<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="insert.css" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/ecf73c482b.js" crossorigin="anonymous"></script>
<style>
.title{
			text-align: center;
			font-size: 50px;
			font-family: Verdana;
			background-color: #006478;
			height :100px;
			color: white;
			position: absolute;
			top: 0px;
			left: 130px;
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
		
.h2{
    text-align:center;
    margin-left:80px;
	padding:0 100px 10px 0;
	border-bottom:1px solid silver;
	color:red;
	
}



</style>	

</head>
<body>


 <div class="wrapper1">
 <div class="sidebar1">
<div class="img1-div"><img src="veena.jpg" alt="" class="img1"></div>
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
 

<div class="container">


    <form action="insert" method="post">
    <h2 class="h2">Add Delivery</h2>
    <div class="user-details">
    
    <div class="input-box">
     <span class="details">Customer Id</span><br>
    <select name="cus_id" id="cus_id" class="form-select" onchange="this.form.submit();" style="width:300px;height:30px">
				 			<option value="0">Select ID</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id,name from customers");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("id") %>">
				 						<%=rs.getString("id") %>, <%=rs.getString("name") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
   
   
    </div>
  
   <div class="input-box">
    <span class="details">Customer Name</span><br>
    <select name="cname" id="cname" class="form-select" onchange="this.form.submit();" style="width:300px;height:30px">
				 			<option value="0">Select Customer</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id,name from customers");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("name") %>">
				 						 <%=rs.getString("name") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
   
   
   </div>


    <div class="input-box">
    <span class="details">Delivery Type</span>
    <input type="text" name="deliverytype"  placeholder="Enter delivert type" required><br>
    </div>
    
 
    <div class="input-box">
   <span class="details"> Delivery Date</span>
    <input type="Date" name="deliverydate" placeholder="Enter delivery date" required ><br>
    </div>
    
    
   <div class="input-box">
    <span class="details">Order No</span>
    <input type="Number" name="orderid"  placeholder="Enter OrderId"  min="0" required ><br>
    </div>
    
    
   <div class="input-box">
    <span class="details">Short Name</span>
    <input type="text" name="shortname"  placeholder="1234 Main St" required><br>
    </div>
    
    

    <div class="input-box">
    <span class="details">Location</span>
    <input type="text" name="location" placeholder="Apartment, studio, or floor" required ><br>
   </div>



   <div class="input-box">
   <span class="details"> Postal Code</span>
    <input type="text" name="postalcode"  pattern="[0-9]{2}" title="please enter only numbers!!"><br>
      </div>
      
      
  
   <input class="button" type="submit" name="submit" value="Add Delivery">
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
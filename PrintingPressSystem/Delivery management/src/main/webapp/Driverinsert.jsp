<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="driverin.css" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/ecf73c482b.js" crossorigin="anonymous"></script>


 
  <style>

  
  .button
  {
    background-color:#3BAF9F;
    display:block;
    margin:20px 0px 0px 20px;
    text-align:center;
    border-radius:12px;
    border:2px solid #366473;
    padding: 14px 110px;
    outline:none;
    color:white;
    cursor:pointer;
    transition:0.25px;
    font-size:20px;
  }
  
  .container{
	position:absolute;
	margin-right:10%;
	height:400px;
	width:40%;
	background:#fff;
	padding:25px 30px;
	border-radius:5px;
	margin-top:50px;

}
  
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
		
.wrapper1 .sidebar1 h2{
	color:white;
	text-transform:uppercase;
	text-align:center;
	margin-bottom:30px;
}

.wrapper1 .main_content1{
	width:100%;
	margin-left:150px;
}

.wrapper1 .main_content1 .header{
	padding:20px;
	background:#fff;
	color:#717171;
	border-bottom:1px solid #e0e4e8;
	font-weight:bold;
}

.h2{
    text-align:center;
    margin-left:150px;
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
   <form action="insert1" method="post">
   <div class="user-details">
   <h2 class="h2">Add Driver</h2>
   
         <div class="input-box">
		 <span class="details">Driver Name</span>
		 <input type="text" name="drivername" placeholder="Enter Drivername" pattern="[a-zA-Z]{8,25}" title="Name length should type between 8 to 25 " required><br>
		 </div>
		 
		 <div class="input-box">
		<span class="details">NIC</span>
		 <input type="text" name="nic" placeholder="Enter NIC"  pattern='^(?:19|20)?\d{2}(?:[0-35-8]\d\d(?<!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[vVxX0-9])$' title='Please enter valid NIC ' required><br>
		  </div>
		 
		 <div class="input-box">
		<span class="details">Team</span>
		<input  type="text" name="team" placeholder="Enter Team" required><br>
		 </div>
		
		<div class="input-box">
		<span class="details">Vehicle</span>
		<input  type="text" name="vehicle" placeholder="Enter Vehicle" required><br>
		 </div>
		
		<div class="input-box">
		<span class="details">Phone</span>
		<input  type="text" name="phone" placeholder="Enter Phoneno" pattern='[0-9]{10}' title='Please enter 10 digits!!' required><br>
		 </div>
		
		
		
		<input class="button" type="submit" name="submit" value="Create Driver">
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<head>
<style>
.wrapper1{
	display:flex;
	position:relative;	
}

.wrapper1 .sidebar1{
	position:fixed;
	width:130px;
	height:300%;
	background:#006478;
	display:block;
	left: 0px;
	top : 0px;
	z-index: 2;
	
}
.wrapper1 .sidebar1 ul{
	padding: 0;
	margin: 0;
}
.wrapper1 .sidebar1 ul li{
	padding-bottom:20px;
	border-bottom:1px solid rgba(0,0,0,0.05);
	border-top:100px;
	list-style:none;
	padding-top : 40px;	
	padding-left:12px;
}

.wrapper1 .sidebar1 ul li a{
	text-decoration:none;
	font-family: Verdana;
	color: white;
}
.wrapper1 .sidebar1 ul li:hover{
	background: #519EAD;		
}

.img1{
	width:130px;
	height:100%;
}

.img1-div{
	width:130px;
	height:120px;
}

.title{
	text-align: center;
	font-size: 50px;
	font-family: Verdana;
	background-color: #006478;
	height:120px;
	color: white;
	position: absolute;
	top: 0px;
	left: 0px;
	right:0px;
	position: fixed;
}

.title-text {
	font-family: Verdana;
	color: white;
	padding-top: 20px;
	margin: 0;
	
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
	position: fixed;

}

</style>
</head>
 <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="#">Add Customer</a></li>
  	<li><a href="">Product details</a></li>
  	<li><a href="expenses.jsp">Payment</a></li>
    <li><a href="#">HOME</a></li>
  </ul>
 </div>

    
 </div>
 </div>
 <div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</html>
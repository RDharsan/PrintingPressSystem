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
	background: #00aacc;		
}

.img1{
	width:130px;
	height:100px;
}

.img1-div{
	width:130px;
	height:100px;
}

.title{
	text-align: center;
	font-size: 50px;
	font-family: Verdana;
	background-color: #006478;
	height:100px;
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
	font-size: 35px;
	
}

.footer .footer-bottom{
	background: #006478;
	font-size: 12px;
	font-family: Verdana;
	color: white;
	height: 20px;
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
  <div class="img1-div"><img src="veena.jpg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="dashboard.jsp">DASHBOARD</a></li>
  	<li><a href="index.jsp">OTHER<br/>EXPENSES</a></li>
  	<li><a href="income.jsp">INCOME</a></li>
  	<li><a href="expense.jsp">EXPENSE</a></li>
    <li><a href="report.jsp">GENERATE<br/>REPORT</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
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
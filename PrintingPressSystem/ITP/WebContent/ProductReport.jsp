<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" href="jquery.datetimepicker.min">
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">

<script src="jquery"></script>
<script src="jquery.datetimepicker.full"></script>


<meta charset="ISO-8859-1">
<title>Return Product</title>
</head>
<body>

<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="img/img.jpeg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="ReturnProductCreate.jsp">Add Return Product</a></li>
  	<li><a href="ReturnProductView.jsp">Return Product details</a></li>
  	<li><a href="ProductReport.jsp">Return Product Report</a></li>
  <li><a href="Feedback.jsp">Feedback details</a></li>
   <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li><br>
  </ul><br>
 </div>

    
 </div>
<br>
<br>
<h2>Return Product Report</h2>
        

<div class="templatemo-content-container">         
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10"></h2>

          

<div class="container" >
									<form class="user-details" action="ProductReportView.jsp">

										<div class="row">
    									<div class="col-35">
      									<label for="givennames" class="form__label">Report ID::</label>
   										 </div>
   										 <div class="col-65">
   										   <input type="text"  name="rID">
   										 </div>
  										</div>
  										
  										<div class="row">
    									<div class="col-35">
      									<label for="givennames" class="form__label"> Report Name::</label>
   										 </div>
   										 <div class="col-65">
   										   <input type="text"  name="rName">
   										 </div>
  										</div>
  																	
									
										
										<div class="row">
												<input type="submit" value="Download">
										</div>
									  </form> 
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
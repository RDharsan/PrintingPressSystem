<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <div class="header"> Driver Details</div>
    
 </div>
 </div>


<form action="#" method="post">
 <table class="content-table">
 <c:forEach var="driver" items="${driverDetails}">
   
   <c:set var="dr_id" value="${driver.dr_id}"/>
   <c:set var="drivername" value="${driver.drivername}"/>
   <c:set var="nic" value="${driver.nic}"/>
   <c:set var="team" value="${driver.team}"/>
   <c:set var="vehicle" value="${driver.vehicle}"/>
   <c:set var="phone" value="${driver.phone}"/>
  
   
     
        <thead>
        <tr>
          <th>Details</th>
          <th>Data</th>
        </tr>
        </thead>
        <tbody>
   
   <tr>
      <td>ID</td>
      <td> ${driver.dr_id}</td> 
   </tr>
   
    <tr>
     <td> Name</td>
     <td>${driver.drivername} </td>
   </tr>
   
   <tr>
     <td>NIC</td>
     <td>${driver.nic}</td>
   </tr>
   
     <tr>
       <td>Team</td>
       <td> ${driver.team} </td>
    </tr>
    
      <tr> 
         <td>Vehicle</td>
         <td>${driver.vehicle} </td>
      </tr>
     
      <tr>  
         <td>Phone</td>
         <td> ${driver.phone}</td>
      </tr> 
      
    </tbody>
  
 </c:forEach>
</form>

</table>

<c:url value="updatedriver.jsp" var="drivupdate">
  
  <c:param name="dr_id" value="${dr_id}"/>
   <c:param name="drivername" value="${drivername}"/>
   <c:param name="nic" value="${nic}"/>
   <c:param name="team" value="${team}"/>
   <c:param name="vehicle" value="${vehicle}"/>
   <c:param name="phone" value="${phone}"/>

</c:url >

 <a href="${drivupdate}">
 <input class="btn" type="button" name="update" value="Update Driver">
 </a>
 <br>
 <br>
 
 
 <c:url value="deletedriver.jsp" var="drivdelete">
  <c:param name="dr_id" value="${dr_id}"/>
   <c:param name="drivername" value="${drivername}"/>
   <c:param name="nic" value="${nic}"/>
   <c:param name="team" value="${team}"/>
   <c:param name="vehicle" value="${vehicle}"/>
   <c:param name="phone" value="${phone}"/>
  
  
 </c:url>
 <a href="${drivdelete}">
 <input class="btn"  type="button" name="delete" value="Delete Driver">
 </a>
 
 <div class="title"> NEW VEENA PRINTERS </div>
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
 
</body>
</html>
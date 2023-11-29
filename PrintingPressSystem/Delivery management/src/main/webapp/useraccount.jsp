<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
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


<form action="#" method="post">
<table class="content-table">
<c:forEach var="delivery" items="${deliveryDetails}">
   
   <c:set var="id" value="${delivery.id}"/>
   <c:set var="cus_id" value="${delivery.cus_id}"/>
   <c:set var="customername" value="${delivery.customername}"/>
   <c:set var="deliverytype" value="${delivery.deliverytype}"/>
   <c:set var="deliverydate" value="${delivery.deliverydate}"/>
   <c:set var="orderid" value="${delivery.orderid}"/>
   <c:set var="shortname" value="${delivery.shortname}"/>
   <c:set var="location" value="${delivery.location}"/>
   <c:set var="postalcode" value="${delivery.postalcode}"/>
   
  
        
        <thead>
        <tr>
          <th>Details</th>
          <th>Data</th>
        </tr>
        </thead>
        <tbody>
   
  <tr>
      <td> ID</td>
      <td> ${delivery.id}</td> 
   </tr>
   
   <tr>
      <td>CusID</td>
      <td> ${delivery.cus_id}</td> 
   </tr>
   
   
    <tr>
     <td>Customer Name</td>
     <td>${delivery.customername} </td>
   </tr>
   
   <tr>
     <td>Delivery Type</td>
     <td> ${delivery.deliverytype}</td>
   </tr>
   
     <tr>
       <td>Delivery Date</td>
       <td> ${delivery.deliverydate} </td>
    </tr>
    
      <tr> 
         <td>Order Id</td>
         <td>${delivery.orderid} </td>
      </tr>
     
      <tr>  
         <td>Short name</td>
         <td> ${delivery.shortname}</td>
      </tr> 
      
       <tr>
         <td>Location</td>
         <td>  ${delivery.location}</td>
       </tr>
       
       <tr>
       <td>Postal Code</td>
       <td>  ${delivery.postalcode}</td>
       </tr>
  
 </c:forEach>

</form>

</table>

<c:url value="updatedelivery.jsp" var="delupdate">

  <c:param name="id" value="${id}" />
  <c:param name="cus_id" value="${cus_id}" />
  <c:param name="customername" value="${customername}" />
  <c:param name="deliverytype" value="${deliverytype}" />
  <c:param name="deliverydate" value="${deliverydate}" />
  <c:param name="orderid" value="${orderid}" />
  <c:param name="shortname" value="${shortname}" />
  <c:param name="location" value="${location}" />
  <c:param name="postalcode" value="${postalcode}" />
    

</c:url>

<a href="${delupdate}">
<input class="btn" type="button" name="update" value="Update My Data">
</a>


<c:url value="deletedelivery.jsp" var="deldelete">
  <c:param name="id" value="${id}" />
  <c:param name="cus_id" value="${cus_id}" />
  <c:param name="customername" value="${customername}" />
  <c:param name="deliverytype" value="${deliverytype}" />
  <c:param name="deliverydate" value="${deliverydate}" />
  <c:param name="orderid" value="${orderid}" />
  <c:param name="shortname" value="${shortname}" />
  <c:param name="location" value="${location}" />
  <c:param name="postalcode" value="${postalcode}" />
    
 </c:url>
 <a href="${deldelete}">
 <input class="bttn"  type="button" name="delete" value="Delete Delivery">
 </a>

<div class="title"> NEW VEENA PRINTERS </div>
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>




</body>
</html>
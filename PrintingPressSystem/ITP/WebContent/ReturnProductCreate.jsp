<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">
<script>

function validateForm() {
  
  var b = document.forms["AddReturn"]["pNo"].value;
  if (b == "") {
	    alert("Product No cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["AddReturn"]["pType"].value;
  if (c == "") {
	    alert("Product type cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddReturn"]["pQty"].value;
  if (d == "") {
	    alert("QTY cannot be Empty!!");
	    return false;
	  }
  
  var x = document.forms["AddReturn"]["pDate"].value;
  if (x == "") {
	    alert("Date cannot be Empty!!");
	    return false;
	  }
  
  var w = document.forms["AddReturn"]["pReason"].value;
  if (w == "") {
	    alert("Reason for Return cannot be Empty!!");
	    return false;
	  }
  
  var z = document.forms["AddReturn"]["pReturn"].value;
  if (z == "") {
	    alert("Number of returning product cannot be Empty!!");
	    return false;
	  }


}



</script>
//Header and Navigation

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
  </ul>
 </div>

    
 </div>
<br>
<br>
<h2>Return Product</h2>



<div class="container">
  <form action="ReturnProductServlet" method="post" name="AddReturn" onsubmit="return validateForm()">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product No</label>
    </div>
    <div class="col-65">
      <input type="text" id="pNo" name="pNo" placeholder="Product order number.." >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product Type</label>
    </div>
    <div class="col-65">
      <input type="text" id="pType" name="pType" placeholder="Product type.." >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product QTY</label>
    </div>
    <div class="col-65">
      <input type="number" id="pQty" name="pQty" placeholder="Orderd product qty.." >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Received Date</label>
    </div>
    <div class="col-65">
      <input type="date" id="pDate" name="pDate" placeholder="Product received date.." >
    </div>
  </div>

  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Reason for Return</label>
    </div>
    <div class="col-65">
      <select id="pReason" name="pReason">
        <option value="Product damaged">Product damaged</option>
        <option value="No ordered quantity">No ordered quantity</option>
        <option value="Receive different product">Receive different product</option>
        <option value="Other">Other</option>
      </select>
    </div>
  </div>
  <br>
  
    <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">No of Returning Product</label>
    </div>
    <div class="col-65">
      <input type="number" id="pReturn" name="pReturn" placeholder="Number of returning product.." >
    </div>
  </div>
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
</div>

//footer
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
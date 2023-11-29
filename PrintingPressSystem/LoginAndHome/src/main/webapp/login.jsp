<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">


<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" text="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

</head>
<body>
 <div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 

  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
 </div>

    
 </div>

	
	<div class="container">
		<div class="row">
				<div align="center" style="top:50%">
					<form action="log" method="post">
						<div class="form-group">
							<h1>Login</h1><br><br>
						</div>
						
						<div class="form-group">
							<label><h3>UserName</h3></label>
							<input type="text" id="uname" name="uname" class="form-control" style="width:20%">
						</div><br>
						
						<div class="form-group">
							<label><h3>Password</h3></label>
							<input type="password" id="pass" name="pass" class="form-control" style="width:20%">
						</div>
						<br>
						<div class="form-group"><br>
	
							<input type="submit" class="btn btn-success" id="submit" name="submit" value="Login"></input>
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
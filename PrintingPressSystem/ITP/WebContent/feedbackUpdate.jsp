<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%	
if(request.getParameter("submit")!=null){
	
	String id=request.getParameter("id");
	String cid=request.getParameter("cid");
	int c_id=Integer.parseInt(cid);
	String feedback=request.getParameter("feedback");
	String date=request.getParameter("date");
	String status=request.getParameter("status");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
	pst=con.prepareStatement("update feedbacks set cus_id=?,feedbacks=?,date=?,status=? where id=?");
	pst.setInt(1, c_id);
	pst.setString(2,feedback);
	pst.setString(3,date);
	pst.setString(4,status);

	pst.setString(5, id);
	pst.executeUpdate();
	
		%>
		
		<script>
			alert("Record Updateddd");
			location.href = 'Feedback.jsp';
			
		</Script>
	<%		
	}

%>






<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" text="text/css">
</head>
<body>
<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
 <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="ReturnProductCreate.jsp">Add Return Product</a></li>
  	<li><a href="ReturnProductView.jsp">Return Product details</a></li>
  	<li><a href="ProductReport.jsp">Return Product Report</a></li>
  <li><a href="Feedback.jsp">Feedback details</a></li>
   <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li><br>
  </ul>
 </div>
 </div>
 
	
	
	<div class="row">
		<div class="col-sm-4"  style="margin-left:40%; margin-top:10%">
			<form method="post" action="#">
				<h1>Feedback handling</h1><br>
				<h2>Update feedback data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from feedbacks where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{		
				%>

				
				<div align=left >
					<label class="form-label">Feedback ID</label> <input type="text" readonly="readonly"
						class="form-control" placeholder="Enter Customer ID" style="width:300px" value="<%=rs.getString("id")%>"
						name="id" id="dd" >
				</div><br>	
				<div align=left >
					<label class="form-label">Customer ID</label> <input type="text" readonly="readonly"
						class="form-control" placeholder="Enter Customer ID" style="width:300px" value="<%=rs.getString("cus_id")%>"
						name="cid" id="cid" >
				</div><br>
				<div align="left">
					<label class="form-label">Feedbacks</label><br>
					<textarea rows="5" cols="60" name="feedback" value="<%=rs.getString("feedbacks")%>"></textarea>
				</div><br>
				
				<div align="left">
					<label class="form-label">Date</label> <br>
					<input type="Date" style="width:300px"
						class="form-control" placeholder="Enter deadline date" value="<%=rs.getString("date")%>"
						name="date" id="ddate" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Status</label><br>
					<select class="form-select" name="status"  required>
						<option>Feedback noted</option>
						<option>Will be noted</option>
					</select>
					
				</div>
				<br>


				<%
				}
				%>


				<div align=center >
					<input type="submit" id="submit" value="Submit" name="submit"
						class="btn btn-info"  style="background-color:#006478; color:white"> <input type="reset" id="reset"
						value="Reset" name="reset" class="btn btn-info"  style="background-color:#006478; color:white">

				</div>

				<div align="right">
					<p>
						<a href="product.jsp"><input type="button" id="submit" value="Back" name="submit" style="margin-top:-15%; margin-right: 350px";
						class="btn btn-info"></a>
					</p>

				</div>
			</form>

		</div>
	</div>
</body>
</html>
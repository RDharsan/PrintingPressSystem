<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%
if(request.getParameter("submit")!=null){
		
		String id=request.getParameter("id");
		String pid=request.getParameter("pid");
		int p_id=Integer.parseInt(pid);
		String date=request.getParameter("date");
		String sts=request.getParameter("sts");
	
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("update quotation set pro_id=?,date=?,status=? where id=?");
		pst.setInt(1, p_id);
		pst.setString(2, date);
		pst.setString(3, sts);
		pst.setString(4, id);
	
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record updated Successfully!!");
			location.href = 'quotation.jsp';
			
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
 <li><a href="quotation.jsp">Quotation</a></li>
  	<li><a href="details.jsp">Quotation details</a></li>
  	<li><a href="#">Quotation calculation</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>
 </div>
 
	
	
	<div class="row">
		<div class="col-sm-4"  style="margin-left:40%; margin-top:10%">
			<form method="post" action="#">
				<h1>Quotation Management</h1><br>
				<h2>Update Quotation data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from quotation where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{		
				%>

				
				
				<div align=left >
					<label class="form-label">Product ID</label> 
					<select name="pid" id="pid" class="form-select	" onchange="this.form.submit();" style="width:400px" >
				 			<option  >Product ID | Product type</option>

						<%
				 			try {
				 				Connection con2;
				 				Class.forName("com.mysql.jdbc.Driver");
								con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm2 = con2.createStatement();
				 				ResultSet rs2 = stm2.executeQuery("select distinct pr.id,pr.type from product pr");
				 				while(rs2.next()){
				 					%>
				 					<option value="<%=rs2.getString("pr.id") %>">
				 						<%=rs2.getString("pr.id") %> | <%=rs2.getString("type") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select>
				</div><br>
				<div align="left">
					<label class="form-label">Date</label> <input
						type="Date" class="form-control"
						placeholder="Enter Date" name="date" id="date" style="width:300px" value="<%=rs.getString("date")%>"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Status</label> <input type="text" style="width:300px" value="<%=rs.getString("status")%>"
						class="form-control" placeholder="Enter Status"
						name="sts" id="sts" required>
				</div><br>

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
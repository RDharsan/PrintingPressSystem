<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		String pid=request.getParameter("pid");
		int p_id=Integer.parseInt(pid);
		String date=request.getParameter("date");
		String sts=request.getParameter("sts");
	
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("insert into quotation(pro_id,date,status)values (?,?,?)");
		pst.setInt(1, p_id);
		pst.setString(2, date);
		pst.setString(3, sts);
	
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record Added Successfully!!");
			
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
	<div class="col-sm-4" style="margin-left:38%; margin-top:10%" >
		<form  method="post" action="#">
				<h1>Quotation Management</h1><br>
				<h2>Add Quotation  </h2><br>
				
				<div align=left >
					<label class="form-label">Product ID</label> 
					<select name="pid" id="pid" class="form-select	" onchange="this.form.submit();" style="width:400px" >
				 			<option  >Product ID | Product type</option>

						<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct pr.id,pr.type from product pr");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("pr.id") %>">
				 						<%=rs.getString("pr.id") %> | <%=rs.getString("type") %>
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
						placeholder="Enter Date" name="date" id="date" style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Status</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="sts" id="sts" required>
				</div><br>
				
				
				
				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info" style="background-color:#006478; color:white"/>
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning" style="background-color:#006478; color:white">
					
				</div>
			</form>
	
	</div>
	
	<div class="col-sm-8" style="margin-left:18%">
		
		<div class="panel-body" style="margin-top:5%">

				<table id="tbl-product"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%" >

					<thead>
						<tr>
							<th>Quotation Id ID</th>
							<th>Product ID</th>
							<th>Date</th>
							<th>Status</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from quotation	";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("pro_id") %></td>
							<td><%=rs.getString("date") %></td>
							<td><%=rs.getString("status") %></td>
						
							
							<td><a href="updatequotation.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="deletequotation.jsp?id=<%=id%>">Delete</a></td>
						
						</tr>
						
						<%
							}
						%>
				</table>
				<br><br>

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
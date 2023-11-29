<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
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
		pst=con.prepareStatement("insert into feedbacks(cus_id,feedbacks,date,status)values (?,?,?,?)");
		pst.setInt(1, c_id);
		pst.setString(2, feedback);
		pst.setString(3, date);
		pst.setString(4, status);
	
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
  	<li><a href="ReturnProductCreate.jsp">Add Return Product</a></li>
  	<li><a href="ReturnProductView.jsp">Return Product details</a></li>
  	<li><a href="ProductReport.jsp">Return Product Report</a></li>
  <li><a href="Feedback.jsp">Feedback details</a></li>
   <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li><br>
  </ul>
 </div>

    
 </div>

<div class="row">
	<div class="col-sm-4" style="margin-left:40%; margin-top:10%" >
		<form  method="post" action="#">
				<h1>Feedback Handling</h1><br>
				<h2>Add feedbacks </h2><br>
				
				<div align=left >
					
						<label>Select Customer</label><br><br>
						<select name="cid" id="cid" class="form-select" onchange="this.form.submit();" style="width:300px">
				 			<option value="0">Select Customer</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id,name from customers");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("id") %>">
				 						<%=rs.getString("id") %>, <%=rs.getString("name") %>
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
					<label class="form-label">Feedbacks</label><br>
					<textarea rows="5" cols="60" name="feedback"></textarea>
				</div><br>
				
				<div align="left">
					<label class="form-label">Date</label> <br>
					<input type="Date" style="width:300px"
						class="form-control" placeholder="Enter deadline date"
						name="date" id="ddate" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Status</label><br>
					<select class="form-select" name="status" required>
						<option>Feedback noted</option>
						<option>Will be noted</option>
					</select>
					
				</div>
				<br>
				
								
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
							<th>Feedback ID</th>
							<th>Customer ID</th>
							<th>Feedbacks</th>
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

						String query = "select * from feedbacks";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("cus_id") %></td>
							<td><%=rs.getString("feedbacks") %></td>
							<td><%=rs.getString("date") %></td>
							<td><%=rs.getString("status") %></td>
						
							
							<td><a href="feedbackUpdate.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="feedbackDelete.jsp?id=<%=id%>">Delete</a></td>
						
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
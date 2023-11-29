<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    
    <%
    	
    	if(request.getParameter("submit")!=null)
    	{
    		String print_id=request.getParameter("printid");
    		int pid =Integer.parseInt(print_id);
    		String status=request.getParameter("status");
    		String date=request.getParameter("date");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/newveenaprinters", "root" ,"dharsanravi.33");
    		pst = con.prepareStatement("insert into proofs(pri_id,status,date)values(?,?,?)");
    		pst.setInt(1,pid);
    		//pst.setString(1,print_id);
    		pst.setString(2,status);
    		pst.setString(3,date);
    		pst.executeUpdate();
    		
    		
    		%>
    		
    		<script>
    		
    		alert("Successfully Proof added");
    		
    		</script>	
    		
    		<%	
    	}
    
    %>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
	<link href="bootstrap/css/bootstarp.css" rel="stylessheet" type="text/css"/>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	

</head>
<body>
<link href="Proofindex.css" rel="stylesheet" text="text/css">

//Header and Navigation
<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
  <ul>
  
  	<li><a href="printingproduct.jsp" active>Printing Details</a></li>
  	<li><a href="Proofindex.jsp">proof details</a></li>

    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>

		<h1>Proof registertion using crud</h1>
		</br>
		<div class="row">
			<div class="col-sm-4" style="margin-top:10%">
				<form  method="POST" action="#">
				
					<div align="left">
						<label class="form-lable"  style="margin-left:50%;margin-right:20%" >Printing ID</label><br><br>
						
						<select name="printid" id="printid" class="form-select" required onchange="this.form.submit();" style="width:200px;margin-left:220px" required>
				 			
				 			<option>Select Print id</option>
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id,type from printing_product");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("id") %>">
				 						<%=rs.getString("id") %>, <%=rs.getString("type") %>
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
					
						<label class="form-lable" style="margin-left:50%; margin-right:50%">STATUS</label>
						<select class="form-select" name="status" id="status" style="width:200px;margin-left:220px" required>
							<option>Done</option>
							<option>On process</option>
							<option>Not yet started</option>
						
						</select>
						
					
					
					</div><br>
					
					<div align="left">
						<label class="form-lable"  style="margin-left:50%; margin-right:50%">DATE</label>
						<input type="Date" class="form-control" style="margin-left:50%; margin-right:50%; width:200px" placeholder="DATE" name="date" id="ddate" required>
					
					
					</div><br>
						
					
						<div align="right" style="margin-left:10%; margin-top:40px">
							<input type="submit" id ="submit" value="submit" name="submit" class="btn btn-info">
							<input type="reset" id ="reset"  value="reset" name="reset" class="btn btn-warning">
						
					</div>	

				</form>
			
			
			
			<div class="col-ss-8">
				 <div class="panel-body">
				 	<table id="tbl-student" style="margin-left:130%;margin-top:-370px" align="center" class="table table-responsive table-bordered" cellpadding="10" width="100%">
				 		<thread>
				 			<tr> 
				 				<th>PROOF ID</th>
				 				<th>PRINT ID</th>
				 				<th>Status</th>
				 				<th>Date</th>
				 				<th>Edit</th>
				 				<th>Delete</th>
				 			
				 			
				 			</tr>
				 			
				 			<%
				 			
				 			
				 			Connection con;
				    		PreparedStatement pst;
				    		ResultSet rs;
				    		
				    		Class.forName("com.mysql.jdbc.Driver");
				    		con = DriverManager.getConnection("jdbc:mysql://localhost/newveenaprinters","root","dharsanravi.33");
				 			
				 			String query ="select * from proofs";
				 			Statement st=con.createStatement();
				 			
				 			rs = st.executeQuery(query);
				 			
								while(rs.next())
								{
									
									String id=rs.getString("id");
									
												 			
				 			
				 			
				 			%>
				 			
				 			
				 			
				 			<tr>
				 				<th><%=rs.getString("id") %></th>
				 				<td><%=rs.getString("pri_id") %></td>
				 				<td><%=rs.getString("status") %></td>
				 				<td><%=rs.getString("date") %></td>
				 				<td><a href="update.jsp?id=<%=id%>"><input class="btn btn-info" type="button" value="EDIT"></a></td>
				 				<td><a href="deleteproof.jsp?id=<%=id%>"><input  class="btn btn-info" type="button" value="DELETE"></a></td>
				 			
				 			
				 			</tr>
				 			
				 			
				 			
				 			<%
				 			
								}
				 			
				 			%>
				 		
				 	
				 	
				 	</table>
				 
				 
				 
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
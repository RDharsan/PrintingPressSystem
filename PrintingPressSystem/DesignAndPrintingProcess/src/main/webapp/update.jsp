<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*" %>
    
       <%
    	
    	if(request.getParameter("submit")!=null)
    	{
    		String id=request.getParameter("id");
    		String print_id=request.getParameter("printid");
    		//int pid =Integer.parseInt(print_id);
    		String status=request.getParameter("status");
    		String date=request.getParameter("date");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("update proofs set pri_id =?, status=?, date=? where id= ?");
    		//pst.setInt(1,pid);
    		pst.setString(1,print_id);
    		pst.setString(2,status);
    		pst.setString(3,date);
    		pst.setString(4,id);
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Recourd updated!!");
    		location.href = 'Proofindex.jsp';
    		
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



		<h1>Proof update</h1>
		
		<div class="row">
		
		<div class="col-sm-4">
				<form  method="POST" action="#">
				
				
				<%
				
						Connection con;
			    		PreparedStatement pst;
			    		ResultSet rs;
			    		
			    		Class.forName("com.mysql.jdbc.Driver");
			    		con = DriverManager.getConnection("jdbc:mysql://localhost/newveenaprinters","root","dharsanravi.33");
						
			    		String id=request.getParameter("id");
						pst = con.prepareStatement("select * from proofs where id= ?");
						pst.setString(1,id);
			    		rs = pst.executeQuery();
			    		
			    		while(rs.next())
			    			
			    		{
			    			
			    			
			    		
				
				
				%>
				
				
				<link href="Proofindex.css" rel="stylesheet" text="text/css">

				//Header and Navigation
				<div class="title">
					 <p class= "title-text">NEW VEENA PRINTERS</p>
				 </div>
				  <div class="wrapper1">
				 
				 <div class="sidebar1">
				  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
				 
				  <ul>
							<li><a href="printingproduct.jsp" active>Printing
									Details</a></li>
							<li><a href="Proofindex.jsp">proof details</a></li>

							<li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
						</ul>
				 </div>
				
				    
				 </div>	
								
				
				
					
				
				
				
					<div align="left" style="margin-top:10%">
					<label class="form-lable"  style="margin-left:50%;margin-right:20%" >Printing ID</label><br>
						<select name="printid" required id="printid" class="form-select" required onchange="this.form.submit();" style="width:200px;margin-left:220px" required>
				 			
				 			
				 			<%
				 			try {
				 				Connection con2;
				 				Class.forName("com.mysql.jdbc.Driver");
								con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm2 = con2.createStatement();
				 				ResultSet rs2 = stm2.executeQuery("select distinct id,type from printing_product");
				 				while(rs2.next()){
				 					
				 					%>
				 					<option<%=rs2.getString("id") %>></option>
				 					<option value="<%=rs2.getString("id") %>">
				 						<%=rs2.getString("id") %>, <%=rs2.getString("type") %>
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
						<label class="form-lable"    style="margin-left:50%; margin-right:-10%">Status</label>
						<select class="form-select" name="status" id="status" style="width:200px;margin-left:220px" required>
						<option><%= rs.getString("status")%></option>
							<option>Done</option>
							<option>On process</option>
							<option>Not yet started</option>
						
						</select>
					
					
					</div><br>
					
					<div align="left">
						<label class="form-lable"  style="margin-left:50%; margin-right:-10%">Date</label>
						<input type="Date" class="form-controller" style="margin-left:50%; margin-right:50%; width:200px" placeholder="DATE" value="<%= rs.getString("date")%>"   name="date" id="ddate" required>
					
					
					</div>
					
					
					<% }  %>
					
					
					
					
					
						</br>
						
						
					
						<div align="right" style="margin-right:-10%">
							<input type="submit" id ="submit" value="submit" name="submit" class="btn btn-info">
							<input type="reset" id ="reset"  value="reset" name="reset" class="btn btn-warning">
						
					</div>
					
					<div align="right" style="margin-right:-20%; margin-top:2%">
					
						<p><a href="Proofindex.jsp">Click Back</a> </p>
					
					
					</div>
					
					
					
					
							
				
				</form>
			
			</div>
		
			
		</div>
		
		
		

</body>
</html>
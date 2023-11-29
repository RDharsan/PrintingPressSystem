<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%	
if(request.getParameter("submit")!=null){
	
	String id=request.getParameter("id");
	String qid=request.getParameter("qid");
	int qId=Integer.parseInt(qid);
	String quantity=request.getParameter("quantity");
	String color=request.getParameter("color");
	String ink=request.getParameter("ink");
	String ptype=request.getParameter("ptype");
	String size=request.getParameter("size");
	String pquantity=request.getParameter("pquantity");
	String bquantity=request.getParameter("bquantity");
	String gum=request.getParameter("gum");
	
	

	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
	pst=con.prepareStatement("update quotation_details set qid=?,quantity=?,colourtype=?,inkamount=?,papertype=?,papersize=?,paperquantity=?,boardquantity=?,useofgums=? where id=?");
	pst.setInt(1, qId);
	pst.setString(2, quantity);
	pst.setString(3, color);
	pst.setString(4, ink);

	pst.setString(5, ptype);
	pst.setString(6, size);
	pst.setString(7, pquantity);
	pst.setString(8, bquantity);
	pst.setString(9, gum);
	pst.setString(10,id);

	pst.executeUpdate();
		%>
		
		<script>
			alert("Record Updateddd");
			location.href = 'details.jsp';
			
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
<li><a href="index.jsp" active>Add Customer</a></li>
  	<li><a href="product.jsp">Product details</a></li>
  	<li><a href="payment.jsp">Payment</a></li>
  	<li><a href="Report.jsp">Summary</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>
 </div>
 
	
	
	<div class="row">
		<div class="col-sm-4"  style="margin-left:40%; margin-top:10%">
			<form method="post" action="#">
				<h1>Quotation Handling</h1><br>
				<h2>Update Quotation details data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from quotation_details where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{		
				%>
	
					<div align="left">
					<label class="form-label">ID</label> <input
						type="Number" class="form-control"
						placeholder="Enter Date" name="id" id="date" style="width:300px" value="<%=rs.getString("id")%>"
						required readonly>
				</div><br>
				
				
				<div align=left >
					<label class="form-label">Quotation ID</label> 
					<select name="qid" id="qid" class="form-select	" onchange="this.form.submit();" style="width:400px" >
				 			<option  >Quotation ID</option>

						<%
				 			try {
				 				Connection con2;
				 				Class.forName("com.mysql.jdbc.Driver");
								con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm2 = con2.createStatement();
				 				ResultSet rs2 = stm2.executeQuery("select distinct id from quotation");
				 				while(rs2.next()){
				 					%>
				 					<option value="<%=rs2.getString("id") %>">
				 						<%=rs2.getString("id") %>
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
					<label class="form-label">quantity</label> <input
						type="Number" class="form-control"
						placeholder="Enter Date" name="quantity" id="date" style="width:300px" value="<%=rs.getString("quantity")%>"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Colour type</label> <input type="text" style="width:300px" value="<%=rs.getString("colourtype")%>"
						class="form-control" placeholder="Enter Status"
						name="color" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Ink amount</label> <input type="Number" min="0" style="width:300px" value="<%=rs.getString("inkamount")%>"
						class="form-control" placeholder="Enter Status"
						name="ink" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Paper type</label> <input type="text" style="width:300px" value="<%=rs.getString("papertype")%>"
						class="form-control" placeholder="Enter Status"
						name="ptype" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Paper size</label> <input type="text" style="width:300px" value="<%=rs.getString("papersize")%>"
						class="form-control" placeholder="Enter Status"
						name="size" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Paper quantity</label> <input type="Number" style="width:300px" value="<%=rs.getString("paperquantity")%>"
						class="form-control" placeholder="Enter Status"
						name="pquantity" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Board quantity</label> <input type="Number" style="width:300px" value="<%=rs.getString("boardquantity")%>"
						class="form-control" placeholder="Enter Status"
						name="bquantity" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Use of gums</label> <input type="Number" style="width:300px" value="<%=rs.getString("useofgums")%>"
						class="form-control" placeholder="Enter Status"
						name="gum" id="sts" required>
				</div><br>
				
				
				
				
				<%
				}
				%>


				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info" style="background-color:#006478; color:white"/>
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning" style="background-color:#006478; color:white">
					
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
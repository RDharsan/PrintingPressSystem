<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
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
		pst=con.prepareStatement("insert into quotation_details(qid,quantity,colourtype,inkamount,papertype,papersize,paperquantity,boardquantity,useofgums)values (?,?,?,?,?,?,?,?,?)");
		pst.setInt(1, qId);
		pst.setString(2, quantity);
		pst.setString(3, color);
		pst.setString(4, ink);
	
		pst.setString(5, ptype);
		pst.setString(6, size);
		pst.setString(7, pquantity);
		pst.setString(8, bquantity);
		pst.setString(9, gum);
	
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
				<h2>Add Quotation Details  </h2><br>
				
				<div align=left >
					<label class="form-label">Quotation ID</label> 
					<select name="qid" id="qid" class="form-select	" onchange="this.form.submit();" style="width:400px" >
				 			<option  >Quotation ID | Quotation type</option>

						<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id from quotation");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("id") %>">
				 						<%=rs.getString("id") %>
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
						placeholder="Enter Date" name="quantity" id="date" style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Colour type</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="color" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Ink amount</label> <input type="Number" min="0" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="ink" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Paper type</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="ptype" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Paper size</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="size" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Paper quantity</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="pquantity" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Board quantity</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="bquantity" id="sts" required>
				</div><br>
				<div align="left">
					<label class="form-label">Use of gums</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter Status"
						name="gum" id="sts" required>
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
							<th>ID</th>
							<th>Quotation ID</th>
							<th>Colour</th>
							<th>Ink amount</th>
							<th>paper type</th>
							<th>paper size</th>
							<th>paper quantity</th>
							<th>board quantity</th>
							<th>use of gums</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from quotation_details	";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("qid") %></td>
							<td><%=rs.getString("colourtype") %></td>
							<td><%=rs.getString("inkamount") %></td>
							<td><%=rs.getString("papertype") %></td>
							<td><%=rs.getString("papersize") %></td>
							<td><%=rs.getString("paperquantity") %></td>
							<td><%=rs.getString("boardquantity") %></td>
							<td><%=rs.getString("useofgums") %></td>
							
							
						
							
							<td><a href="updatequotationdetail.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="deletequotationdetail.jsp?id=<%=id%>">Delete</a></td>
						
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
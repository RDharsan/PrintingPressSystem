<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		String cid=request.getParameter("cid");
		int c_id=Integer.parseInt(cid);
		String type=request.getParameter("type");
		String odate=request.getParameter("odate");
		String ddate=request.getParameter("ddate");
		String quan=request.getParameter("quan");
		int c_quan=Integer.parseInt(quan);
		String wsize=request.getParameter("wsize");
		String hsize=request.getParameter("hsize");
		String content=request.getParameter("content");
		String color=request.getParameter("color");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("insert into product(cus_id,type,ordered_date,deadline_date,quantity,Width,Height,contents,color )values (?,?,?,?,?,?,?,?,?)");
		pst.setInt(1, c_id);
		pst.setString(2, type);
		pst.setString(3, odate);
		pst.setString(4, ddate);
		pst.setInt(5, c_quan);
		pst.setString(6, wsize);
		pst.setString(7, hsize);
		pst.setString(8, content);
		pst.setString(9, color);
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
  	<li><a href="index.jsp">Add Customer</a></li>
  	<li><a href="product.jsp">Product details</a></li>
  	<li><a href="payment.jsp">Payment</a></li>
  	<li><a href="Report.jsp">Summary</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>

<div class="row">
	<div class="col-sm-4" style="margin-left:40%; margin-top:10%" >
		<form  method="post" action="#">
				<h1>Client Management</h1><br>
				<h2>Add Product Data </h2><br>
				
				<div align=left >
					
						<label>Select Customer</label><br>
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
					<label>Select Product type</label><br>
					<select name="type" id="type" style="width:300px" class="form-select" required >
						<option>Banner</option>
						<option>Wedding Cards</option>
						<option>Visiting Cards</option>
						<option>Books</option>
						<option>Calendars</option>
						<option>Magazines</option>
						<option>Stickers</option>
						<option>Notices</option>
					</select >
					
				</div><br>

				<div align="left">
					<label class="form-label">Ordered Date</label> <input type="Date" style="width:300px"
						class="form-control" placeholder="Enter ordered date"
						name="odate" id="odate" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Product Final deadline date</label> <input type="Date" style="width:300px"
						class="form-control" placeholder="Enter deadline date"
						name="ddate" id="ddate" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Number of Products</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter Product Quantity" min="0"
						name="quan" id="quan" required>
				</div>
				<br>
				
				<div align="left">
					
					<label class="form-label">Width size per product</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter Product width eg:100" min="0"
						name="wsize" id="wsize" required>
				</div>
				<br>
				<div align="left">
					
					<label class="form-label">Height size per product</label> <input type="Number" style="width:300px"
						class="form-control" placeholder="Enter Product Height eg:100" min="0"
						name="hsize" id="hsize" required>
				</div>
				<br>
				
				<div align="left">
				
					<label class="form-label">Product Contents</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter Product Contents"
						name="content" id="content" required>
				</div>
				<br>
				
				<div align="left">
					<select name="color" id="color" style="width:300px" class="form-select">
						<option>Black & White</option>
						<option>4 colour</option>
						<option>5 colour</option>
						<option>6 colour</option>
						<option>Red & yellow</option>
						<option>Blue & white</option>
						<option>Full colour</option>
						
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
							<th>Product ID</th>
							<th>Customer ID</th>
							<th>Type</th>
							<th>order date</th>
							<th>Deadline date</th>
							<th>Quantity</th>
							<th>Width Size</th>
							<th>Height Size</th>
							<th>Contents</th>
							<th>Color type</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from product";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("cus_id") %></td>
							<td><%=rs.getString("type") %></td>
							<td><%=rs.getString("ordered_date") %></td>
							<td><%=rs.getString("deadline_date") %></td>
							<td><%=rs.getString("quantity") %></td>
							<td><%=rs.getString("Width") %></td>
							<td><%=rs.getString("Height") %></td>
							<td><%=rs.getString("contents") %></td>
							<td><%=rs.getString("color") %></td>
							
							<td><a href="updateProduct.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="deleteProduct.jsp?id=<%=id%>">Delete</a></td>
						
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
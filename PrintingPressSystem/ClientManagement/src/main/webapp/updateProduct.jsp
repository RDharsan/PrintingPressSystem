<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%	
if(request.getParameter("submit")!=null){
	
	String id=request.getParameter("id");
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
	pst=con.prepareStatement("update product set cus_id=?,type=?,ordered_date=?,deadline_date=?,quantity=?,Width=?,Height=?,contents=?,color=? where id=?");
	pst.setInt(1, c_id);
	pst.setString(2, type);
	pst.setString(3, odate);
	pst.setString(4, ddate);
	pst.setInt(5, c_quan);
	pst.setString(6, wsize);
	pst.setString(7, hsize);
	pst.setString(8, content);
	pst.setString(9, color);
	pst.setString(10, id);
	pst.executeUpdate();
	
		%>
		
		<script>
			alert("Record Updateddd");
			location.href = 'product.jsp';
			
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
				<h1>Client Management</h1><br>
				<h2>Update Product data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from product where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{		
				%>

				
				
				<div align=left >
					<label class="form-label">Customer ID</label> <input type="text" readonly="readonly"
						class="form-control" placeholder="Enter Customer ID" style="width:300px" value="<%=rs.getString("cus_id")%>"
						name="cid" id="cid" >
				</div><br>
				<div align="left">
						<label>Select Product type</label><br>
						<select name="type" id="type" style="width:300px" class="form-select" required >
						<option><%=rs.getString("type")%></option>
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
					<label class="form-label">Ordered Date</label> <input type="Date" readonly="readonly" value="<%=rs.getString("ordered_date")%>" style="width:300px"
						class="form-control" placeholder="Enter ordered date"
						name="odate" id="odate" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Product Final deadline date</label> <input type="Date"   value="<%=rs.getString("deadline_date")%>" style="width:300px"
						class="form-control" placeholder="Enter deadline date"
						name="ddate" id="ddate" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">Number of Products</label> <input type="Number" value="<%=rs.getString("quantity")%>" style="width:300px"
						class="form-control" placeholder="Enter Product Quantity" min="0"
						name="quan" id="quan" required>
				</div>
				<br>
				
				<div align="left">
					<label class="form-label">Width size per product</label> <input type="Number"  value="<%=rs.getString("Width")%>" style="width:300px"
						class="form-control" placeholder="Enter Product Width" min="0"
						name="wsize" id="wsize" required>
				</div>
				<br>
				<div align="left">
					<label class="form-label">Height size per product</label> <input type="Number"  value="<%=rs.getString("Height")%>" style="width:300px"
						class="form-control" placeholder="Enter Product Width" min="0"
						name="hsize" id="hsize" required>
				</div>
				<br>
				
				<div align="left">
					<label class="form-label">Product Contents</label> <input type="text" value="<%=rs.getString("contents")%>" style="width:300px"
						class="form-control" placeholder="Enter Product Contents"
						name="content" id="content" required>
				</div>
				<br>
				
				<div align="left">
						<select name="color" id="color" style="width:300px" class="form-select" required>
						<option><%=rs.getString("color")%></option>
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
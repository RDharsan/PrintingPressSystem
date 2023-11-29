<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%	
	if(request.getParameter("submit")!=null){
		
		//String cusid=request.getParameter("cid");
		String type=request.getParameter("type");
		
		String pid=request.getParameter("pid");
		int idp=Integer.parseInt(pid);
		
		String product=request.getParameter("p");
		String icolor=request.getParameter("icolor");
		String inkvol=request.getParameter("inkvol");
		int inkvo=Integer.parseInt(inkvol);
		String pquan=request.getParameter("pquan");
		int p_quan=Integer.parseInt(pquan);
		String bquan=request.getParameter("bquan");
		int b_quan=Integer.parseInt(bquan);
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("insert into printing_product(type, pro_id, product, ink_color,ink_litre,paper_quantity,board_quantity)values (?,?,?,?,?,?,?)");
		pst.setString(1, type);
		pst.setInt(2, idp);	
		pst.setString(3, product);
		pst.setString(4, icolor);
		pst.setInt(5, inkvo);
		pst.setInt(6, p_quan);
		pst.setInt(7, b_quan);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record Added Successfully");
			
		</script>
	<%		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesjeet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
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
  	<li><a href="printingproduct.jsp" active>Printing Details</a></li>
  	<li><a href="Proofindex.jsp">proof details</a></li>

    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>

<div class="row">
	
	<br><div class="col-sm-4" style="margin-left:40%; margin-top:10%" >
		
		<form  method="post" action="#">
				<h1>Printing & Design Management</h1><br>
				<h2>Add Printing details </h2>
				
				<div align=left >
					<label>Printing type</label><br>
					<select class="form-select" name="type" style="width:300px" required>
						<option>Offcut Printing</option>
						<option>Digital printing</option>
						<option>Surface printing</option>
						<option>Screen printing</option>
						<option>Rotary printing</option>
						<option>Gravure printing</option>
						
					</select>
					
				</div><br>
				<div align="left">
					<label class="form-label">Product id</label> 
					<select name="pid" id="pid" class="form-select" onchange="this.form.submit();" style="width:300px" required>
				 			
				 			<option>Select product id</option>
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id,type from product");
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
					<label class="form-label">Product </label> 
					<select name="p" id="p" class="form-select" onchange="this.form.submit();" style="width:300px" required>
				 		<option>Select product</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct type from product");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("type") %>">
				 						<%=rs.getString("type") %>
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
					<label class="form-label">Ink color</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter ink color"
						name="icolor" id="icolor" required>
				</div><br>
			
				
			
				<div align="left">
					<label class="form-label">Ink usage</label> <input type="Number" min="0" style="width:300px"
						class="form-control" placeholder="Enter ink usage Ex:100"
						name="inkvol" id="inkvol" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">paper quantity</label> <input type="Number" min="0" title="Enter valid quantity numbers!!" style="width:300px"
						class="form-control" placeholder="Enter paper quantitiy"
						name="pquan" id="pquan" required>
				</div><br>
				<div align="left">
					<label class="form-label">Board quantity</label> <input type="Number" min="0" style="width:300px"
						class="form-control" placeholder="Enter board quantitiy"
						name="bquan" id="bquan" required>
				</div>
				
				
				<br>
				
				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info"  style="background-color:#006478; color:white" />
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-info" style="background-color:#006478; color:white;">
					
				</div>
				
				<br>
			</form>
	</div>
	</div>
	
	<div class="col-sm-8" style="margin-left:18%">
		
		<div class="panel-body" style="margin-top:5%">

				<table id="tbl-print"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%" >

					<thead>
						<tr>
							<th>Printing ID</th>
							<th>Type</th>
							<th>Product id</th>
							<th>Product </th>
							<th>Ink color</th>
							<th>Ink usage</th>
							<th>paper quantity</th>
							<th>board quantity</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");

						String query = "select * from printing_product";
						Statement st = con.createStatement();

						rs = st.executeQuery(query);

						while (rs.next()) {

							String id = rs.getString("id");
						%>

						<tr>
							<td><%=rs.getString("id") %></td>
							<td><%=rs.getString("type") %></td>
							<td><%=rs.getString("pro_id") %></td>
							<td><%=rs.getString("product") %></td>
							<td><%=rs.getString("ink_color") %></td>
							<td><%=rs.getString("ink_litre") %></td>
							<td><%=rs.getString("paper_quantity") %></td>
							<td><%=rs.getString("board_quantity") %></td>
							
						<td><a href="updateprinting.jsp?id=<%=id%>"><input class="btn btn-info" type="button" value="EDIT"></a></td>
							<td><a href="deleteprint.jsp?id=<%=id%>"><input class="btn btn-info" type="button" value="DELETE"></a></td>
						
						</tr>
						
						<%
							}
						%>
				</table>
				<br><br>

			</div>
		
		
		
		
		
	</div>



<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
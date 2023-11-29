<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%	
	if(request.getParameter("submit")!=null){
		
		//String cusid=request.getParameter("cid");
		String id=request.getParameter("id");
		//int ID=Integer.parseInt("id");
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
		pst=con.prepareStatement("update printing_product set type=?, pro_id=?, product=?, ink_color=?,ink_litre=?,paper_quantity=?,board_quantity=? where id=?");
		pst.setString(1, type);
		pst.setInt(2, idp);	
		pst.setString(3, product);
		pst.setString(4, icolor);
		pst.setInt(5, inkvo);
		pst.setInt(6, p_quan);
		pst.setInt(7, b_quan);
		pst.setString(8, id);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record updated Successfully");
			location.href = 'printingproduct.jsp';
			
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
		<div class="col-sm-4"  style="margin-left:40%; margin-top:10%">
			<form method="post" action="#">
				<h2>Update Printing data</h2><br>
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
				
				String id=request.getParameter("id");//id---edit button ?id ah paaaru
				pst=con.prepareStatement("select * from printing_product where id=?");
				pst.setString(1, id);
				
				rs=pst.executeQuery();
				while(rs.next())
				{
					
				
					
				%>

				<div align=left >
					<label class="form-label">Printing Type</label> 
					<select class="form-select" name="type" style="width:300px" required>
						<option><%=rs.getString("type")%></option>
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
				
					 <input
						type="text" class="form-control"
						placeholder="Enter product id" value="<%=rs.getInt("pro_id")%>" name="pid" id="pid" style="width:300px"
						required readonly>
				</div><br>
				<div align="left">
					<label class="form-label">Product </label> <input
						type="text" class="form-control"
						placeholder="Enter product " name="p" id="p" value="<%=rs.getString("product")%>"  readonly style="width:300px"
						required>
				</div><br>

				<div align="left">
					<label class="form-label">Ink color</label> <input type="text" style="width:300px"
						class="form-control" placeholder="Enter ink color" value="<%=rs.getString("ink_color")%>"
						name="icolor" id="icolor" required>
				</div><br>
			
				
			
				<div align="left">
					<label class="form-label">Ink usage</label> <input type="Number" min="0" value="<%=rs.getInt("ink_litre")%>" style="width:300px"
						class="form-control" placeholder="Enter ink usage"
						name="inkvol" id="inkvol" required>
				</div><br>
				
				<div align="left">
					<label class="form-label">paper quantity</label> <input type="Number" min="0" value="<%=rs.getInt("paper_quantity")%>" style="width:300px"
						class="form-control" placeholder="Enter paper quantitiy"
						name="pquan" id="pquan" required>
				</div><br>
				<div align="left">
					<label class="form-label">Board quantity</label> <input type="Number" min="0" value="<%=rs.getInt("board_quantity")%>"style="width:300px"
						class="form-control" placeholder="Enter board quantitiy"
						name="bquan" id="bquan" required>
				</div>
				<br>

				<%
				}
				%>


				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit"
						class="btn btn-info"> <input type="reset" id="reset"
						value="Reset" name="reset" class="btn btn-warning">

				</div>

				<div align="left">
					<p>
						
						<a href="printingproduct.jsp"><input type="button" id="submit" value="Back" name="submit" style="margin-top:-15%";
						class="btn btn-info"></a>
					</p>

				</div>
			</form>

		</div>
	</div>
</body>
</html>
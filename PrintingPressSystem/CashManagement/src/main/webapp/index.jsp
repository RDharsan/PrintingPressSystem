<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@include file="nav.jsp" %>
<%@page import="java.sql.*"  %>

<%
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	ResultSet resultSet;
	Statement statement;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
	
	if (request.getParameter("submit")!=null){
		String date = request.getParameter("date") ;
		String description = request.getParameter("description") ;
		String amount = request.getParameter("amount") ;
		String type = request.getParameter("type") ;

		pst = con.prepareStatement("insert into administrative_exp(date,description,amount,type)values(?,?,?,?)");
		pst.setString(1, date);
		pst.setString(2, description);
		pst.setString(3, amount);
		pst.setString(4, type);
		try {
			pst.executeUpdate();
			%>
			<script>
				alert("Record Added Successfully");
			</script>
			<%
			statement=con.createStatement();
			String sql ="SELECT * FROM administrative_exp ORDER BY ax_id DESC LIMIT 1";
			try{ 
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					int ax_id = resultSet.getInt("ax_id");
					amount = resultSet.getString("amount");
					date = resultSet.getString("date");
					description = resultSet.getString("description");
					type = resultSet.getString("type");
					
					pst = con.prepareStatement("insert into expenxe_history(date,description,amount,type,id)values(?,?,?,?,?)");
					pst.setString(1, date);
					pst.setString(2, description);
					pst.setString(3, amount);
					pst.setString(4, type);
					pst.setInt(5, ax_id);
					pst.executeUpdate();
					
					break;
				}
				
			} catch (Exception e) {
				System.out.println(e);
		}
	}
		catch(Exception e) {
			System.out.print(e);
			%>
			<script>
				alert("Record Failed to Add");
			</script>
			<%		
		}	
	}
%>

<!DOCTYPE html>

<html>
<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>CASH MANAGEMENT</title>
		<link href = "bootstrap/css/bootstrap.css" rel = "stylesheet" type = "text/css" />
		<link href = "bootstrap/css/bootstrap.min.css" rel = "stylesheet" type = "text/css" />
		<link href = "styles.css" rel = "stylesheet" type = "text/css" />	
		
		<SCRIPT LANGUAGE="JavaScript">
            <!--
            function checker()
            {
                var regExp1 =  /^\d+(\.(\d+))?$/
                var result1 = document.form.amount.value.match(regExp1)
                if (result1 == null) {
                    alert("Amount not valid")
                    document.form.amount.value = ""
                    return false
                } else {
                    document.form.submit()
                }
            }
            //-->
        </SCRIPT>
			
</head>
<body>

<div class = "row container">
	<h2> Administration Expense </h2>
		 <div class = "col-sm-4">
			<div class ="border">
		 	<form  method="post" action="" name="form" ONSUBMIT="return checker()">
		 				 		
		 		<div align="left">
		 			<label class="form-label">Date</label>
		 			<input type="date" class="form-control" placeholder="Date Month year" name="date" id="date" required>
		 		</div>
		 		
		 		
		 		<div align="left">
		 			<label class="form-label">Description</label>
		 			<input type="text" class="form-control"  name="description" placeholder="Description"  id="description" required>
		 		</div>

		 		
		 		<div align="left">
		 			<label class="form-label">Amount</label>
		 			<input type="text" class="form-control"  name="amount" placeholder="XXXX" id="amount" required>
		 		</div>
		 		
		 		<div align="left">
		 			<label class="form-label">Type</label>
		 			<input type="text" class="form-control"  name="type" placeholder="Type" id="type" required>
		 		</div>
		 	
		 		
		 		<div align="right">
		 			<input type="submit" id="submit"  value="SUBMIT" name="submit"  class="btn-info btn">
		 			<input type="submit" id="reset"  value="CLEAR" name="reset"  class="btn-warning btn">
		 		</div>
		
		 		</form>
		 		</div>
		 	</div>
		 			 	
		 <div class = "col-sm-8 " >
		 	<div class="panel-body">
		 			<table id="tbl-expense" class="table table-responsive table-bordered tbl-contain" cellpadding="0" width="100%">
		 			<thead>
		 				<tr>
		 					<th>ID</th>
		 					<th>DATE</th>
		 					<th>DESCRIPTION</th>
		 					<th>AMOUNT</th>
		 					<th>TYPE</th>
		 					<th>EDIT</th>
		 					<th>DELETE</th>
		 				</tr>
		 				
		 				<%
		 				
		 				Class.forName("com.mysql.jdbc.Driver");
		 				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
	 				
	 					String query = "select * from administrative_exp";
	 					Statement st = con.createStatement();
	 					
 						rs = st.executeQuery(query);
		 						
		 				while(rs.next()){
		 					String ax_id = rs.getString("ax_id");
		 					String type = rs.getString("type"); 		
		 				%>
		 				
		 				<tr>
		 					<td><%=rs.getString("ax_id") %></td>
		 					<td><%=rs.getString("date") %></td>
		 					<td><%=rs.getString("description") %></td>
		 					<td><%=rs.getString("amount") %></td>
		 					<td><%=rs.getString("type") %></td>
		 					<td><button class="button btn"><i class="fa fa-edit icon"></i><a href="update.jsp?ax_id=<%=ax_id%>">EDIT</button></a></td>
							<td><button class="button btn"><i class="fa fa-trash icon"></i><a href="delete.jsp?ax_id=<%=ax_id%>&type=<%=type%>">DELETE</button></a></td>
		 				</tr>
		 				
		 				<%
		 					}		 				
		 				%>
		 		</table>
		 	
		 	</div>
		 
		 
		 </div>
</div>

</body>
</html>
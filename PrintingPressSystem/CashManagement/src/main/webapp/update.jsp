<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"  %>   
<%@include file="nav.jsp" %>

<%
	if (request.getParameter("submit")!=null){
		
		String ax_id = request.getParameter("ax_id") ;
		String date = request.getParameter("date") ;
		String description = request.getParameter("description") ;
		String amount = request.getParameter("amount") ;
		String type = request.getParameter("type") ;
		
		Connection con;
		PreparedStatement pst,pst2;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
		pst = con.prepareStatement("update administrative_exp set date=?,description=?,amount=?,type=? where ax_id=?");
		pst.setString(1, date);
		pst.setString(2, description);
		pst.setString(3, amount);
		pst.setString(4, type);
		pst.setString(5, ax_id);
		try {
			pst.executeUpdate();
			%>
			<script>
			if(confirm("Record Updated Successfully")) {
			    window.location.href = "index.jsp"
			}
				//alert("Record Updated Successfully");
			</script>
			<%
			try{
				pst2 = con.prepareStatement("update expenxe_history set date=?,description=?,amount=? where type=? and id=?");
				pst2.setString(1, date);
				pst2.setString(2, description);
				pst2.setString(3, amount);
				pst2.setString(4, type);
				pst2.setString(5, ax_id);
				pst2.executeUpdate();
			}catch(Exception e) {
				System.out.print(e);
			}
		}
		catch(Exception e) {
			System.out.print(e);
			%>
			<script>
				alert("Record Failed to Update");
			</script>
			<%		
		}	
	}
%>

  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
		<title>UPDATE</title>
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

<div class="row container">
	<h2>Administration Update</h2>
	
	<div class = "col-sm-4">
	<div class ="border">
		 	<form  method="post" action="" name="form" ONSUBMIT="return checker()">
		 	
		 	<%
		 	Connection con;
			PreparedStatement pst;
			ResultSet rs;
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
			
			String ax_id = request.getParameter("ax_id");
			
			pst = con.prepareStatement("select * from administrative_exp where ax_id=?");
			pst.setString(1,ax_id);
			rs = pst.executeQuery();
			
			while(rs.next()){
				
		 	
		 	%>
		 			 	
		 				 		
		 		<div align="left">
		 			<label class="form-label">Date</label>
		 			<input type="date" class="form-control" value="<%=rs.getString("date") %>"  name="date" id="date" required>
		 		</div>
		 		
		 		
		 		<div align="left">
		 			<label class="form-label">Description</label>
		 			<input type="text" class="form-control"  value="<%=rs.getString("description") %>"  name="description" id="description" required>
		 		</div>

		 		
		 		<div align="left">
		 			<label class="form-label">Amount</label>
		 			<input type="text" class="form-control"  value="<%=rs.getString("amount") %>"  name="amount" id="amount" required>
		 		</div>
		 		
		 		<div align="left">
		 			<label class="form-label">Type</label>
		 			<input type="text" class="form-control"  value="<%=rs.getString("type") %>"  name="type" id="type" readonly>
		 		</div>
		 		<% } %>
		 	
		
		 		<div align="right">
		 			<input type="submit" id="submit"  value="UPDATE" name="submit"  class="btn-info btn">
		 			<input type="submit" id="reset"  value="CLEAR" name="reset"  class="btn-warning btn">
		 		</div>
		 		
		 		<div align="right">
		 			<p><a href="index.jsp"> Go to Administration Expense </a></p>
		 		</div>

			 </form>
			</div>
		 	</div>
		 </div>
	

</body>
</html>
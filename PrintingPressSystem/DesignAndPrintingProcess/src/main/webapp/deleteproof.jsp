<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %> 
    
    
    <%	

		String id=request.getParameter("id");
	
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("delete from proofs where id=?");
		pst.setString(1, id);
		pst.executeUpdate();
		
		
		%>
		
		<script>
			alert("Record Deleted");
			location.href = 'Proofindex.jsp';
			
		</Script>
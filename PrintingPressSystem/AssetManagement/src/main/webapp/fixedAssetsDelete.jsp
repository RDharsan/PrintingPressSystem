<%@page import="java.sql.*" %>
<%	
	
		
		String id=request.getParameter("id");
	
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
		pst=con.prepareStatement("delete from fixed_assets where id=?" );
		
		pst.setString(1, id);
		pst.executeUpdate();
		
		%>
		
		<script>
			alert("Record deleted Successfully");
			location.href = 'fixedassetsInsert.jsp';
		</Script>
	<%		
	

%>
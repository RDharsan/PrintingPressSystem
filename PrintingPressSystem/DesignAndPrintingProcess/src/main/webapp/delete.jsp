

 <%@page import="java.sql.*" %>
    
       <%
    	
    	
    		String id=request.getParameter("id");
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/newveenaprinters","root","root14500");
    		pst = con.prepareStatement("delete from proofs where id = ?");
    		//pst.setInt(1,pid);
    		
    		pst.setString(1,id);
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Recourd Deleteeee");
    		
    		</script>	
    		
    	
<%@page import="java.sql.*"  %>   
<%@include file="nav.jsp" %>

<%
		String ax_id = request.getParameter("ax_id") ;
		String type = request.getParameter("type") ;
		Connection con;
		PreparedStatement pst,pst2;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
		
		pst = con.prepareStatement("delete from administrative_exp where ax_id=?");
		pst.setString(1, ax_id);
		
		try{
			pst.executeUpdate();
			%>
			<script>
			if(confirm("Record Deleted Successfully")) {
			    window.location.href = "index.jsp"
			}
				//alert("Record Deleted Successfully");
			</script>
			<%
			try{
				pst2 = con.prepareStatement("delete from expenxe_history where type=? and id=?");
				pst2.setString(1, type);
				pst2.setString(2, ax_id);
				pst2.executeUpdate();
			}catch(Exception e) {
				System.out.print(e);
			}
		}catch(Exception e) {
			System.out.print(e);
			%>
			<script>
				alert("Record Failed to Delete");
			</script>
			<%		
		}	
%>	



			

			
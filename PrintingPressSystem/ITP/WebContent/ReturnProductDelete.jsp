<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String pID = request.getParameter("pID");
	int no = Integer.parseInt(pID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from returnp where pID ='" +pID+"'");
	response.sendRedirect("ReturnProductView.jsp");
	%>
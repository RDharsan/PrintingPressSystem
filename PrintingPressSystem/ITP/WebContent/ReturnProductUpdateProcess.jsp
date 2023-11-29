<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/newveenaprinters";%>
<%!String user = "root";%>
<%!String psw = "dharsanravi.33";%>
<%
String pID = request.getParameter("pID");
String pNo =request.getParameter("pNo");
String pType =request.getParameter("pType");
String pQty=request.getParameter("pQty");
String pDate=request.getParameter("pDate");
String pReason=request.getParameter("pReason");
String pReturn=request.getParameter("pReturn");




if(pID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(pID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update returnp set pID=?,pNo=?,pType=?,pQty=?,pDate=?,pReason=?,pReturn=?  where pID="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,pNo);
ps.setString(3,pType);
ps.setString(4,pQty);
ps.setString(5,pDate);
ps.setString(6,pReason);
ps.setString(7,pReturn);
int i = ps.executeUpdate();
if(i > 0)
{
	
	 
RequestDispatcher rd = request.getRequestDispatcher("ReturnProductView.jsp");
rd.include(request, response);
}
else
{
out.print("There is a problem in updating Record.");

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
   
    
<!DOCTYPE html>
  <html>
      <head>
         <meta charset="ISO-8859-1">
         <title>NVP</title>

         <link href="log.jpg" rel ="icon" type= "image/icon">
         <link href="Table.css" rel="stylesheet" type="text/css">
      </head>
      <body>

        <div class="title">
	       <p class= "title-text">NEW VEENA PRINTERS</p>
        </div>
        <div class="wrapper1">
           <div class="sidebar1">
            <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
    <ul>
  	   <li><a href="EmpDetailsCreate.jsp"><img src="adduser.png" width="20" height="20"/><br>Register New Employee</a></li>
  	   <li><a href="EmpLeaveCreate.jsp"><img src="leave.png" width="20" height="20"/><br>Employee Leave Details</a></li>
  	   <li><a href="EmpSalaryCreate.jsp"><img src="salary.png" width="20" height="20"/><br>Employee Salary Details</a></li>
  	   <li><a href="EmpCourseCreate.jsp"><img src="course.png" width="20" height="20"/><br>Employee Course Details</a></li>
  	   <li><a href="../../LoginAndHome/Home.jsp"><img src="home.png" width="20" height="20"/><br>HOME</a></li>
    </ul>
         </div>
      </div>
 			<div class="row">
				 <div class="colum">
				 	<table id="tbl-student" class="table" >
				 	  <h2 align="center">Employee Leave Details</h2>
				 		 <thread>
				 			<tr> 
				 			    <th>LEAVE_ID</th>
				 				<th>EMP_NAME</th>
				 			    <th>LEAVE_TYPE</th>
				 				<th>DATE FROM</th>
				 				<th>DATE TO</th>
				 				<th>TIME</th>
				 				<th>REASON</th>
				 				<th>EDIT</th>
				 				<th>DELETE</th>
				 			
				 			
				 			</tr>
				 			
				 			<%
				 			
				 			
				 			Connection con;
				    		PreparedStatement pst;
				    		ResultSet rs;
				    		
				    		Class.forName("com.mysql.jdbc.Driver");
				    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
				    		
				 			String query ="select * from employee_leaves";
				 			Statement st=con.createStatement();
				 			
				 			rs = st.executeQuery(query);
				 			
								while(rs.next())
								{
									
									String id =rs.getString("id");
									
												 			
				 			
				 			
				 			%>
				 			
				 			
				 			
				 			<tr>
				 			    <td><%=rs.getString("id") %></td>
				 			    <td><%=rs.getString("em_name") %></td>
				 				<td><%=rs.getString("le_type") %></td>
				 				<td><%=rs.getString("date_from") %></td>
				 				<td><%=rs.getString("date_to") %></td>
				 				<td><%=rs.getString("time") %></td>
				 				<td><%=rs.getString("reason") %></td>
				 				<td><a href="EmpLeaveUpdate.jsp?id=<%=id%>"><input  type="Button" class="btn edit" name="edit" value="EDIT" id="edit" ></a></td>
				 				<td><a href="EmpLeaveDelete.jsp?id=<%=id%>"><input  type="Button" class="btn delete" name="delete" value="DELETE" id="delete" ></a></td>
				 			
				 			
				 			</tr>
				 			
				 			
				 			
				 			<%
				 			
								}
				 			
				 			%>
				 		
				 	
				 	
				 	</table>
				 
				 
				 
				 </div>
			
			</div>
		
	
		
		 <div class="footer">
		   <div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	       </div>
        </div>		
   </body>
</html>
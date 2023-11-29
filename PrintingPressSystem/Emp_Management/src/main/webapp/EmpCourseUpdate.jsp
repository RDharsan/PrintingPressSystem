<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
    
       <%
   
       
    	if(request.getParameter("submit")!=null)
    	{
    	    String id = request.getParameter("id");
    		String name = request.getParameter("ename");
		    String type = request.getParameter("ctype");
    		String fee = request.getParameter("cfee");
    		String duration = request.getParameter("cduration");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("update courses set em_name =?, type =?, fee =?, duration =? where id =?");
    		
    		pst.setString(1,name);
    		pst.setString(2,type); 
    		pst.setString(3,fee);
    		pst.setString(4,duration);
    		pst.setString(5,id);
    		
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Employee Course Details was Successfully Updated!");
    		location.href = 'EmpCourseCreate.jsp';
    		
    		</script>	
    		
    		<%	
    	}
    
    %>
     
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>

<link href="log.jpg" rel ="icon" type= "image/icon">
<link href="Form.css" rel="stylesheet" type ="text/css">
	
	
</head>
<body>
<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
   <div class="sidebar1">
    <div class="img1-div"><img src="logo.png" alt="" class="img1"></div>
 
      <ul>
  	   <li><a href="EmpDetailsCreate.jsp"><img src="adduser.png" width="20" height="20"/><br>Add New Employee Details</a></li>
  	   <li><a href="EmpLeaveCreate.jsp"><img src="leave.png" width="20" height="20"/><br>Employee Leave Details</a></li>
  	   <li><a href="EmpSalaryCreate.jsp"><img src="salary.png" width="20" height="20"/><br>Employee Salary Details</a></li>
  	   <li><a href="EmpCourseCreate.jsp"><img src="course.png" width="20" height="20"/><br>Employee Course Details</a></li>
  	   <li><a href="../../LoginAndHome/Home.jsp"><img src="home.png" width="20" height="20"/><br>HOME</a></li>
    </ul>
   </div>
  </div>
	
	  <div class="row" >
        <div class="col-am-4" >
          <form class="card" method="post" action="#">
				  <h2 align="center">Update Employee Course Details</h2><br>
		
						
				<%
				  
						Connection con;
			    		PreparedStatement pst;
			    		ResultSet rs;
			    		
			    		Class.forName("com.mysql.jdbc.Driver");
			    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
						
			    		String id=request.getParameter("id"); 
						pst = con.prepareStatement("select * from courses where id= ?");
						pst.setString(1,id);
			    		rs = pst.executeQuery();
			    		
			    		while(rs.next())
			    			
			    		{
				
				%>
			  <div align="center">
                <label class="form-label">Course ID </label><br>
                <input type="text" class="form-control" placeholder="course ID" value="<%= rs.getString("id")%>" name="id" id="id" readonly required> 
             </div>                 
             <div align="center">
                <label class="form-label">Employee Name</label><br>
                <input type="text" class="form-control" placeholder="Employee name" readonly value="<%= rs.getString("em_name")%>" name="ename" id="ename" required> 
             </div>
             <div align="center"> 
                <label class="form-label">Course Type</label><br>
                <select class="form-select"  value="<%= rs.getString("type")%>"name="ctype" id="ctype">  		
             		<option>Select Course</option>
             		<option>Printing course</option>
             		<option>Customer Service Course</option>
             		<option>Health care Course</option>
             		<option>Leadership and Communication Course</option>
             		<option>Computer Skills Course</option>
             		<option> Business Course</option>
             		<option>Employee management course</option>
             		<option>Food Safety Course</option>
             		<option>ELearning Course</option>
             	</select>
             </div>
             <div align="center"> 
                <label class="form-label">Course Fee</label><br>
                <input type="Number" style="height:35px" class="form-control" value="Rs." placeholder="Course fee" min="0" value="<%= rs.getString("fee")%>" name="cfee" id="cfee" required> 
             </div><br><br>
             <div align="center" > 
                <label class="form-label">Course Duration</label><br>
                <input type="Number" min="0" style="height:35px"class="form-control" placeholder="Course duration" value="<%= rs.getString("duration")%>" name="cduration" id="cduration" required>
             </div><br><br>
					
				<%
				
				} 
				
				%>	
				
             <div align="center">
                <input class="btn save" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="btn reset"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br>
             <div align="center">
             <a href="EmpCourseRead.jsp"><input style="height:35px" type="Button" class="btn view"  name="reset" value="View Details" id="reset" ></a>
             </div><br><br>
          </form>
       </div>
		
			
		</div>
		
		<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
		
		
		

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*" %>
    
       <%
    	
    	if(request.getParameter("submit")!=null)
    	{
    	    
    		String id= request.getParameter("pid");
    		String name = request.getParameter("ename");
		 
		 
    		String basalary=request.getParameter("bsalary");
    		String nesalary=request.getParameter("nsalary");
    		String ovsalary=request.getParameter("osalary");
    		String lecharge=request.getParameter("lcharge");
    		String tosalary=request.getParameter("tsalary");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("update payslip set em_name =?,basic_salary =?,net_salary =?,overtime_salary =?,leaves_charge =?,total_salary =?  where id =?");
    		
            pst.setString(1,name);
    	
    		pst.setString(2,basalary);
    		pst.setString(3,nesalary);
    		pst.setString(4,ovsalary);
    		pst.setString(5,lecharge);	
    		pst.setString(6,tosalary);
    		pst.setString(7,id);
 	
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Employee Details was Successfully Updated!");
    		location.href = 'EmpSalaryCreate.jsp';
    		
    		</script>	
    		
    		<%	 
    	}
    
    %>
     
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NVP</title>

<link href="Form.css" rel="stylesheet" type="text/css">
<link href="log.jpg" rel ="icon" type= "image/icon">		
	
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
		<div  class="row">
		  <div class="col-sm-4">
				<form  method="POST" action="#">
				  <h2 align="center">Update Employee Details</h2><br>
				
				
				<%
				
						Connection con;
			    		PreparedStatement pst;
			    		ResultSet rs;
			    		
			    		Class.forName("com.mysql.jdbc.Driver");
			    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
						
			    		String name=request.getParameter("id"); 
						pst = con.prepareStatement("select * from payslip where id= ?");
						pst.setString(1,name);
			    		rs = pst.executeQuery();
			    		
			    		while(rs.next())
			    			
			    		{
			    			
			    			
			    		
				
				
				%>
				
				
				
				
				
            <div align="center">
                <label class="form-label">Salary ID</label><br> 
                <input type="text" class="form-control" placeholder="Enter Employee name" readonly value="<%= rs.getString("id")%>" name="pid" id="pid"  style="width:300px" required> 
             </div>
             <div align="center">
                <label class="form-label">Employee Name</label><br> 
                <input type="text" class="form-control" placeholder="Enter Employee name" value="<%= rs.getString("em_name")%>" name="ename" id="ename"  style="width:300px" required> 
             </div>
            
             <div align="center"> 
                <label class="form-label">Basic Salary</label><br>
                <input type="text" class="form-control" placeholder="Enter the basic salary" value="<%= rs.getString("basic_salary")%>" name="bsalary" id="bsalary" required> 
             </div>
             <div align="center"> 
                <label class="form-label">Net Salary</label><br>
                <input type="text" class="form-control" placeholder="Enter the net salary " value="<%= rs.getString("net_salary")%>" name="nsalary" id="nsalary" required> 
             </div>
             <div align="center"> 
                <label class="form-label">Overtime Salary</label><br>
                <input type="text" class="form-control" placeholder="Enter the overtime salary" value="<%= rs.getString("overtime_salary")%>" name="osalary" id="osalary" required> 
             </div>
             <div align="center"> 
                <label class="form-label">Leave Charge</label><br>
                <input type="text" class="form-control" placeholder="Enter the leaves charge" value="<%= rs.getString("leaves_charge")%>" name="lcharge" id="lcharge" required> 
             </div>      
             <div align="center" > 
                <label class="form-label">Total Salary</label><br>
                <input type="text" class="form-control" placeholder="Enter the total salary" value="<%= rs.getString("total_salary")%>" name="tsalary" id="tsalary" required>
             </div>
					
					
					<% }  %>
					
									
		   </br>
             <div align="center">
                <input class="save" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="reset"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br>
             <div align="center">
             <a href="EmpSalaryRead.jsp"><input  type="Button"  name="reset" value="View Details" id="reset" ></a>
             </div>
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
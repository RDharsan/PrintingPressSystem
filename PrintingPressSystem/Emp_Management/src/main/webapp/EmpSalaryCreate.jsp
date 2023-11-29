<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    
    <%
    	
          if(request.getParameter("submit")!=null)
	       {
	    
		      String id= request.getParameter("id");
		      String name = request.getParameter("ename");
	      
	        
		      String basalary=request.getParameter("bsalary");
	       	  String nesalary=request.getParameter("nsalary");
		      String ovsalary=request.getParameter("osalary");
		      String lecharge=request.getParameter("lcharge");
		      String total=request.getParameter("tsalary");
		      int tosalary=Integer.parseInt(total);
		    
		      
		
	       	  Connection con;
		      PreparedStatement pst;
		      ResultSet rs;
		
	     	  Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
              pst = con.prepareStatement("insert into payslip (em_name, basic_salary, net_salary, overtime_salary, leaves_charge, total_salary)values(?,?,?,?,?,?)");
		
              pst.setString(1,name);
		    
		  
	 	      pst.setString(2,basalary);
		      pst.setString(3,nesalary);
		      pst.setString(4,ovsalary);
		      pst.setString(5,lecharge);		      
		      pst.setInt(6,tosalary);
       		  pst.executeUpdate();
		
		%>
    		
    		<script>
    		
    		alert("Employee Details was Successfully added");
    		
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
<link class ="" href="log.jpg" rel ="icon" type= "image/icon">	

</head>
<body>
  <div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
   <div class="sidebar1">
    <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
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
            <h2 align="center">Add Employee Salary Details</h2><br>
             
             <div align="center">
                <label class="form-label">Employee Name</label><br>
                <select name="ename" id="ename" class="form-control" onchange="this.form.submit();" style="width:200px">
				 			<option value="0">Select Employee</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct em_name from employeedetails");
				 				while(rs.next()){
				 					%>
				 					<option value="<%=rs.getString("em_name") %>">
				 					     <%=rs.getString("em_name") %>
				 					</option>
				 					<% 
				 					}
				 			} catch(Exception e){
				 				e.printStackTrace();
				 			}
				 			%>
				 		</select><br>
            
             </div>
            
             <div align="center"> 
                <label class="form-label">Basic Salary</label><br>
                <input type="Number" min="0" class="form-control"  style="height:40px" name="bsalary" id="bsalary" required> 
             </div><br>
             <div align="center"> 
                <label class="form-label">Net Salary</label><br>
                <input  type="Number" min="0"  class="form-control" style="height:40px" name="nsalary" id="nsalary" required> 
             </div><br>
             <div align="center"> 
                <label class="form-label">Overtime Salary</label><br>
                <input  type="Number" min="0"   class="form-control" style="height:40px" name="osalary" id="osalary" required> 
             </div>        <br>     
             <div align="center" > 
                <label class="form-label">Leave charge</label><br>
                <input  type="Number" min="0"   class="form-control" style="height:40px" name="lcharge" id="lcharge" required> 
             </div><br>
             <div align="center" > 
                <label class="form-label">Total</label><br>
                <input  type="Number" min="0"   class="form-control" style="height:40px" name="tsalary" id="tsalary" required> 
             </div><br>
                        
            
             <div align="center">
                <input class="btn save" style="height:35px" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="btn reset" style="height:35px"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br>
             <div align="center">
             <a href="EmpSalaryRead.jsp"><input class="btn view" type="Button" style="height:35px"  name="reset" value="View Details" id="reset" ></a>
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
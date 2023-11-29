<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.*" %>
    
    
    <%
    	
    	if(request.getParameter("submit")!=null)
    	{  
    		String id=request.getParameter("id");
    		String name=request.getParameter("ename");
    		String email=request.getParameter("eemail");
    		String type=request.getParameter("etype");
    		String datef = request.getParameter("ldatef");
    		String datet = request.getParameter("ldatet");
	     	String time = request.getParameter("ltime");
    		String reason =request.getParameter("lreason");
    	   		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("update employee_leaves set em_name =?,le_type =?,date_from =?,date_to =?,time =?,reason =? where id =?");
    		
    		pst.setString(1,name);
    	    pst.setString(2,type);
            pst.setString(3,datef);
            pst.setString(4,datet);
    		pst.setString(5,time); 
    		pst.setString(6,reason);
    		pst.setString(7,id);
    		
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Employee Leave Details was Successfully added");
    		location.href = 'EmpLeaveCreate.jsp';
    		
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
    <div class="row" >
       <div class="col-am-4" >
          <form class="card" method="post" action="#">
            <h2 align="center"> Update Employee Leave Details</h2><br>
            
            
             
				<%
				
						Connection con;
			    		PreparedStatement pst;
			    		ResultSet rs;
			    		
			    		Class.forName("com.mysql.jdbc.Driver");
			    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
						
			    		String id=request.getParameter("id");
						pst = con.prepareStatement("select * from employee_leaves where id= ?");
						pst.setString(1,id);
			    		rs = pst.executeQuery();
			    		
			    		while(rs.next())
			    			
			    		{
			    			
			    						    				
				
				%>
				
            <div align="center">
                <label class="form-label">Leave ID</label><br>
                <input type="text" class="form-control" placeholder="Leave ID" readonly  value="<%= rs.getString("id")%>" name="id" id="id" required> 
             </div>
            <div align="center">
                <label class="form-label">Employee Name</label><br>
                <input type="text" class="form-control" placeholder="Employee Name"  value="<%= rs.getString("em_name")%>" name="ename" id="ename" required> 
             </div>
           
             <div align="center">
                <label class="form-label">Leave Type</label><br>
                <input type="text" class="form-control" placeholder="Leave Type" value="<%= rs.getString("le_type")%>" name="etype" id="etype" required> 
             </div>
             <div align="center"> 
                <label class="form-label">Date</label><br>
                <input type="date" class="form-control" placeholder="DD/MM/YYYY"  value="<%= rs.getString("date_from")%>" name="ldatef" id="ldatef" required> 
                <input type="date" class="form-control" placeholder="DD/MM/YYYY"  value="<%= rs.getString("date_to")%>" name="ldatet" id="ldatet" required> 
             </div>
             <div align="center">
                <label class="form-label">Time</label><br>
                <input type="time" class="form-control"  placeholder="HH:MM" value="<%= rs.getString("time")%>" name="ltime" id="ltime" required> 
             </div>
             <div align="center"> 
                <label class="form-label">Reason</label><br>
                <input type="text" class="form-control"  placeholder="Reason or the leave" value="<%= rs.getString("reason")%>" name="lreason" id="lreason" required>
             </div>
             
                <%  }  %>
             
             
             <div align="center">
                <input class="btn save" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="btn reset"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br>
             <div align="center">
               <a href="EmpLeaveRead.jsp"><input type="Button" class="btn view" value="View Details"></a>
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
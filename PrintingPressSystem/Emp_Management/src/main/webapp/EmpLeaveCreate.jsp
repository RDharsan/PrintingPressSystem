<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    
    <%
    	
    	if(request.getParameter("submit")!=null)
    	{
    		String id= request.getParameter("lid");
    		String name= request.getParameter("ename");
	     	String  email= request.getParameter("eemail");
	     	String  type= request.getParameter("ltype");
	     	String  datef= request.getParameter("ldatef");
	     	String  datet= request.getParameter("ldatet");
	     	String  time= request.getParameter("ltime");
	     	String  reason= request.getParameter("lreason");
		    
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("insert into employee_leaves (em_name,le_type,date_from,date_to,time,reason)values(?,?,?,?,?,?)");
    		
            pst.setString(1,name); 
    		pst.setString(2,type);
    		pst.setString(3,datef);
    		pst.setString(4,datet);
    		pst.setString(5,time);
    		pst.setString(6,reason);
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
<link href="log.jpg" rel ="icon" type= "image/icon">	

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
            <h2 align="center">Employee Leave Details</h2><br>
             
             <div align="center">
                <label class="form-label">Employee Name</label><br>
                 <select name="ename" id="ename" class="form-control"  onchange="this.form.submit();">
				 			<option value="0">Select Employee</option>
				 			
				 			<%
				 			try {
				 				Connection con;
				 				Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
				 				Statement stm = con.createStatement();
				 				ResultSet rs = stm.executeQuery("select distinct id,em_name, em_email from employeedetails");
				 				while(rs.next()){
				 					%>
				 					<option name="name"value="<%=rs.getString("em_name") %>">
				 						 <%=rs.getString("id") %> |  <%=rs.getString("em_name") %> | <%=rs.getString("em_email") %>
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
                <label class="form-label">Leave Type</label><br>
                <select class="form-control" name="ltype" id="ltype" required>
                   <option value="#">Select leave Type</option>
                   <option value="Casual leave">Casual leave</option>
                   <option value="Medical leave">Medical leave</option>
                   <option value="Bereavement leave">Bereavement leave</option>
                   <option value="Paternity leave">Paternity leave</option>
                   <option value="personal or special leave">personal or special leave</option>
               </select>  
             </div>
             <div align="center">  
                <label class="form-label">Date</label><br>
                <input style="height:35px" type="date" class="form-control" placeholder="DD/MM/YYYY" name="ldatef" id="ldatef" required> to 
                <input type="date" style="height:35px" class="form-control" placeholder="DD/MM/YYYY" name="ldatet" id="ldatet" required> 
             </div><br>
             <div align="center"> 
                <label class="form-label">Time</label><br>
                <input type="time" style="height:35px" class="form-control" placeholder="HH:MM" name="ltime" id="ltime" required> 
             </div>      <br>
             <div align="center"> 
                <label class="form-label">Reason</label><br>
                <textarea class="form-control" placeholder="Reason for the leave" name="lreason" id="lreason" required></textarea>
             </div>  <br>
                       
             <div align="center">
                <input class="btn save" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="btn reset"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br><br>
             <div align="center">
             <a href="EmpLeaveRead.jsp"><input style="height:35px" class="btn view" type="button"  name="view" value="View Details" id="view" ></a>
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
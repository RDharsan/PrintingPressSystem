<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
    
    
    <%
    	
      if(request.getParameter("submit")!=null)
    	{
    		
	     	String name = request.getParameter("ename");
		    String type = request.getParameter("ctype");
    		String fee = request.getParameter("cfee");
    		String duration = request.getParameter("cduration");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("insert into courses(em_name,type,fee,duration)values(?,?,?,?)");
    		
            pst.setString(1,name); 
    		pst.setString(2,type); 
    		pst.setString(3,fee); 
    		pst.setString(4,duration);
    		
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Employee Course Details was Successfully added");
    		
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
            <h2 align="center">Add Employee Course Details</h2><br>

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
             <div align="center"> 
              <label class="form-label">Course Type</label><br>
               <select class="form-select" name="ctype" id="ctype">  		
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
               
             </div>   <br>
             </div>
             <div align="center"> 
                <label class="form-label">Course Fee</label><br>
                <input type="Number" style="height:35px" class="form-control" value="Rs." min="0" placeholder="Course fee " name="cfee" id="cfee" required> 
             </div><br><br>
             <div align="center" > 
                <label class="form-label">Course Duration</label><br>
                <input type=Number class="form-control" style="height:35px" placeholder="Course Duration" min="0"  name="cduration" id="cduration" required> 
             </div><br><br>
             <div align="center">
                <input class="btn save" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="btn reset"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br>
             <div align="center">
                <a href="EmpCourseRead.jsp"><input style="height:35px" class="btn view" type="button"  name="view" value="View Details" id="view" ></a>
             </div><br>
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
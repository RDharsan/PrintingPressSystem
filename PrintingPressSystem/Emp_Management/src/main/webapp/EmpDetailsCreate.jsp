<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
    
    
    <%
    	
    	if(request.getParameter("submit")!=null)
    	{
    	
    		String name = request.getParameter("name");
	     	String nic = request.getParameter("nic");
		    String email = request.getParameter("email");
    		String age=request.getParameter("age");
    	    String address=request.getParameter("address");;
    		String phone=request.getParameter("phone");
    		String type=request.getParameter("type");
    		String gender=request.getParameter("gender");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("insert into employeedetails(em_name,em_nic,em_email,em_age,em_address,em_phone,em_type,gender)values(?,?,?,?,?,?,?,?)");
    		
            pst.setString(1,name);
    		pst.setString(2,nic); 
    		pst.setString(3,email);
    		pst.setString(4,age);
    		pst.setString(5,address);
    		pst.setString(6,phone);
    		pst.setString(7,type); 		
    		pst.setString(8,gender);
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

<link href="log.jpg" rel ="icon" type= "image/icon">
<link href="Form.css" rel="stylesheet" text="text/css">

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
            <h2 align="center">Register New Employee</h2><br>
             
            
             <div align="center">
                <label class="form-label">Employee Name</label><br>
                <input type="text" class="form-control" placeholder="Employee name" name="name" id="name" required> 
             </div><br>
             <div align="center">
                <label class="form-label">Employee NIC</label><br>
                <input type="text" class="form-control" placeholder="Employee nic" pattern='^(?:19|20)?\d{2}(?:[0-35-8]\d\d(?<!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[vVxX0-9])$' title='Please enter valid NIC ' name="nic" id="nic" required> 
             </div><br>
             <div align="center">
                <label class="form-label">Employee Email Address</label><br><br>
                <input type="email" style="height:35px" class="form-control" placeholder="Employee emailaddress " pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'   title='Please enter valid email address!!'name="email" id="email" required> 
             </div><br><br>
             <div align="center"> 
                <label class="form-label">Employee Age</label><br><br>
                <input type="Number" style="height:35px"  class="form-control" placeholder="Employee Age " min="0" max="100" name="age" id="age" required> 
             </div><br><br>
             <div align="center"> 
                <label class="form-label">Current Address</label><br>
                <input type="text" class="form-control" placeholder="home address " name="address" id="address" required> 
             </div>  <br>
             <div align="center"> 
                <label class="form-label">Employee Phone</label><br><br>
                <input type="tel" class="form-control" style="height:35px"  placeholder="Employee phone_no" name="phone" id="phone" pattern="[0-9]{10}" required> 
             </div><br><br>
             <div align="center">
              <label class="form-label">Employee Type</label><br>
             <select class="form-select" name="type" id="type">
             		<option>Select employee Type</option>
             		<option>Designer</option>
             		<option>Printer</option>
             		<option>Cash manager</option>
             		<option>Client manager</option>
             		<option>Delivery manager</option>
             		<option>Asset manager</option>
             		<option>Feedback handler</option>
             		<option>Employee manager</option>
             		<option>Employee staffs</option>
             	</select>
               
               
             </div>   <br>  
             <div align="center"> 
              <label class="form-label">Gender</label><br>
             	<select class="form-select" name="gender" id="gender">
             		<option>select gender</option>
             		<option>Male</option>		
             		<option>Female</option>
             	</select>
          
             </div><br><br>
             <div align="center">
                <input class="btn save" type="submit"  name="submit" value="Save" id="submit" >
                <input class="btn reset"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br><br>
             <div align="center">
             <a href="EmpDetailsRead.jsp"><input style="height:35px"  class="btn view" type="Button"  name="reset" value="View Details" id="reset" ></a>
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
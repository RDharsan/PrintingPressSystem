<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
    
       <%
    	
    	if(request.getParameter("submit")!=null)
    	{
    		String id= request.getParameter("eid");
    		String name = request.getParameter("name");
		    String nic = request.getParameter("nic");
		    String email = request.getParameter("email");
    		String age=request.getParameter("age");
    		String phone=request.getParameter("phone");
    		String type=request.getParameter("type");
    		String address=request.getParameter("address");
    		String gender=request.getParameter("gender");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
    		pst = con.prepareStatement("update employeedetails set em_name =?,em_nic =?,em_email =?,em_age =?,em_address =?,em_phone =?,em_type=?,gender =? where id =?");
    		
            pst.setString(1,name);
    		pst.setString(2,nic);
    		pst.setString(3,email);
    		pst.setString(4,age);
    		pst.setString(5,address);
    		pst.setString(6,phone);
    		pst.setString(7,type);
    		pst.setString(8,gender);
    		pst.setString(9,id);
    		
    	
    		
    		
    		pst.executeUpdate();
    		
    		%>
    		
    		<script>
    		
    		alert("Employee Details was Successfully Updated!");
    		location.href = 'EmpDetailsCreate.jsp';
    		
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
  	   <li><a href="EmpDetailsCreate.jsp"><img src="adduser.png" width="20" height="20"/><br>New Employee Details</a></li>
  	   <li><a href="EmpLeaveCreate.jsp"><img src="leave.png" width="20" height="20"/><br>Employee Leave Details</a></li>
  	   <li><a href="EmpSalaryCreate.jsp"><img src="salary.png" width="20" height="20"/><br>Employee Salary Details</a></li>
  	   <li><a href="EmpCourseCreate.jsp"><img src="course.png" width="20" height="20"/><br>Employee Course Details</a></li>
  	   <li><a href="../../LoginAndHome/Home.jsp"><img src="home.png" width="20" height="20"/><br>HOME</a></li>
    </ul>
   </div>
  </div>
		<div  class="row">
		  <div class="col-am-4">
				<form class="card" method="POST" action="#">
				  <h2 align="center">Update Employee Details</h2><br>
				
				
				<%
				
						Connection con;
			    		PreparedStatement pst;
			    		ResultSet rs;
			    		
			    		Class.forName("com.mysql.jdbc.Driver");
			    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
						
			    		String id=request.getParameter("id"); 
						pst = con.prepareStatement("select * from employeedetails where id= ?");
						pst.setString(1,id);
			    		rs = pst.executeQuery();
			    		
			    		while(rs.next())
			    			
			    		{
			    		
			    			
				%>
				
			
			<div align="center">
                <label class="form-label">Employee Id</label><br>
                <input type="text" class="form-control" placeholder="Employee Id" value="<%= rs.getString("id")%>" name="eid" id="eid" readonly required> 
             </div><br>	     
             <div align="center">
                <label class="form-label">Employee Name</label><br>
                <input type="text" class="form-control" placeholder="Employee name" value="<%= rs.getString("em_name")%>" name="name" id="name" required> 
             </div><br>
             <div align="center">
                <label class="form-label">Employee NIC</label><br>
                <input type="text" class="form-control" placeholder="Employee nic"  pattern='^(?:19|20)?\d{2}(?:[0-35-8]\d\d(?<!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[vVxX0-9])$' title='Please enter valid NIC ' value="<%= rs.getString("em_nic")%>" name="nic" id="nic" required> 
             </div><br>
             <div align="center"> 
                <label class="form-label">Employee Email Address</label><br>
                <input type="email" style="height:35px" class="form-control" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'   title='Please enter valid email address!!' placeholder="Employee emailaddress " value="<%= rs.getString("em_email")%>" name="email" id="email" required> 
             </div><br>
             <div align="center"> 
                <label class="form-label">Employee Age</label><br>
                <input type="Number" min="0" max="100" style="height:35px" class="form-control" placeholder="Employee Age " value="<%= rs.getString("em_age")%>" name="age" id="age" required> 
             </div>    <br>         
             <div align="center"> 
                <label class="form-label">Current Address</label><br>
                <input type="text" class="form-control" placeholder="home address " value="<%= rs.getString("em_address")%>" name="address" id="address" required> 
             </div> <br>
             <div align="center"> 
                <label class="form-label">Employee Phone</label><br>
                <input type="tel" style="height:35px" class="form-control" pattern="[0-9]{10}" placeholder="Employee phone_No " value="<%= rs.getString("em_phone")%>" name="phone" id="phone" required> 
             </div><br>
             
             <div align="center" > 
               <label class="form-label">Employee Type</label><br>
             <select style="width:35%" class="form-select" name="type" id="type">
             		<option>selected: <%= rs.getString("em_type")%> </option>
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
               
               </div><br>
                <div align="center"> 
              <label class="form-label">Gender</label><br>
             	<select class="form-select" name="gender" id="gender" value="<%= rs.getString("gender")%>" >
             		<option ><%= rs.getString("gender")%></option>
             		
             		<option>Male</option>		
             		<option>Female</option>
             	</select>
          
             </div><br>
					
					
					<% }  %>
					
					
					
					
					
					
				</br>
             <div align="center">
                <input class="btn save"  style="height:35px" type="submit"  name="submit" value="Save" id="submit" > 
                <input class="btn reset" style="height:35px"  type="reset"  name="reset" value="reset" id="reset" > 
             </div><br>
             <div align="center">
               <a href="EmpDetailsRead.jsp"><input style="height:35px" class="btn view" type="Button"  name="reset" value="View Details" id="reset" ></a>
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
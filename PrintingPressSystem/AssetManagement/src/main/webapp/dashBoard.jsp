<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesjeet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
<title>NVP</title>
<link rel="shortcut icon" href="log.jpg">

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" text="text/css">

</head>
<body>
 <div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="log.jpg" alt="" class="img1"></div>
 
  <ul>
  <li><a href="#" active>Dash Board</a></li>
  	<li><a href="fixedassetsInsert.jsp" active>Add Fixed Asset</a></li>
  	<li><a href="paperMaterial.jsp" active>Add paper material</a></li>
  	<li><a href="liquidInsert.jsp" active>Add liquid material</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>
 
 <br> <br> <br> <br>

<br> 


 <div class="col-sm-8" style="margin-left:18%">
 <br> <br> <br>
		 <h1 style="color:red">Low Inventory Items</h1>
		 <br>
		 <h5>Liquid Material</h5>
		
                 <div class="panel-body" style="margin-top:5%">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Purchase Date</th>
                                    <th>Expire Date</th>
                                    <th>Colour</th>
                                    <th>Cost</th>
                                    <th>Purchased Volume</th>
                                    <th>Available Volume</th>
                                    <th>Payable</th>
                                    <th>Payment Method</th>
                                    <th>Purchased shop</th>
                                    
                             </tr>  
                            
                             <%  
                             Connection con;
                             PreparedStatement pst;
                             ResultSet rs;
 
                             
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
                                String query2 = "SELECT * FROM inventory_liquid_material where ava_volume<500";
                                Statement str = con.createStatement();
                          		rs =  str.executeQuery(query2);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td><%=rs.getString("id") %></td>
                                 <td><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("pur_date") %></td>
                                 <td><%=rs.getString("ex_date") %></td>
                                 <td><%=rs.getString("colour") %></td>
                                 <td><%=rs.getString("cost") %></td>
                                 <td><%=rs.getString("pur_volume") %></td>
                                 <td><%=rs.getString("ava_volume") %></td>
                                 <td><%=rs.getString("payable") %></td>
                                 <td><%=rs.getString("payment_method") %></td>
                                 <td><%=rs.getString("pur_shop") %></td>
                                 
						
                             </tr>
                            
                            
                                <%
                                
                                 }
                               %>
                            
                     </table>    
                 </div>
 
            </div>  
        </div>
 
 
 
  <div class="col-sm-8" style="margin-left:18%">
  
   <br>
		 <h5>Paper Material</h5>
                 <div class="panel-body" style="margin-top:5%">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Purchase Date</th>
                                    <th>Expire Date</th>
                                    <th>Purchase shop</th>
                                    <th>Size</th>
                                    <th>Cost</th>
                                    <th>Purchase Amount</th>
                                    <th>Ava Amount</th>
                                    <th>Payable</th>
                                    <th>Payment method</th>
                                    <th>Colour</th>
                             </tr>  
                            
                             <%  
 
                               
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
                                String query = "select * from inventory_paper_material where ava_amount<100";
                                Statement st = con.createStatement();
                          		rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td><%=rs.getString("id") %></td>
                                 <td><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("pur_date") %></td>
                                 <td><%=rs.getString("ex_date") %></td>
                                 <td><%=rs.getString("pur_shop") %></td>
                                 <td><%=rs.getString("size") %></td>
                                 <td><%=rs.getString("cost") %></td>
                                 <td><%=rs.getString("pur_amount") %></td>
                                 <td><%=rs.getString("ava_amount") %></td>
                                 <td><%=rs.getString("payable") %></td>
                                 <td><%=rs.getString("payment_method") %></td>
                                 <td><%=rs.getString("colour") %></td>
                                 
                             </tr>
                            
                            
                                <%
                                
                                 }
                               %>
                            
                     </table>   
                     <br> <br>
                 </div>
 
            </div>  
        </div>
 

<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
       
        String name = request.getParameter("sname");
        String pur_date = request.getParameter("pur_date");
        String ex_date = request.getParameter("ex_date");
        String colour = request.getParameter("colour");
        String cost = request.getParameter("cost");
        String pur_volume = request.getParameter("pur_volume");
        String ava_volume = request.getParameter("ava_volume");
        String payable = request.getParameter("payable");
        String payment_method = request.getParameter("payment_method");
        String pur_shop = request.getParameter("pur_shop");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
        pst = con.prepareStatement("insert into inventory_liquid_material (name,pur_date,ex_date,colour,cost,pur_volume,ava_volume,payable,payment_method,pur_shop) values (?,?,?,?,?,?,?,?,?,?)");
      
        pst.setString(1, name);
        pst.setString(2, pur_date);
        pst.setString(3, ex_date);
        pst.setString(4, colour);
        pst.setString(5, cost);
        pst.setString(6, pur_volume);
        pst.setString(7, ava_volume);
        pst.setString(8, payable);
        pst.setString(9, payment_method);
        pst.setString(10, pur_shop);
        
        pst.executeUpdate();  
        
        %>
    <script>  
        alert("Record Added");    
    </script>
    <%            
    }
   %>
 
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NVP</title>
<link rel="shortcut icon" href="log.jpg">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
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
 <li><a href="dashBoard.jsp" active>Dash Board</a></li>
  	<li><a href="fixedassetsInsert.jsp" active>Add Fixed Asset</a></li>
  	<li><a href="paperMaterial.jsp">Add paper material</a></li>
  	<li><a href="liquidInsert.jsp" active>Add liquid material</a></li>
    <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li>
  </ul>
 </div>

    
 </div>
        </br>
        <div class="row">
            <div class="col-sm-4"  style="margin-left:38%; margin-top:10%">
                <form  method="POST" action="#" >
              
                <h2>Liquid material</h2>
                    
                    <div alight="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="Enter material name" name="sname" id="sname" style="width:300px" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">Purchased Date</label>
                        <input type="Date" class="form-control" name="pur_date"  id="pur_date" style="width:300px" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">Expired Date</label>
                        <input type="Date" class="form-control" name="ex_date" id="ex_date" style="width:300px" required >
                     </div><br>
                     
                      <div alight="left">
                        <label class="form-label">Colour</label>
                        <input type="Text" class="form-control" placeholder="Enter colour"  name="colour" id="colour" style="width:300px" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">Cost</label>
                        <input type="text" class="form-control" placeholder="Ex: 10000.00"  name="cost" pattern="[0-9]{4,}.[0]{2}"   id="cost" style="width:300px" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">Purchased Volume</label>
                        <input type="text" class="form-control" name="pur_volume" placeholder="Ex: 1000" id="pur_volume" pattern="[0-9]{4,}" style="width:300px" required >
                     </div><br>
                     
                      <div alight="left">
                        <label class="form-label">Available Volume</label>
                        <input type="text" class="form-control"  name="ava_volume"  placeholder="Ex: 500" id="ava_volume" pattern="[0-9]{2,}" style="width:300px" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">Payable</label>
                        <input type="text" class="form-control"  name="payable" placeholder="1000.00" pattern="[0-9]{4,}.[0]{2}" id="payable" style="width:300px" required >
                     </div><br>
                        
                        <div align="left">
					<label class="form-label">Payment method
					<select name="payment_method" type="text" style="width:300px"
						class="form-control" 
						name="payment_method" id="payment_method" >
					<option value="Card payment">Card payment</option>
					<option value="Cash payment">Cash payment</option>
					</select>
					
					</label> 
				</div><br>
                    
                        
                     <div alight="left">
                        <label class="form-label">Purchased shop</label>
                        <input type="text" class="form-control" name="pur_shop" placeholder="Enter shop name" style="width:300px" id="pur_shop"  required >
                     </div><br><br>
                        <div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info"  style="background-color:#006478; color:white" />
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-info" style="background-color:#006478; color:white;">
					
				</div>
				
				<br>
                </form>
            </div>
            
             <div class="col-sm-8" style="margin-left:18%">
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
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  <br>
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
                                String query = "select * from inventory_liquid_material";
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
                                 <td><%=rs.getString("colour") %></td>
                                 <td><%=rs.getString("cost") %></td>
                                 <td><%=rs.getString("pur_volume") %></td>
                                 <td><%=rs.getString("ava_volume") %></td>
                                 <td><%=rs.getString("payable") %></td>
                                 <td><%=rs.getString("payment_method") %></td>
                                 <td><%=rs.getString("pur_shop") %></td>
                                 <td><button class="button btn"><a href="liquidUpdate.jsp?id=<%=id%>"><i class="fa fa-pencil" style="color:black"></i></button></a></td>
							<td><button class="button btn"><a href="liquidDelete.jsp?id=<%=id%>"><i class="fa fa-trash" style="color:black"></i></button></td>
						
                             </tr><br>
                            
                            
                                <%
                                
                                 }
                               %>
                            
                     </table>    
                     <br><br>
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
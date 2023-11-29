<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
       
        String name = request.getParameter("sname");
        String pur_date = request.getParameter("pur_date");
        String ex_date = request.getParameter("ex_date");
        String pur_shop = request.getParameter("pur_shop");
        String size = request.getParameter("size");
        String cost = request.getParameter("cost");
        String pur_amount = request.getParameter("pur_amount");
        String ava_amount = request.getParameter("ava_amount");
        String payable = request.getParameter("payable");
        String payment_method = request.getParameter("payment_method");
        String colour = request.getParameter("colour");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
        pst = con.prepareStatement("insert into inventory_paper_material (name,pur_date,ex_date,pur_shop,size,cost,pur_amount,ava_amount,payable,payment_method,colour) values (?,?,?,?,?,?,?,?,?,?,?)");
      
        pst.setString(1, name);
        pst.setString(2, pur_date);
        pst.setString(3, ex_date);
        pst.setString(4, pur_shop);
        pst.setString(5, size);
        pst.setString(6, cost);
        pst.setString(7, pur_amount);
        pst.setString(8, ava_amount);
        pst.setString(9, payable);
        pst.setString(10, payment_method);
        pst.setString(11, colour);
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
                
                 <h2> Paper material</h2>
                    
                    
	<div alight="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control"  name="sname"  id="sname" style="width:300px" placeholder="Enter paper name" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">Purchased date</label>
                        <input type="Date" class="form-control"  name="pur_date"  id="pur_date" style="width:300px"  required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">Expire date</label>
                        <input type="Date" class="form-control" name="ex_date" id="ex_date" style="width:300px" required >
                     </div><br>
                     
                      <div alight="left">
                        <label class="form-label">Purchased shop</label>
                        <input type="Text" class="form-control"  name="pur_shop" id="pur_shop" style="width:300px" placeholder="Enter shop name " required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">Size</label>
                        <input type="text" class="form-control"  name="size"   id="course" pattern="[0-9]{2,} x [0-9]{2,}" style="width:300px" placeholder="Ex: 40 x 100" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">Cost</label>
                        <input type="text" class="form-control" name="cost" pattern="[0-9]{4,}.[0]{2}"   id="fee" style="width:300px" placeholder="Ex: 6000.00" required >
                     </div><br>
                     
                      <div alight="left">
                        <label class="form-label">Purchased amount</label>
                        <input type="text" class="form-control"  name="pur_amount" pattern="[0-9]{2,}"  id="sname" style="width:300px" placeholder="Ex: 1000"required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">Available amount</label>
                        <input type="text" class="form-control"  name="ava_amount" pattern="[0-9]{2,}"   id="ava_amount" placeholder="Ex: 500" style="width:300px" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">Payable</label>
                        <input type="text" class="form-control" name="payable"pattern="[0-9]{4,}.[0]{2}"  id="payable" style="width:300px" required placeholder="Ex: 1000.00" >
                     </div><br>
                     
                     
                     <div align="left">
					<label class="form-label">Payment method
					<select name="payment_method" type="text" style="width:300px"
						class="form-control" 
						name="payment_method" id="payment_method" required pattern="[1-9]">
					<option value="Card payment">Card payment</option>
					<option value="Cash payment">Cash payment</option>
					</select>
					
					</label> 
				</div><br>
                    
                             
                    
                        
                     <div alight="left">
                        <label class="form-label">Colour</label>
                        <input type="text" class="form-control" name="colour" style="width:300px" id="payable"  required placeholder="Enter paper colour" >
                     </div><br><br>
                        <div align=center>
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info"  style="background-color:#006478; color:white" />
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-info" style="background-color:#006478; color:white;">
					
				</div>
				
				<br>
                     
                     
                   
				
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
                                    <th>Purchase shop</th>
                                    <th>Size</th>
                                    <th>Cost</th>
                                    <th>Purchase Amount</th>
                                    <th>Ava Amount</th>
                                    <th>Payable</th>
                                    <th>Payment method</th>
                                    <th>Colour</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
                                String query = "select * from inventory_paper_material";
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
                                 <td><button class="button btn"><a href="paperUpdate.jsp?id=<%=id%>"><i class="fa fa-pencil" style="color:black"></i></button></a></td>
							<td><button class="button btn"><a href="paperDelete.jsp?id=<%=id%>"><i class="fa fa-trash" style="color:black"></i></button></td>
						
                             </tr>
                            
                            
                                <%
                                
                                 }
                               %>
                            
                     </table>    
                 </div>
 
            </div>  
        </div>
        <br><br>
 
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
    </body>
</html>
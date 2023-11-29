<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
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
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters", "root", "dharsanravi.33");
        pst = con.prepareStatement("update inventory_paper_material set name =?,pur_date= ?,ex_date = ?,pur_shop =?,size= ?,cost = ?,pur_amount =?,ava_amount= ?,payable = ?,payment_method =?,colour= ? where id = ?");
      
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
        pst.setString(12, id);
        pst.executeUpdate();  
        
        %>
        
        <script>  
            alert("Record Updated");          
            location.href = 'paperMaterial.jsp';
       </script>
    <%            
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
       <meta charset="ISO-8859-1">
	  	<link rel="stylesjeet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
		<title>NVP</title>
		<link rel="shortcut icon" href="log.jpg">
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
 
        <div class="row">
            <div class="col-sm-4" style="margin-left: 38%; margin-top: 10%">
                <form  method="POST" action="#" >
                    
                    <%    
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost/newveenaprinters","root","dharsanravi.33");
                         String id = request.getParameter("id");  
                         pst = con.prepareStatement("select * from inventory_paper_material where id = ?");
                         pst.setString(1, id);
                         rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" value="<%= rs.getString("name")%>" name="sname" id="sname" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">purchased date</label>
                        <input type="Date" class="form-control"  name="pur_date" value="<%= rs.getString("pur_date")%>" id="pur_date" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">expired date</label>
                        <input type="Date" class="form-control" name="ex_date" id="ex_date" value="<%= rs.getString("ex_date")%>" required >
                     </div><br>
                     
                      <div alight="left">
                        <label class="form-label">purchased shop</label>
                        <input type="text" class="form-control" value="<%= rs.getString("pur_shop")%>" name="pur_shop" id="pur_shop" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">size</label>
                        <input type="text" class="form-control"  name="size" value="<%= rs.getString("size")%>" pattern="[0-9]{2,} x [0-9]{2,}"  title="enter valid size" id="course" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">cost</label>
                        <input type="text" class="form-control" name="cost" id="fee"  title="Enter valid cost!" pattern="[0-9]{4,}.[0]{2}" value="<%= rs.getString("cost")%>" required >
                     </div><br>
                     
                      <div alight="left">
                        <label class="form-label">purchased amount</label>
                        <input type="text" class="form-control" value="<%= rs.getString("pur_amount")%>" pattern="[0-9]{2,}" title="Enter valid amount!" name="pur_amount" id="sname" required >
                     </div><br>
                        
                    <div alight="left">
                        <label class="form-label">available amount</label>
                        <input type="text" class="form-control"  name="ava_amount" value="<%= rs.getString("ava_amount")%>" pattern="[0-9]{2,}" title="Enter valid amount!"  id="ava_amount" required >
                     </div><br>
                        
                     <div alight="left">
                        <label class="form-label">payable</label>
                        <input type="text" class="form-control" name="payable" id="payable" value="<%= rs.getString("payable")%>"  pattern="[0-9]{2,}.[0]{2}" title="Enter valid payable amount!" required >
                     </div><br>
                     
                     <div alight="left">
                       <label class="form-label">Payment method
					<select name="payment_method" type="text" style="width:300px"
						class="form-control" placeholder="Enter Customer nic"
						name="payment_method" id="payment_method" required pattern="[1-9]">
					<option value="Card payment">Card payment</option>
					<option value="Cash payment">Cash payment</option>
					</select>
					
					</label> 
                        </div><br>
                        
                     <div alight="left">
                        <label class="form-label">colour</label>
                        <input type="text" class="form-control" name="colour" id="payable" value="<%= rs.getString("colour")%>" required >
                     </div><br>
                     
                    
                    <%
                    }
                    
                    %>
                    
                   
				<div align=center>
					<input type="submit" id="submit" value="Submit" name="submit"
						class="btn btn-info"
						style="background-color: #006478; color: white" /> <input
						type="reset" id="reset" value="Reset" name="reset"
						class="btn btn-info"
						style="background-color: #006478; color: white;">

				</div>
		
		<div align="left">
					<p>
						
						<a href="paperMaterial.jsp"><input type="button" id="submit" value="Back" name="submit" style="margin-top:-15%";
						class="btn btn-info"></a>
					</p>

				</div>
				<br>
			</form>
		</div>
	</div>

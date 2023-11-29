<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "newveenaprinters";
String userid = "root";
String password = "dharsanravi.33";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from returnp where pID="+pID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">

//Header and Navigation

<meta charset="ISO-8859-1">
<title>Return Product</title>
</head>
<body>

<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="img/img.jpeg" alt="" class="img1"></div>
 
  	<li><a href="ReturnProductCreate.jsp">Add Return Product</a></li>
  	<li><a href="ReturnProductView.jsp">Return Product details</a></li>
  	<li><a href="ProductReport.jsp">Return Product Report</a></li>
  <li><a href="Feedback.jsp">Feedback details</a></li>
   <li><a href="../../LoginAndHome/Home.jsp">HOME</a></li><br>
  </ul>
 </div>

    
 </div>
<br>
<br>
<h2>Return Product</h2>



<div class="container">
  <form action="ReturnProductUpdateProcess.jsp" method="post">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">ID</label>
    </div>
    <div class="col-65">
      <input type="text"  name="pID" readonly id="pID" value="<%=resultSet.getInt("pID") %>" >
    </div>
  </div>
    <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product No</label>
    </div>
    <div class="col-65">
      <input type="text" id="pNo" name="pNo" value="<%=resultSet.getString("pNo") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product Type</label>
    </div>
    <div class="col-65">
      <input type="text" id="pType" name="pType" value="<%=resultSet.getString("pType") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product QTY</label>
    </div>
    <div class="col-65">
      <input type="number" id="pQty" name="pQty" value="<%=resultSet.getString("pQty") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Received Date</label>
    </div>
    <div class="col-65">
      <input type="date" id="pDate" name="pDate" value="<%=resultSet.getString("pDate") %>">
    </div>
  </div>

  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Reason for Return</label>
    </div>
    <div class="col-65">
      <select id="pReason" name="pReason" value="<%=resultSet.getString("pReason") %>">
        <option value="Product damaged">Product damaged</option>
        <option value="No ordered quantity">No ordered quantity</option>
        <option value="Receive different product">Receive different product</option>
        <option value="Other">Other</option>
      </select>
    </div>
  </div>
  <br>
  
    <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">No of Returning Product</label>
    </div>
    <div class="col-65">
      <input type="number" id="pReturn" name="pReturn" value="<%=resultSet.getString("pReturn") %>">
    </div>
  </div>
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>   
</div>

//footer
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>
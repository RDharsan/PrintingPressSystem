<%@page import="java.sql.*" %>
 
 
<%
        String re_fid = request.getParameter("re_fid");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
        pst = con.prepareStatement("delete from repair_fixedasset where re_fid = ?");
        pst.setString(1, re_fid);
        pst.executeUpdate();  
        
        %>
        
        <script>
            
            alert("Record Deleted");
            location.href = 'repairedAssetsInsert.jsp';
       </script>
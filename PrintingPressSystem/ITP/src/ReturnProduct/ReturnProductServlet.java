package ReturnProduct;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ReturnProduct.Database;



@WebServlet("/ReturnProductServlet") 
public class ReturnProductServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
		
		

		String pNo = request.getParameter("pNo");
		
		String pType = request.getParameter("pType");
		
		String pQty = request.getParameter("pQty");
		
		String pDate = request.getParameter("pDate");
		
		String pReason = request.getParameter("pReason");
		
		String pReturn = request.getParameter("pReturn");
		
		
		
		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into returnp(pNo,pType,pQty,pDate,pReason,pReturn) values(?,?,?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/newveenaprinters","root","dharsanravi.33");
			    PreparedStatement st = conn.prepareStatement(sql);
			   
			
			   
			    st.setString(1, pNo);
			    
			    st.setString(2, pType);
			    
			    st.setString(3, pQty);
			    
			    st.setString(4, pDate);
			    
			    st.setString(5, pReason);
			    
			    st.setString(6, pReturn);

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Add Return Product Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/ReturnProductView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();
				
			}
		    
		
		
	} 
	
	
} 




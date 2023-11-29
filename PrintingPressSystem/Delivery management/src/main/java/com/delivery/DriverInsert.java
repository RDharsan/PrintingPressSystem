package com.delivery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DriverInsert")
public class DriverInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String drivername=request.getParameter("drivername");
		String nic =request.getParameter("nic");
		String team=request.getParameter("team");
		String vehicle=request.getParameter("vehicle");
		String phone=request.getParameter("phone");
		
		
		boolean isTrue;
		isTrue=DriverDBUtil.insertdriver(drivername,nic ,team,vehicle ,phone );
		 if(isTrue==true)
		  {
			 RequestDispatcher dis=request.getRequestDispatcher("success.jsp");
			 dis.forward(request, response);
		  }
		 
		 else
		 {
			 RequestDispatcher dis2=request.getRequestDispatcher("unsuccess.jsp");
			 dis2.forward(request, response);
		 }
		
		
	}
	


}



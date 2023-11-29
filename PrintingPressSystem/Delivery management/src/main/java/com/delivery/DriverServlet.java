package com.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DriverServlet")
public class DriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String drivername=request.getParameter("drivername");
		String nic=request.getParameter("nic");
		
		
		
		try {
		     List<Driver>driverDetails=DriverDBUtil.validate(drivername, nic);
		      request.setAttribute("driverDetails",driverDetails);
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis=request.getRequestDispatcher("useraccounts.jsp");
		dis.forward(request, response);
		
		
		
	}

}

   
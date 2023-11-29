package com.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeletedriverServlet")
public class DeletedriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String dr_id=request.getParameter("dr_id");
	     boolean isTrue;
	     
	     isTrue=DriverDBUtil.deletedriver(dr_id);
	     
	     if(isTrue==true)
	     {
	    	 RequestDispatcher dispatcher=request.getRequestDispatcher("Driverinsert.jsp");
	    	 dispatcher.forward(request, response);
	     }
	     
	     else
	     {
	    	 List<Driver>driverDetails=DriverDBUtil.getDriverDetails(dr_id);
	    	 request.setAttribute("driverDetails", driverDetails);
	    	 
	    	 RequestDispatcher dispatcher=request.getRequestDispatcher("useraccounts.jsp");
	    	 dispatcher.forward(request, response);
	     }

	}

}

package com.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAppointmentServlet")
public class UpdateDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dr_id=request.getParameter("dr_id");
		String drivername=request.getParameter("drivername");
		String nic=request.getParameter("nic");
		String team=request.getParameter("team");
		String vehicle=request.getParameter("vehicle");
		String phone=request.getParameter("phone");
		
	     boolean isTrue;
	     isTrue=DriverDBUtil.updatedriver(dr_id,drivername ,nic, team, vehicle,  phone);
	     
	     if(isTrue==true)
	     {
	    	 
	    	 List<Driver>driverDetails=DriverDBUtil.getDriverDetails(dr_id);
	    	 request.setAttribute("driverDetails",driverDetails);
	    	 
	    	 RequestDispatcher dis=request.getRequestDispatcher("useraccounts.jsp");
	    	 dis.forward(request, response);
	     }
	     
	     else
	     {
	    	 List<Driver> driverDetails=DriverDBUtil.getDriverDetails(dr_id);
	    	 request.setAttribute("driverDetails",driverDetails);
	    	 
	    	 RequestDispatcher dis=request.getRequestDispatcher("useraccounts.jsp");
	    	 dis.forward(request, response);
	     }
	}

}

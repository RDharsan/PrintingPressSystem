package com.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DeleteDeliveryServlet")
public class DeleteDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id=request.getParameter("id");
	     boolean isTrue;
	     
	     isTrue=DeliveryDBUtil.deletedelivery(id);
	     
	     if(isTrue==true)
	     {
	    	 RequestDispatcher dispatcher=request.getRequestDispatcher("Deliveryinsert.jsp");
	    	 dispatcher.forward(request, response);
	     }
	     
	     else
	     {
	    	 List<Delivery>deliveryDetails=DeliveryDBUtil.getDeliveryDetails(id);
	    	 request.setAttribute("deliveryDetails", deliveryDetails);
	    	 
	    	 RequestDispatcher dispatcher=request.getRequestDispatcher("useraccount.jsp");
	    	 dispatcher.forward(request, response);
	     }

	}

	}



package com.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/UpdateDeliveryServlet")
public class UpdateDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
   
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id=request.getParameter("id");
		 String cus_id=request.getParameter("cus_id");
	     String customername=request.getParameter("customername");
	     String deliverytype=request.getParameter("deliverytype");
	     String deliverydate=request.getParameter("deliverydate");
	     String orderid=request.getParameter("orderid");
	     String shortname=request.getParameter("shortname");
	     String location=request.getParameter("location");
	     String postalcode=request.getParameter("postalcode");
	     
	     boolean isTrue;
	     isTrue=DeliveryDBUtil.updatedelivery(id,cus_id,customername , deliverytype, deliverydate, orderid, shortname, location, postalcode);
	     
	     if(isTrue==true)
	     {
	    	 
	    	 List<Delivery> deliveryDetails=DeliveryDBUtil.getDeliveryDetails(id);
	    	 request.setAttribute("deliveryDetails",deliveryDetails);
	    	 
	    	 RequestDispatcher dis=request.getRequestDispatcher("useraccount.jsp");
	    	 dis.forward(request, response);
	     }
	     
	     else
	     {
	    	 List<Delivery> deliveryDetails=DeliveryDBUtil.getDeliveryDetails(id);
	    	 request.setAttribute("deliveryDetails",deliveryDetails);
	    	 
	    	 RequestDispatcher dis=request.getRequestDispatcher("useraccount.jsp");
	    	 dis.forward(request, response);
	     }
	}

	

}

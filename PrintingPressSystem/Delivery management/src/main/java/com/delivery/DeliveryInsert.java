package com.delivery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/DeliveryInsert")
public class DeliveryInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cus_id = Integer.parseInt(request.getParameter("cus_id"));
		String customername=request.getParameter("cname");
		String deliverytype =request.getParameter("deliverytype");
		String deliverydate=request.getParameter("deliverydate");
		String orderid=request.getParameter("orderid");
		String shortname=request.getParameter("shortname");
		String location=request.getParameter("location");
		String postalcode=request.getParameter("postalcode");
		
		boolean isTrue;
		isTrue=DeliveryDBUtil.insertdelivery(cus_id,customername,deliverytype ,deliverydate ,orderid ,shortname ,location , postalcode);
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

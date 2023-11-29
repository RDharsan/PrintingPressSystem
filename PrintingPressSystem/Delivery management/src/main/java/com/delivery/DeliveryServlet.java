package com.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdddeliveryServlet")
public class DeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customername=request.getParameter("cname");
		String orderid=request.getParameter("orderid");
		
		try {
		    List<Delivery> deliveryDetails=DeliveryDBUtil.validate(customername, orderid);
		    request.setAttribute("deliveryDetails",deliveryDetails );
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		RequestDispatcher dis=request.getRequestDispatcher("useraccount.jsp");
		dis.forward(request, response);
		
	}

}

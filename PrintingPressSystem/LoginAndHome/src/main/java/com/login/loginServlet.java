package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("uname");
		String password=request.getParameter("pass");
		
		
		Login login=new Login();
		login.setUsername(username);
		login.setPassword(password);
		
		LoginDButil log=new LoginDButil();
		log.validate(login);
		
		if(log.validate(login)) {
			response.sendRedirect("Home.jsp");
		}
		else {
			
			JOptionPane.showMessageDialog(null,"Invalid Login!!");
			response.sendRedirect("login.jsp");
		}
	}

}

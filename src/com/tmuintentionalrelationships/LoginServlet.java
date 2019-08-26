package com.tmuintentionalrelationships;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmuintentionalrelationships.User;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			User u = AuthController.user(request);
			request.setAttribute("user", u);
			System.out.println("User logged in: " + u);
			request.getRequestDispatcher("/login.jsp").include(request, response);

		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User u = AuthController.login(request, response);
		if(u != null){
			response.sendRedirect("/Home");
		} else {
			System.out.println("failed");
		}
	}
}
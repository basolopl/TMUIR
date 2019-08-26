package com.tmuintentionalrelationships;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmuintentionalrelationships.User;

public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			ServletHelper.loadPageStart(request, response);
			request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").include(request, response);
			ServletHelper.loadPageEnd(request, response);

		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User u = AuthController.register(request, response);
		if(u != null){
			response.sendRedirect("/home");
		}
	}
}
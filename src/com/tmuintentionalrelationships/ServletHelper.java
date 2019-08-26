package com.tmuintentionalrelationships;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmuintentionalrelationships.User;

public class ServletHelper {
	protected static void loadPageStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User u = AuthController.user(request);
		request.setAttribute("user", u);
		System.out.println("User logged in: " + u);
	}

	protected static void loadPageEnd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}

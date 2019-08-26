package com.tmuintentionalrelationships;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmuintentionalrelationships.User;

public class AuthController {
	public static boolean isAuthenticated(HttpServletRequest request){
		return user(request) != null;
	}
	
	public static User user(HttpServletRequest request){
		Object authToken = request.getSession().getAttribute("authToken");
		if(authToken == null){
			Cookie[] cookies = request.getCookies();
			for(Cookie c : cookies){
				if(c.getName().equals("authToken"))
					System.out.println("user() works");
					authToken = c.getValue();
			}
		}
		if(authToken != null){
			ArrayList<User> users = User.where("authToken", "=", authToken);
			if(users.size() > 0)
				return users.get(0);
		}
		return null;
	}
	
	public static void redirectIfNotAuthenticated(HttpServletRequest request, HttpServletResponse response){
		if(!isAuthenticated(request))
			try {
				response.sendRedirect("/home");
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	 
	public static User login(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("uname").toString();
		String password = request.getParameter("psw").toString();
		ArrayList<User> list = User.where("username", "=", name);
		System.out.println(list.size() + "test");
		if(list.size() == 0)
			return null;
		System.out.println("login1 works");
		String salt = BCrypt.gensalt(12);
		String hashed = BCrypt.hashpw(request.getParameter("psw"), salt);
		String authToken = BCrypt.hashpw(password + name, salt);
		ArrayList<User> matches = User.where(new String[]{"username", "password"}, new String[]{"=", "="}, new String[]{name, hashed});
		if(matches.size() > 0){
			User u =  matches.get(0).update(new String[]{"authToken"}, new String[]{authToken});
			request.getSession().setAttribute("authToken", authToken);
			Cookie c = new Cookie("authToken", authToken);
			c.setMaxAge(60 * 60 * 6);
			response.addCookie(c);
			System.out.println("login2 works");
			return u;
		}
		return null;
	}
	
	public static User register(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		String email = request.getParameter("email").toString();
		String salt = BCrypt.gensalt(12);
		String hashed = BCrypt.hashpw(password, salt);
		String authToken = BCrypt.hashpw(password + name, salt);
		String[] cols = {"username", "password", "email", "authToken"};
		String[] values = {name, hashed, email, authToken};
		if(User.where("email", "=", email).size() == 0 && User.where("username", "=", name).size() == 0){
			System.out.println("Register working");
			User u = User.create(cols, values);
			request.getSession().setAttribute("authToken", authToken);
			Cookie c = new Cookie("authToken", authToken);
			c.setMaxAge(60 * 60 * 6);
			response.addCookie(c);
			return u;
		}
		return null;
	}
	
	public static void logout(HttpServletRequest request, HttpServletResponse response) {
		response.addCookie(new Cookie("authToken", ""));
		request.getSession().setAttribute("authToken", "");
		try {
			response.sendRedirect("/home");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

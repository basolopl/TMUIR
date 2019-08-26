	package com.tmuintentionalrelationships;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Home
 */
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		File f = null;
	      String path = "";
	      boolean bool = false;
	      
	      try {
	      
	         // create new files
	         f = new File("index.jsp");
	         
	         // returns true if the file exists
	         bool = f.exists();
	         
	         // if file exists
	         if(bool) {
	         
	            // get absolute path
	            path = f.getAbsolutePath();
	         }
	         
	      } catch(Exception e) {
	      
	         // if any error occurs
	         e.printStackTrace();
	      }
		request.getRequestDispatcher(path).include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

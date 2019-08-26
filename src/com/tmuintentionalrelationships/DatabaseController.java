package com.tmuintentionalrelationships;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseController {
	private static Connection con;
	
	private static void init() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tmuir", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getCon(){
		if(con == null)
			init();
		return con;
	}
}

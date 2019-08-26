package com.tmuintentionalrelationships;

import java.util.ArrayList;

public class User extends Model{
	
	private static String tableName = "userdata";
	protected static String[] columnNames = {"userID", "username", "password", "firstName", "lastName", "email", "authToken", "dateJoined"};
	
	public User(ArrayList<Object> vals){
		super(vals, columnNames);
	}
	
	public static ArrayList<User> where(String column, String modifier, Object value){
		return whereInTable(column, modifier, value, tableName, columnNames, User.class);
	}
	
	public static ArrayList<User> where(String[] columns, String[] modifiers, Object[] values) {
		return Model.whereInTable(columns, modifiers, values, tableName, columnNames, User.class);
	}
	
	public static ArrayList<User> all(){
		return allInTable(tableName, columnNames, User.class);
	}

	public static User find(int id){
		return findInTable(id, tableName, columnNames, User.class);
	}
	
	public User update(String[] columnNames, Object[] values) {
		return update(columnNames, values, tableName, User.class, this.integer("id"));
	}
	
	public static User create(String[] columnNames, Object[] values) {
		return create(columnNames, values, tableName, User.class);
	}
	
	@Override
	public String toString(){
		return "[User||| username: " + this.str("username") + "]";
	}
}

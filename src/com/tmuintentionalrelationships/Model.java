package com.tmuintentionalrelationships;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import com.tmuintentionalrelationships.DatabaseController;

public class Model {
	protected static String tableName;
	protected ArrayList<Object> props;
	protected String[] columnNames = {};

	public Model(ArrayList<Object> props) {
		this.props = props;
	}

	public Model(ArrayList<Object> props, String[] columnNames) {
		this.props = props;
		this.columnNames = columnNames;
	}

	public Object obj(String columnName) {
		int col = Arrays.asList(this.columnNames).indexOf(columnName);
		if (col != -1 && this.props != null)
			if (this.props.size() >= col)
				return this.props.get(col);
		return null;
	}

	public String str(String columnName) {
		Object o = obj(columnName);
		return o != null ? o.toString() : null;
	}

	public int integer(String columnName) {
		Object o = obj(columnName);
		return o != null ? Integer.parseInt(o.toString()) : null;
	}

	public boolean bool(String columnName) {
		return (boolean) obj(columnName);
	}

	public double doub(String columnName) {
		Object o = obj(columnName);
		return o != null ? Double.parseDouble(o.toString()) : null;
	}

	public static <E> ArrayList<E> where(String column, String modifier, Object value, Class<E> className) {
		return whereInTable(column, modifier, value, tableName, new String[0], className);
	}

	public static <E> ArrayList<E> all(Class<E> className) {
		return allInTable(tableName, new String[0], className);
	}

	protected static <E> E create(String[] columnNames, Object[] values, String table, Class<E> className) {
		Connection con = DatabaseController.getCon();
		String cols = "";
		String vals = "";
		for (int i = 0; i < columnNames.length; i++) {
			cols += "`" + columnNames[i] + "`";
			vals += "?";
			if (i < columnNames.length - 1) {
				vals += ", ";
				cols += ", ";
			}
		}
		String query = "insert into `" + table + "`(" + cols + ") values (" + vals + ")";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			for (int i = 0; i < columnNames.length; i++)
				pstmt.setObject(1 + i, values[i]);
			int affectedRows = pstmt.executeUpdate();

			if (affectedRows == 0)
				throw new SQLException("Creating user failed, no rows affected.");

			try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					int id = generatedKeys.getInt(1);
					return findInTable(id, table, columnNames, className);
				} else {
					throw new SQLException("Creating user failed, no ID obtained.");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	protected static <E> E update(String[] columnNames, Object[] values, String table, Class<E> className, int id) {
		Connection con = DatabaseController.getCon();
		String cols = "";
		for (int i = 0; i < columnNames.length; i++) {
			cols += "`" + columnNames[i] + "` = ?";
			if (i < columnNames.length - 1) {
				cols += ", ";
			}
		}
		String query = "update `" + table + "` set " + cols + " where `id` = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			int i = 0;
			for (i = 0; i < columnNames.length; i++)
				pstmt.setObject(i + 1, values[i]);
			pstmt.setInt(i + 1, id);
			int affectedRows = pstmt.executeUpdate();
			if (affectedRows == 0)
				throw new SQLException("Updating user failed, no rows affected.");
			return findInTable(id, table, User.columnNames, className);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	protected static <E> E findInTable(int id, String table, String[] columnNames, Class<E> className) {
		Connection con = DatabaseController.getCon();
		String query = "select * from `" + table + "` where id = ?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				ArrayList<Object> cols = new ArrayList<Object>();
				for (int i = 0; i < columnNames.length; i++) {
					cols.add(rs.getObject(columnNames[i]));
				}
				E c = className.getConstructor(ArrayList.class).newInstance(cols);
				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return null;
	}

	protected static <E> ArrayList<E> whereInTable(String column, String modifier, Object value, String table,
			String[] columnNames, Class<E> className) {
		ArrayList<E> list = new ArrayList<E>();
		Connection con = DatabaseController.getCon();
		String query = "select * from `" + table + "` where " + column + " " + modifier + " ?";
		PreparedStatement pstmt;
		int index = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setObject(1, value);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ArrayList<Object> cols = new ArrayList<Object>();
				for (int i = 0; i < columnNames.length; i++) {
					cols.add(rs.getObject(columnNames[i]));
				}
				E c = className.getConstructor(ArrayList.class).newInstance(cols);
				list.add(index++, c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return list;
	}

	protected static <E> ArrayList<E> whereInTable(String[] columns, String[] modifiers, Object[] values, String table,
			String[] columnNames, Class<E> className) {
		ArrayList<E> list = new ArrayList<E>();
		Connection con = DatabaseController.getCon();
		String query = "select * from `" + table + "` where ";
		for (int i = 0; i < columns.length; i++) {
			query += "`" + columns[i] + "` " + modifiers[i] + " ?";
			if (i < columns.length - 1)
				query += " and ";
		}
		PreparedStatement pstmt;
		int index = 0;
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < values.length; i++)
				pstmt.setObject(i + 1, values[i]);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ArrayList<Object> cols = new ArrayList<Object>();
				for (int i = 0; i < columnNames.length; i++) {
					cols.add(rs.getObject(columnNames[i]));
				}
				E c = className.getConstructor(ArrayList.class).newInstance(cols);
				list.add(index++, c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return list;
	}

	protected static <E> ArrayList<E> allInTable(String table, String[] columnNames, Class<E> className) {
		ArrayList<E> list = new ArrayList<E>();
		Connection con = DatabaseController.getCon();
		String query = "select * from `" + table + "`";
		PreparedStatement pstmt;
		int index = 0;
		try {
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ArrayList<Object> cols = new ArrayList<Object>();
				for (int i = 0; i < columnNames.length; i++)
					cols.add(rs.getObject(columnNames[i]));
				E c = className.getConstructor(ArrayList.class).newInstance(cols);
				list.add(index++, c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return list;
	}
}

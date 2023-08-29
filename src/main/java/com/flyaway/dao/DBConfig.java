package com.flyaway.dao;

import java.sql.*;


public class DBConfig {
	public static final String url = "jdbc:mysql://localhost:3306/flyaway";
	public static final String user = "root";
	public static final String password = "Mysqlasif";
	

	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url,user,password);
		
	}
}
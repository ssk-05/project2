package com.database;

import java.sql.*;

public class dbUtil {
	
	public static Connection getConnection() throws SQLException,ClassNotFoundException{
		String driverClassName = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/flyaway"; 
		String user = "root";
		String password= "Sweta@1996"; 
		//step #1 : load a driver
		Class.forName(driverClassName);
		//step #2 obtain a connection use a DriverManager class
		Connection connection = DriverManager.getConnection(url,user,password);
		return connection;
	}

}
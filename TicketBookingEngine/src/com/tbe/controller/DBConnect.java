/*
 * Author : Ashen Kleo
 */

package com.tbe.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class DBConnect {
	
	private static DBConnect instance;
	
	private DBConnect(){
	}
	
	public static DBConnect getInstance(){
		if (instance == null){
			instance = new DBConnect();
		}
		return instance;
	}
	
	public static Connection connect(){
		String URL = "jdbc:postgresql://localhost:5432/TicketBookingEngine"; 
		String Username = "postgres";
		String Password = "root";
		
		Connection conn = null;
		
		try {
			Class.forName("org.postgresql.Driver");	
		} catch (ClassNotFoundException e) {
			System.out.println("Error in configuring the sql driver");
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection(URL, Username, Password);
		} catch (SQLException e) {
			System.out.println("Error in getting the sql connection");
			e.printStackTrace();
		}		
		return conn;
	}
	
	//close the SQL connection
	public static void close(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Error in closing the sql connection");
			e.printStackTrace();
		}
	}
	
	//close statement
	
	//close resultset
}

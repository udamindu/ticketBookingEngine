/*
 * Class to handle activity log
 *	Author : ashenkleo@gmail.com
 *	SLIIT 
 * */
 
package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class Utilities {

	DBConnect Con = DBConnect.getInstance();

	Connection dbConn = null;
	
	public boolean addToHistory(String type){
		boolean state = false;
		
		String dateNow = this.generateCurrentDateTime();
		
		if (dbConn==null)
		{
			dbConn = DBConnect.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "insert into \"History\" (\"type\",\"date\") values ('"+ type +"' ,'"+ dateNow +"')";
			int result = stmt.executeUpdate(query);
			System.out.println(query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out.println("Error in inserting the record to History");
			e.printStackTrace();
		} finally {
			//Con.close(dbConn);
		}		
		return state;
	}
	
	public boolean addToHistory(String type,String attribute){
		boolean state = false;
		
		String dateNow = this.generateCurrentDateTime();
		
		if (dbConn==null)
		{
			dbConn = DBConnect.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "insert into \"History\" (\"type\",\"date\",\"attribute\") values ('"+ type +"' ,'"+ dateNow +"','"+attribute+"')";
			int result = stmt.executeUpdate(query);
			System.out.println(query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out.println("Error in inserting the record to History");
			e.printStackTrace();
		} finally {
			//Con.close(dbConn);
		}		
		return state;
	}
	
	private String generateCurrentDateTime(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	public Vector<Vector<String>> getHistory() {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"History\" order by \"date\" desc";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("id"));
				Enq.add(rs.getString("type"));
				Enq.add(rs.getString("date"));
				Enq.add(rs.getString("attribute"));
				Pic.add(Enq);
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return Pic;
	}
	
	public boolean clearHistory(){
		boolean state = false;
		
		String dateNow = this.generateCurrentDateTime();
		
		if (dbConn==null)
		{
			dbConn = DBConnect.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "delete from \"History\"";
			int result = stmt.executeUpdate(query);
			System.out.println(query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out.println("Error in inserting the record to History");
			e.printStackTrace();
		} finally {
			//Con.close(dbConn);
		}		
		return state;
	}
}

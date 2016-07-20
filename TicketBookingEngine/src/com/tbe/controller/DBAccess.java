//** Author : Ashen **

package com.tbe.controller;

import java.sql.*;

import com.tbe.controller.DBConnect;

public class DBAccess {
	
	DBConnect Con = DBConnect.getInstance();
	Connection dbConn = null;
	
	// to update the database
	public boolean setData(String Query){
		boolean state = false;
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			int result = stmt.executeUpdate(Query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out.println("Error in executing the update query");
			e.printStackTrace();
		} finally {
			//Con.close(dbConn);
		}		
		return state;
	}
	
	// to get a data set from the database
	public ResultSet getData(String Query){
		ResultSet results = null;
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try{
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt.executeQuery(Query);
			return rs;
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed at"); 
		}finally{
			//Close the database connection			
		}
			return results;
	}
}

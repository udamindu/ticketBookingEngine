package com.tbe.controller;

//uthpala damindu bandara
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmailCtrl {

	DBConnect Con = DBConnect.getInstance();
	
	//method to get email from company 
	public String getEmailAddress(int cId){
		
		Connection dbConn = null;
		ResultSet rs = null;
		String ret = "";
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"email\" from \"company\" where \"companyId\" = "+cId+";"; 
			rs = stmt.executeQuery(query);
			
			while(rs.next())
				ret = rs.getString(1);			
			
			
		}catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed"); 
		}finally{
			
			DBConnect.close(dbConn);
		}	
		return ret;
	}
}

// Author : Ashen

package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Configurations {
	
	DBConnect Con = DBConnect.getInstance();
	Connection dbConn = null;
	
	
	/*Path to save images*/
	public boolean setLocPicPath(String Path){
		boolean state = false;
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			int result = stmt.executeUpdate("update \"Config\" set \"attribute\"='"+Path+"' where \"property\"='LocPicPath'");
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
	
	public String getLocPicPath(){
		ResultSet results = null;
		String Path = null;
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try{
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt.executeQuery("select \"attribute\" from \"Config\" where \"property\"='LocPicPath'");
			while (rs.next()){
				Path = rs.getString("attribute");
			}
			System.out.println("The Location to save images is >>> " + Path);
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed at"); 
		}finally{
			//Close the database connection			
		}
			return Path;
	}
	
	/*Database Username*/
	public boolean setUserName(String p){
		boolean state = false;
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			int result = stmt.executeUpdate("update \"Config\" set \"attribute\"='"+p+"' where \"property\"='DBUserName'");
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
	
	public String getUserName(){
		ResultSet results = null;
		String Path = null;
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try{
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt.executeQuery("select \"attribute\" from \"Config\" where \"property\"='DBUserName'");
			while (rs.next()){
				Path = rs.getString("attribute");
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed at"); 
		}finally{
			//Close the database connection			
		}
			return Path;
	}
}

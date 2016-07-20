//uthpala damindu bandara
package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class ToolBox {
	
	DBAccess dAccess = new DBAccess();

	public ArrayList<String> getTableInfo(){
		
		ArrayList<String> pathlist =null;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select \"name\",\"xVal\",\"yVal\",\"height\",\"width\",\"rVal\" from \"ptable\"";
	        ResultSet rs = stmt.executeQuery(query);
	        pathlist = new ArrayList<String>();
	        
	        while(rs.next()){
	           String name = rs.getString(1).toString();
	           pathlist.add(name);
	        }
	          
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "---Query failed ");
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }
		return pathlist;
	}
	
	public Vector getRectTab(){
		
		Vector<Vector<String>> tableDes = null;
		Connection dbConn = null;
		ResultSet rs = null; 
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"name\",\"xval\",\"yval\",\"height\",\"width\" from \"recttable\"";
			rs = stmt.executeQuery(query);
			tableDes = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString(1)); //table name
                row.add(rs.getString(2)); //x coordinate
                row.add(rs.getString(3)); //y coordinate
                row.add(rs.getString(4)); //height
                row.add(rs.getString(5)); //width
                
                tableDes.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println(sQLException + "-----------Select query failed at"); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		return tableDes;
	}
	
	public Vector getCircTab(){
		
		Vector<Vector<String>> tableDes = null;
		Connection dbConn = null;
		ResultSet rs = null; 
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"name\",\"xval\",\"yval\",\"rval\" from \"circtable\"";
			rs = stmt.executeQuery(query);
			tableDes = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString(1)); //table name
                row.add(rs.getString(2)); //x coordinate
                row.add(rs.getString(3)); //y coordinate
                row.add(rs.getString(4)); //r value
                
                tableDes.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println(sQLException + "-----------Select query failed at"); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		return tableDes;
	}
	
	public boolean updateWidth(String width) {
		
		boolean success = false;
		int w = Integer.parseInt(width);
		
		String query = "UPDATE \"recttable\" set \"width\" = "+w+" ";
		success = dAccess.setData(query);
		return success;
	}
	
	public boolean updateHeight(String height) {
		
		boolean success = false;
		
		int h = Integer.parseInt(height);
		String query = "UPDATE \"recttable\" set \"height\" = "+h+" ";
		success = dAccess.setData(query);
		return success;
	}
	
	public boolean updateCircTable(String radius) {
		
		boolean success = false;
		int r = Integer.parseInt(radius);
		String query = "UPDATE \"circtable\" set \"rval\" = "+r+" ";
		success = dAccess.setData(query);
		return success;
	}
	
	
}

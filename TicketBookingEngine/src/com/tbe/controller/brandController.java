package com.tbe.controller;
// Author - Sanju

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class brandController {
	
DBConnect Con = DBConnect.getInstance();
	
	/**
	 * Insert Brand Details to the 'ItemBrand'
	 * @param Brand - Panasonic
	 * @param catID - 1
	 * @return - true/false
	 */
	public boolean addNewBrand(String Brand, String catID)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				
				String Query="INSERT INTO \"ItemBrand\" (\"BrandName\", \"catID\") VALUES ('"+Brand+"', '"+catID+"')";System.out.print(Query);	
				int result1 = stmt.executeUpdate(Query);
				if (result1 == 1 )
				{
					state = true;
				} 
				else
				{
					state = false;
				}
			 System.out.println("Query -> "+Query);
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------INSERT query for Items failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;		
	}
	
	/**
	 * Return all Brand Names
	 * @return - Vector
	 */
	public Vector getBrandNames()
	{
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        //Select the JobCatNames
	        String query = "SELECT \"BrandName\" FROM \"ItemBrand\" ";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next())        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("BrandName"));        	
	           	Data.add(D);
	           	}
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query BrandName failed");
	    }finally{
	        //Close the db connection
	      //  DatabaseManager.con_close(dbConn);
	    }
	    return Data ;
	}

}

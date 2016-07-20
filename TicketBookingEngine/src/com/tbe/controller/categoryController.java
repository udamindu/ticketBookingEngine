package com.tbe.controller;
// Author - Sanju
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;



public class categoryController {
	DBConnect Con = DBConnect.getInstance();
	
	/**
	 * Insert category type to 'ItemCategory'
	 * @param cat - Table
	 * @return - true/false
	 */
	public boolean addNewCategory(String cat)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				
				String Query="INSERT INTO \"ItemCategory\" (\"Category\") VALUES ('"+cat+"')";
				System.out.print(Query);	
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
	 * Return All Category Types
	 * @return - vector
	 */
	public Vector getCategoryNames()
	{
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT \"Category\" FROM \"ItemCategory\" ";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next())        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("Category"));        	
	           	Data.add(D);
	           	}
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query CategoryName failed");
	    }finally{
	        //Close the db connection
	      //  DatabaseManager.con_close(dbConn);
	    }
	    return Data ;
	}
	
	/**
	 * Return Cat Id for that Category
	 * @param category - Table
	 * @return - 1
	 */
	public String getCategoryID(String category)
	{
		Connection dbConn = null;
		String val = "";

		ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT \"cat_id\" FROM \"ItemCategory\" WHERE \"Category\"='"+category+"'";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        while(rs.next())
	        {    
	        	val = rs.getString("cat_id");
				 System.out.println("cat_id -> "+val);
	        }
	        System.out.println("query -> "+query);
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query cat_id failed");
	    }finally{
	        //Close the db connection
	      //  DatabaseManager.con_close(dbConn);
	    }
	    return val ;
	}
}

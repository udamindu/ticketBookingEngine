package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.text.Document;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class LocationController {

	DBConnect Con = DBConnect.getInstance();

	Connection dbConn = null;
		
	public boolean AddLocations (String lName,int lLength, int lWidth, String scale, int covers, String comName, String category, String description)
	{
		boolean state = false;
		DBAccess obj = new DBAccess();
		String Query = "insert into \"Locations\" (\"location_name\",\"location_length\",\"location_width\",\"scale\", \"covers\", \"company\",\"category\",\"description\") values ('"+lName+"','"+lLength+"','"+lWidth+"','"+scale+"','"+covers+"','"+comName+"','"+category+"','"+description+"')";
		state = obj.setData(Query);
		return state;
	}
	
	
	public boolean AddGroups (String gName, String lId, String lName){
		boolean state = false;
		DBAccess obj = new DBAccess();
		String Query = "insert into \"Groups\" (\"group_name\",\"loc_id\",\"loc_name\") values ('"+gName+"',"+lId+",'"+lName+"')";
		state = obj.setData(Query);
		return state;
	}
	
	
	
	public Vector getLocations(String id)
	{
		Vector<Vector<String>> Data = null;        
        Connection dbConn = null;
	
	 ResultSet rs= null;
        try{
            
            dbConn = DBConnect.connect();            
            Statement stmt = dbConn.createStatement();
            
            String query = "SELECT *  FROM \"Locations\" WHERE \"location_id\" = "+id+" ";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> v = new Vector<String>();
            	
            	v.add(rs.getString("location_id"));
            	v.add(rs.getString("location_name"));  
            	v.add(rs.getString("location_length"));  
            	v.add(rs.getString("location_width"));  
            	v.add(rs.getString("scale"));  
            	v.add(rs.getString("covers"));  
            	v.add(rs.getString("company"));            	
            	v.add(rs.getString("category"));
            	v.add(rs.getString("description"));           	
            	Data.add(v);
            }           

        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query failed");
        }finally{
            //Close the db connection
          //  DatabaseManager.con_close(dbConn);
        }
        return Data ;
       
	}
	
	
	
	public boolean getLocId(String Id)
	{
		boolean state = false;
		DBAccess obj = new DBAccess();
		String Query = "select * from \"Locations\" \"location_id\"="+Id+" ";		
		state = obj.setData(Query);
		return state;
	}

	
	
	public boolean DeleteGroups(String gName)
	{
		boolean state = false;
		DBAccess obj = new DBAccess();
		String Query = "delete from \"Groups\" where \"group_name\"='"+gName+"' ";
		System.out.println(Query);
		state = obj.setData(Query);
		return state;
	}
	
	
	
	public boolean DeleteLocations(String Id)
	{
		boolean state = false;
		DBAccess obj = new DBAccess();
		String Query = "delete from \"Locations\" where \"location_id\"="+Id+" ";
		System.out.println(Query);
		state = obj.setData(Query);
		return state;
	}

	
	
	public Vector<Vector<String>> searchGroups(String gName)
	{
		Vector<Vector<String>> group = null;
		Connection dbConn = null;
		ResultSet rs = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		
		try{
			Statement stmt = dbConn.createStatement();
			
			String query = "select * from \"Groups\" where \"group_name\" like '%"+gName+"%'";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			
			group = new Vector<Vector<String>>();
			
			while (rs.next()) {
                               
                Vector<String> S = new Vector<String>();
            	S.add(rs.getString("group_name"));
            	S.add(rs.getString("loc_id"));            	   
            	S.add(rs.getString("loc_name"));             	   	
            	group.add(S);                              
            }	
			
		} catch (SQLException sQLException) 
		{
			System.out.println(sQLException + "-----------Select query failed at"); 
		}
		finally
		{
			//Close the database connection
			//DatabaseManager.con_close(dbConn);
		}
			return group;
	}
	
	
	
	public Vector<Vector<String>> SearchLocations(String lName)
	{
		Vector<Vector<String>> location = null;
		Connection dbConn = null;
		ResultSet rs = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		
		try{
			Statement stmt = dbConn.createStatement();
			
			String query = "select * from \"Locations\" where \"location_name\" like '%"+lName+"%'";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			
			location = new Vector<Vector<String>>();
			
			while (rs.next()) {
                               
                Vector<String> S = new Vector<String>();
            	S.add(rs.getString("location_id"));
            	S.add(rs.getString("location_name"));            	   
            	S.add(rs.getString("location_length")); 
            	S.add(rs.getString("location_width")); 
            	S.add(rs.getString("scale"));            	
            	S.add(rs.getString("covers"));  
            	S.add(rs.getString("company"));
            	S.add(rs.getString("category"));
            	S.add(rs.getString("description"));         	
            	location.add(S);
                              
            }	
			dbConn.close();
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "-----------Select query failed at"); 
		}finally{
		}
			return location;
	}
	
		
	
	
	public boolean UpdateLocations (String lName, int length, int width, String unit, int covers, String comName, String category, String description, String lId)
	{		
		boolean state = false;
		DBAccess obj = new DBAccess();
		String Query = "update \"Locations\" set \"location_name\"='"+lName+"',\"location_length\"='"+length+"',\"location_width\"='"+width+"',\"scale\"='"+unit+"',\"covers\"='"+covers+"',\"company\"='"+comName+"',\"category\"='"+category+"',\"description\"='"+description+"' where \"location_id\"="+lId+" ";
		System.out.println(Query);
		state = obj.setData(Query);
		return state;
	}
	
	
	

	public Vector getGroupDetails(){
		
		Vector<Vector<String>> Data = null;
		ResultSet rs= null;
        Connection dbConn = null;        
        
        try{
            
            dbConn = DBConnect.connect();            
            Statement stmt = dbConn.createStatement();
                      
            String query = "SELECT \"group_name\",\"loc_id\",\"loc_name\"  FROM \"Groups\" ";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();            	
            	
            	D.add(rs.getString("group_name"));  
            	D.add(rs.getString("loc_id"));            	
            	D.add(rs.getString("loc_name"));           	
            	Data.add(D);
            }           

        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query failed");
        }finally{
            //Close the db connection
          //  DatabaseManager.con_close(dbConn);
        }
        return Data ;
		
	}
	
	
	public Vector getLocForGroups(){
		
		Vector<Vector<String>> Data = null;
		ResultSet rs= null;
        Connection dbConn = null;        
        
        try{
            
            dbConn = DBConnect.connect();            
            Statement stmt = dbConn.createStatement();
                      
            String query = "SELECT \"location_id\",\"location_name\"  FROM \"Locations\" ";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();       	
              	D.add(rs.getString("location_id"));            	
            	D.add(rs.getString("location_name"));           	
            	Data.add(D);
            }           

        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query failed");
        }finally{
            //Close the db connection
          //  DatabaseManager.con_close(dbConn);
        }
        return Data ;
		
	}
	
	
	
	
	public Vector getLocDetailsToTable(){
		
		Vector<Vector<String>> Data = null;
		ResultSet rs= null;
        Connection dbConn = null;
	
	 
        try{
          
            dbConn = DBConnect.connect();            
            Statement stmt = dbConn.createStatement();

            //Select the JobCatNames
            String query = "SELECT *  FROM \"Locations\"";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();
            	
            	D.add(rs.getString("location_id"));
            	D.add(rs.getString("location_name"));  
            	D.add(rs.getString("location_length")); 
            	D.add(rs.getString("location_width")); 
            	D.add(rs.getString("scale"));            	
            	D.add(rs.getString("covers"));  
            	D.add(rs.getString("company"));
            	D.add(rs.getString("category"));
            	D.add(rs.getString("description"));           	
            	Data.add(D);
            }           

        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query failed");
        }finally{
            //Close the db connection
          //  DatabaseManager.con_close(dbConn);
        }
        return Data ;
       
    
    }
	
	
}

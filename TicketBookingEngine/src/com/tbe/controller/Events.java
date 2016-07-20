//uthpala damindu bandara
package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import com.tbe.controller.Ticket;


public class Events {

	DBConnect Con = DBConnect.getInstance();
	Ticket tc = null;
	
	/**
	 * This method can be used to insert a new Event.
	 * @param eType - type of the event
	 * @param eName - name of the event
	 * @param eLoc - location allocated for the event
	 * @param eSDate - start date of the event
	 * @param eEDate - end date of the event
	 * @param eCId - company id
	 * @param eDescription - short description of the event 
	 * @return true/false depending on the success of the insertion
	 */
	public boolean addEvent(String eType,String eName,String eLoc,String eSDate,String eEDate,int eCId,String eDescription){
		
		boolean success = false;
		int status = -1;
		Connection dbConn = null;
		
		try{
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "INSERT INTO \"events\" (\"etype\",\"ename\",\"elocation\",\"esdate\",\"eedate\",\"ecreatorid\",\"edescription\",\"event_range\") VALUES ('"+eType+"','"+eName+"','"+eLoc+"','"+eSDate+"','"+eEDate+"',"+eCId+",'"+eDescription+"',tsrange('"+eSDate+"', '"+eEDate+"'));";	
			status = stmt.executeUpdate(query);
			if(status>0)
				success=true;
		}
		catch(SQLException sQLException){
			System.out.println("query failed: "+sQLException.getMessage());
		}
		finally{
			DBConnect.close(dbConn);
		}
		
		return success;
	}
		
	/**
	 * This method can be used to edit an already created event 
	 * @param eType - new type of the event
	 * @param eName - new name of the event
	 * @param eLoc - new location of the event
	 * @param eSDate - new start date of the event
	 * @param eEDate - new end date of the event
	 * @param eCId - company id
	 * @param eDescription - new short description of the event 
	 * @param id - id of the event to be edited
	 * @return true/false depending on the succession of the update
	 */
	public boolean editEvent(String eType,String eName,String eLoc,String eSDate,String eEDate,int eCId,String eDescription,String id){
		
		boolean success = false;
		int status = -1;
		int idd = Integer.parseInt(id); 
		Connection dbConn = null;
		
		try{
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "UPDATE \"events\" set \"etype\" = '"+eType+"',\"ename\" = '"+eName+"',\"elocation\" = '"+eLoc+"',\"esdate\" = '"+eSDate+"',\"eedate\" = '"+eEDate+"',\"edescription\" = '"+eDescription+"',\"event_range\" = tsrange('"+eSDate+"', '"+eEDate+"') where \"eid\" = "+idd+" AND \"ecreatorid\" = "+eCId+";";
			status = stmt.executeUpdate(query);
			if(status>0)
				success=true;
		}
		catch(SQLException sQLException){
			System.out.println("query failed: "+sQLException.getMessage());
		}
		finally{
			DBConnect.close(dbConn);
		}
		
		return success;
	}
	
	/**
	 * This method can be used to update an event name, already created.
	 * @param name - new event name
	 * @param id - id of the event
	 * @return true/false depending on the succession of the update
	 */
	public boolean updateEventName(String name,String id){
		
		boolean success = false;
		int status = -1;
		int idd = Integer.parseInt(id); 
		Connection dbConn = null;
		
		try{
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "UPDATE \"events\" set \"ename\" = '"+name+"' where \"eid\" = "+idd+";";
			status = stmt.executeUpdate(query);
			if(status>0)
				success=true;
		}
		catch(SQLException sQLException){
			System.out.println("query failed: "+sQLException.getMessage());
		}
		finally{
			DBConnect.close(dbConn);
		}
		
		return success;
	}
	
	/**
	 * This method can be used to update an event description, already created.
	 * @param des - description to be updated
	 * @param id - id of the event
	 * @return true/false depending on the succession of the update
	 */
	public boolean updateEventDescription(String des,String id){
		
		boolean success = false;
		int status = -1;
		int idd = Integer.parseInt(id); 
		Connection dbConn = null;
		
		try{
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "UPDATE \"events\" set \"edescription\" = '"+des+"' where \"eid\" = "+idd+";";
			status = stmt.executeUpdate(query);
			if(status>0)
				success=true;
		}
		catch(SQLException sQLException){
			System.out.println("query failed: "+sQLException.getMessage());
		}
		finally{
			DBConnect.close(dbConn);
		}
		
		return success;
	}
	
	/**
	 * This method can be used to retrieve event ids.
	 * @return - list of event ids 
	 */
	public ArrayList<String> viewEventIDs(){
		
		ArrayList<String> list =null;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select \"eid\" from \"events\"";
	        ResultSet rs = stmt.executeQuery(query);
	        list = new ArrayList<String>();
	        String eventId = "";
	        
	        while(rs.next()){
	        	eventId = rs.getString(1).toString();
	           list.add(eventId);
	        }
	          
	    } catch (SQLException sQLException) {
	        System.out.println("query failed: "+sQLException.getMessage());
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }
		return list;
	}
	
	/**
	 * This method can be used to retrieve event names.
	 * @return - list of event names
	 */
	public ArrayList<String> viewEventNames(){
		
		ArrayList<String> list =null;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select \"ename\" from \"events\"";
	        ResultSet rs = stmt.executeQuery(query);
	        list = new ArrayList<String>();
	        String name = "";
	        
	        while(rs.next()){
	           name = rs.getString(1).toString();
	           list.add(name);
	        }
	          
	    } catch (SQLException sQLException) {
	        System.out.println("query failed: "+sQLException.getMessage());
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }
		return list;
	}
	
	/**
	 * This method can be used to retrieve event starting dates.
	 * @return - list of event starting dates
	 */
	public ArrayList<String> viewEventDates(){
		
		ArrayList<String> list =null;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        tc = new Ticket();
	        Statement stmt = dbConn.createStatement();
	        String query = "select EXTRACT(MONTH FROM \"esdate\"), EXTRACT(DAY FROM \"esdate\") from \"events\"";	      
	        ResultSet rs = stmt.executeQuery(query);
	        list = new ArrayList<String>();
	        String monthDate = "";
	        
	        while(rs.next()){
	        	monthDate = tc.getMonth(rs.getString(1)) +" "+ rs.getString(2).toString();
	            list.add(monthDate);
	        }
	          
	    } catch (SQLException sQLException) {
	        System.out.println("query failed: "+sQLException.getMessage());
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }
		return list;
	}
	
	/**
	 * This method can be used to retrieve event locations
	 * @return - list of event locations
	 */
	public ArrayList<String> viewEventLocations(){
		
		ArrayList<String> list =null;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select \"elocation\" from \"events\"";
	        ResultSet rs = stmt.executeQuery(query);
	        list = new ArrayList<String>();
	        String location = "";
	        
	        while(rs.next()){
	        	location = rs.getString(1).toString();
	            list.add(location);
	        }
	          
	    } catch (SQLException sQLException) {
	        System.out.println("query failed: "+sQLException.getMessage());
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }
		return list;
	}
	
	/**
	 * This method can be used to retrieve event descriptions.
	 * @return - list of event descriptions
	 */
	public ArrayList<String> viewEventDescriptions(){

		
		ArrayList<String> list =null;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select \"edescription\" from \"events\"";
	        ResultSet rs = stmt.executeQuery(query);
	        list = new ArrayList<String>();
	        String description = "";
	        
	        while(rs.next()){
	        	description = rs.getString(1).toString();
	            list.add(description);
	        }
	          
	    } catch (SQLException sQLException) {
	        System.out.println("query failed: "+sQLException.getMessage());
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }
		return list;
	}
	
	/**
	 * This method can be used to retrieve number of rows of the event table.
	 * @return - number of rows in the event table
	 */
	public int numOfRows(){
		
		int count = 0;
		Connection dbConn=null;
		
		try{
	        
	        dbConn = DBConnect.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select COUNT(*) from \"events\"";
	        ResultSet rs = stmt.executeQuery(query);        
	        
	        if(rs.next())
	        	count = Integer.parseInt(rs.getString(1).toString());           	        
	          
	    } catch (SQLException sQLException) {
	        System.out.println("query failed: "+sQLException.getMessage());
	    }finally{
	        
	        DBConnect.close(dbConn);
	    }

		return count;
	}
	
	/**
	 * This method can be used to retrieve search results given a keyword.
	 * @param search - search keyword 
	 * @return - collection of search results
	 */
	public Vector<Vector<String>> QuickSearch(String search){
		
		Vector<Vector<String>> qSearch = null;
		Connection dbConn = null;
		ResultSet rs = null;
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"eid\",\"ename\",\"etype\",\"elocation\",\"esdate\",\"eedate\",\"edescription\" from \"events\" where  UPPER(\"elocation\") like UPPER('%"+search+"%') or UPPER(\"ename\") like UPPER('%"+search+"%') or UPPER(\"etype\") like UPPER('%"+search+"%') or UPPER(\"edescription\") like UPPER('%"+search+"%');";
																														
			rs = stmt.executeQuery(query);
			qSearch = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString(1)); //eid
                row.add(rs.getString(2)); //ename
                row.add(rs.getString(3)); //etype
                row.add(rs.getString(4)); //elocation
                row.add(rs.getString(5)); //esdate
                row.add(rs.getString(6)); //eedate
                row.add(rs.getString(7)); //edescription
                qSearch.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
			return qSearch;
	}
	
	/**
	 * This method can be used to retrieve an event's details
	 * @param id - id of the event
	 * @return - list of events' details
	 */
	public Vector<Vector<String>> getEvent(String id){
		
		Vector<Vector<String>> eventDes = null;
		Connection dbConn = null;
		ResultSet rs = null;
		int idd = Integer.parseInt(id); 
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"eid\",\"ename\",\"etype\",\"elocation\",\"esdate\",\"eedate\",\"edescription\" from \"events\" where \"eid\" = "+idd+";";
			rs = stmt.executeQuery(query);
			eventDes = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString(1)); //eid
                row.add(rs.getString(2)); //ename
                row.add(rs.getString(3)); //etype
                row.add(rs.getString(4)); //elocation
                row.add(rs.getString(5)); //esdate
                row.add(rs.getString(6)); //eedate
                row.add(rs.getString(7)); //edescription
                eventDes.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		return eventDes;
	}
	
	/**
	 * This method can be used to retrieve event name and it's id given a company id.
	 * @param cid - id of the company
	 * @return - list of event id and name
	 */
	public Vector<Vector<String>> getNameIdPair(int cid){
		
		Vector<Vector<String>> eventDes = null;
		Connection dbConn = null;
		ResultSet rs = null;
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"eid\",\"ename\" from \"events\" where \"ecreatorid\"="+cid+";";
			rs = stmt.executeQuery(query);
			eventDes = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString(1)); //eid
                row.add(rs.getString(2)); //ename           
                eventDes.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		
		return eventDes;
	}
	
	/**
	 * This method can be used to retrieve locations given a company id.
	 * @param companyId - id of the company
	 * @return - list of locations of a company
	 */
	public Vector<String> fillLocations(int companyId){
		
		Vector<String> locationObject = new Vector<String>();
		Connection dbConn = null;
		ResultSet rs = null;
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"location_name\" from \"Locations\" where \"cid\" = "+companyId+";";
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {				
				locationObject.add(rs.getString(1));			
            }
			
		}catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed : "+sQLException.getMessage()); 
		}finally{		
			DBConnect.close(dbConn);
		}
		
		return locationObject;
	}
	
	/**
	 * This method can be used to retrieve event types given a company id.
	 * @param companyId - id of the company
	 * @return - list of event types for a given company
	 */
	public Vector<String> fillEventTypes(int companyId){
		
		Vector<String> eTypesObject = new Vector<String>();
		Connection dbConn = null;
		ResultSet rs = null;
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"name\" from \"eventtypes\" where \"cid\" = "+companyId+";";
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {				
				eTypesObject.add(rs.getString(1));			
            }
			
		}catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed : "+sQLException.getMessage()); 
		}finally{		
			DBConnect.close(dbConn);
		}
		
		return eTypesObject;
	}
	
	/**
	 * This method can be used to add a new event type.
	 * @param name - name of the event types
	 * @param description - short description of the event type
	 * @param companyId - id of the company
	 * @return - true/false depending on the succession of the insertion.
	 */
	public boolean addEventTypes(String name,String description,int companyId){
		
		boolean success = false;
		int status = -1;
		Connection dbConn = null;
		
		try{
			System.out.println("inside try block addEventTypes");
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "INSERT INTO \"eventtypes\" VALUES ('"+name+"','"+description+"',"+companyId+");";	
			status = stmt.executeUpdate(query);
			if(status>0)
				success=true;
			System.out.println(success);
		}
		catch(SQLException sQLException){
			System.out.println("query failed: "+sQLException.getMessage());
		}
		finally{
			DBConnect.close(dbConn);
		}
		
		return success;
	}
	
}


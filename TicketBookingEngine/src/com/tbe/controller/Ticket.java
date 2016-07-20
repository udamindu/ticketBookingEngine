package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class Ticket {
	
	DBConnect Con = DBConnect.getInstance(); 
	
	/**
	 * This method can be used to retrieve purchase details given an event id.
	 * @param id - event id 
	 * @return - list of purchase details given an event id 
	 */
	public Vector<Vector<String>> getpurchaseDetails(String id){
		
		Vector<Vector<String>> eventpurchases = null;
		Connection dbConn = null;
		ResultSet rs = null;
		int idd = Integer.parseInt(id); 
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"ticketId\",\"buyingTime\",\"buyerName\",\"buyerMail\",\"buyerContact\" from \"TicketBuysLog\" where \"eventId\" = "+idd+";";
			rs = stmt.executeQuery(query);
			eventpurchases = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString(1)); //ticketId
                row.add(rs.getString(2)); //buyingTime
                row.add(rs.getString(3)); //buyerName
                row.add(rs.getString(4)); //buyerMail
                row.add(rs.getString(5)); //buyerContact
                eventpurchases.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		return eventpurchases;
	}
	
	/**
	 * This method can be used to retrieve number of buys of all the events.
	 * @return list of months and it's total number of buys
	 */
	public Vector<Vector<String>> getBarchartDetails(){
		
		Vector<Vector<String>> chartDetails = null;
		Connection dbConn = null;
		ResultSet rs = null;
	
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "SELECT EXTRACT(MONTH FROM \"buyingTime\"),COUNT(*) FROM \"TicketBuysLog\" GROUP BY EXTRACT(MONTH FROM \"buyingTime\") ";
			rs = stmt.executeQuery(query);
			chartDetails = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(getMonth(rs.getString(1))); // X bar: month
                row.add(rs.getString(2)); // Y bar: number of sells
                chartDetails.add(row);            
            }
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		
		return chartDetails;
	}
	
	/**
	 * This method can be used to get the calander name of a month.
	 * @param statement - number of a month
	 * @return - name of the month related to a given number
	 */
	public String getMonth(String statement){
	
		String month = "";	
		
		switch (statement) {
		  case "1":
			  	month = "Jan";
		        break;
		  case "2": 
			  	month = "Feb";
		        break;
		  case "3":
			  	month = "March";
			  	break;
		  case "4":        
		        month = "April";
		        break;
		  case "5":        
		        month = "May";
		        break;
		  case "6":        
		        month = "June";
		        break;
		  case "7":        
		        month = "July";
		        break;
		  case "8":        
		        month = "Aug";
		        break;
		  case "9":        
		        month = "Sept";
		        break;
		  case "10":        
		        month = "Oct";
		        break;
		  case "11":        
		        month = "Nov";
		        break;      
		  case "12":
			  	month = "Dec";
		        break;
		}
		
		return month;
	}
	
	/**
	 * This method can be used to retrieve number of buys to a month given an event id.
	 * @param id - id of an event
	 * @return - String of purchase details given an event id 
	 */
	public String getBarchartJSON(String id){
		
		Connection dbConn = null;
		ResultSet rs = null;
		String jsonString = "";
		int idd = Integer.parseInt(id);
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "SELECT EXTRACT(MONTH FROM \"buyingTime\"),COUNT(*) FROM \"TicketBuysLog\" WHERE \"eventId\" = "+idd+" GROUP BY EXTRACT(MONTH FROM \"buyingTime\")ORDER BY EXTRACT(MONTH FROM \"buyingTime\") ";
			rs = stmt.executeQuery(query);
					
			while (rs.next()) {               
				
				if(rs.isFirst()){
					jsonString = "[";
				}
				
				jsonString = jsonString + "{";
				
				jsonString = jsonString + "y: '" + getMonth(rs.getString(1))+ "',";
				jsonString = jsonString + "a: " + rs.getString(2);
				
				jsonString = jsonString + "}";
				if(!rs.isLast()){                 // if not the last one
					jsonString = jsonString + ",";
				}
				else{
					jsonString = jsonString + "]";
				}
            }					
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		
		return jsonString;
	}
	
	/**
	 * This method can be used to retrieve number of buys to a month given an event id.
	 * @param id - id of an event
	 * @return - String of purchase details given an event id
	 */
	public String getLineChartJSON(String id){
		
		Connection dbConn = null;
		ResultSet rs = null;
		String jsonString = "";
		int idd = Integer.parseInt(id);
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "SELECT EXTRACT(YEAR FROM \"buyingTime\"),EXTRACT(MONTH FROM \"buyingTime\"),EXTRACT(DAY FROM \"buyingTime\"),COUNT(*) FROM \"TicketBuysLog\" WHERE \"eventId\" = "+idd+" GROUP BY EXTRACT(YEAR FROM \"buyingTime\"),EXTRACT(MONTH FROM \"buyingTime\"),EXTRACT(DAY FROM \"buyingTime\") ORDER BY EXTRACT(MONTH FROM \"buyingTime\") ";
			// SELECT EXTRACT(MONTH FROM "buyingTime"),COUNT(*) FROM "TicketBuysLog" GROUP BY EXTRACT(MONTH FROM "buyingTime");
			rs = stmt.executeQuery(query);
					
			while (rs.next()) {               
				
				if(rs.isFirst()){
					jsonString = "[";
				}
				
				jsonString = jsonString + "{";
				
				jsonString = jsonString + "y: '" + rs.getString(1) + "-" + rs.getString(2) + "-" + rs.getString(3) + "',";
				jsonString = jsonString + "a: " + rs.getString(4);
				
				jsonString = jsonString + "}";
				if(!rs.isLast()){                 // if not the last one
					jsonString = jsonString + ",";
				}
				else{
					jsonString = jsonString + "]";
				}
            }					
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		
		return jsonString;
	}
	
	/**
	 * This method can be used to retrieve total number of tickets sold given the event id.
	 * @param id - id of an event
	 * @return - number of tickets sold given an event id
	 */
	public int getNumberOfTicketsSold(String id){
		
		int result = 0;
		Connection dbConn = null;
		ResultSet rs = null;
		int idd = Integer.parseInt(id); 
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select COUNT(*) from \"TicketBuysLog\" where \"eventId\" = "+idd+";";
			rs = stmt.executeQuery(query);			
			
			while (rs.next()) 
				result = Integer.parseInt(rs.getString(1));          
			
		}catch (SQLException sQLException) {
			System.out.println("query failed: "+sQLException.getMessage()); 
		}finally{
			
			DBConnect.close(dbConn);
		}
		
		return result;
		
	}
	
	/**
	 * This method can be used to get the progress of a particular event given the event id.
	 * @param eid - id of an event
	 * @return - progress as a percentage
	 */
	public double calculateProgress(String eid){
		
		double progress = 0.0;
		double printedTickets = 1000; // hard coded for now
		
		progress = (getNumberOfTicketsSold(eid)/printedTickets)*100.0;
		
		return progress;
	}
}

/*
 * Author : Ashen Kleo
 */

package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import com.tbe.model.ITable;
import com.tbe.model.TableArrangement;
import com.tbe.model.TableFactory;

public class TableArrangementController {
	DBConnect Con = DBConnect.getInstance();;
	Connection dbConn = null;

	public String[] getLocationDetails(String id) {
		String[] returnArray = new String[5];
		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "select * from \"Locations\" where \"location_id\" = "
					+ id;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			returnArray[0] = rs.getString("location_id");
			returnArray[1] = rs.getString("location_name");
			returnArray[2] = rs.getString("location_length");
			returnArray[3] = rs.getString("location_width");
			returnArray[4] = rs.getString("covers");
		
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}

		return returnArray;
	}

	public TableArrangement getTableArrangement(String id) {
		TableArrangement arrangement = null;

		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"TableArrangement\" where \"arrangementId\" = "
					+ id;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			while (rs.next()) {
				arrangement = new TableArrangement(rs.getString("arrangementId"),
						rs.getString("name"), rs.getString("background"), rs.getString("tableArray"),
						rs.getString("location"));
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}

		return arrangement;
	}

	public String getLocationDimensions(String id) {
		String returnString = "";

		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();

			String query = "SELECT *  FROM \"Locations\" WHERE \"location_id\" = "
					+ id + " ";

			System.out.println(query);
			rs = stmt.executeQuery(query);
			rs.next();
			returnString = "{'length': " + rs.getString("location_length")
					+ ", 'width': " + rs.getString("location_width")
					+ ",'locationId': '',locationName: '"
					+ rs.getString("location_name") + "'}";
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "-----------Select query failed");
		} finally{
			System.out.println("Database execution complete");
		}

		return returnString;
	}

	public ArrayList<TableArrangement> getArrangements(String Location) {
		ArrayList<TableArrangement> returnArray = new ArrayList<TableArrangement>();
		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "select * from \"TableArrangement\" where \"location\" = " + Location;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			while (rs.next()) {
				returnArray.add(new TableArrangement(rs.getString("arrangementId"), rs.getString("name"), rs.getString("background"), rs.getString("tableArray"), rs.getString("location")));
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}
		return returnArray;
	}
	
	public String getBackrounds(String arrangement){
		String returnString = null;
		String url;
		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "select * from \"TableArrangementBackground\" where \"arrangement\" = " + arrangement;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			returnString = "[";
			while (rs.next()) {				
				returnString += "{title:'" + rs.getString("url") + "',url:'/TicketBookingEngine"+ rs.getString("url") +"'}";
				returnString += ",";
			}
			returnString = returnString.substring(0,returnString.length()-1);
			returnString += "]";
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}
		return returnString;
	}
	
	public boolean addBlueprint(String arrangement,String url){
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String Query = "insert into \"TableArrangementBackground\" values("+arrangement+",'"+url+"')";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if (result == 1) {
				state = true;
				System.out.println("Success");
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out.println("Error in executing the update query");
			e.printStackTrace();
		} finally{
			System.out.println("Database execution complete");
		}
		return state;
	}
	
	public String getTables (){
		String returnString = null;
		ResultSet rs = null;
		ITable table;
		TableFactory factory = new TableFactory();
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "select * from \"Items\" i, \"ItemCategory\" c where i.cat_id = c.cat_id and c.cat_id = '3'";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			returnString = "[";
			while (rs.next()) {				
				table = factory.getTable(rs.getString("description"));
			}
			returnString = returnString.substring(0,returnString.length()-1);
			returnString += "]";
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}
		return returnString;
	}
	
	public String getLocations() {
		String returnString = "";
		String details = "";
		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "select * from \"Locations\"";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			returnString = "[";
			while (rs.next()) {	
				details = "{";
				details += "'name' : ";
				details += "'" + rs.getString("location_name") + "'";
				details += ",";
				details += "'id' : ";
				details += rs.getString("location_id");
				details += "}";
				returnString += (details + ",");
			}
			returnString = returnString.substring(0,returnString.length()-1);
			returnString += "]";
			System.out.println ("Return String is -- >" + returnString);
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}

		return returnString;
	}
	
	public String getArrangements() {
		String returnString = "";
		String details = "";
		ResultSet rs = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String query = "select * from \"TableArrangement\"";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			returnString = "[";
			while (rs.next()) {	
				details = "{";
				details += "'name' : ";
				details += "'" + rs.getString("name") + "'";
				details += ",";
				details += "'id' : ";
				details += rs.getString("arrangementId");
				details += "}";
				returnString += (details + ",");
			}
			returnString = returnString.substring(0,returnString.length()-1);
			returnString += "]";
			System.out.println ("Return String is -- >" + returnString);
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally{
			System.out.println("Database execution complete");
		}

		return returnString;
	}
}

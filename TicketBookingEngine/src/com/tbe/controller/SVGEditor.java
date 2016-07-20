package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.tbe.model.SVGPopUp;

public class SVGEditor {
	
	DBConnect Con = DBConnect.getInstance(); 
	Connection dbConn = null;

	public String[] getLocDetails(String locId) {
		String[] locDetails = new String[4];
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT \"location_width\",\"location_length\",\"covers\",\"location_name\" FROM \"Locations\" WHERE \"location_id\"='"
							+ locId + "'");
			while (rs.next()) {
				locDetails[0] = rs.getString("location_length");
				locDetails[1] = rs.getString("location_width");
				locDetails[2] = rs.getString("covers");
				locDetails[3] = rs.getString("location_name");
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed at");
		} finally {
			// Close the database connection
		}
		return locDetails;
	}

	public boolean setPopUpData(SVGPopUp p) {
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		String query1 = "insert into \"SVGPopUp\" (\"tableLength\",\"tableWidth\",\"noOfCovers\",\"coversPerTable\",\"location\",\"metric\") values ("
				+ p.gettLength()
				+ ","
				+ p.gettWidth()
				+ ","
				+ p.getNoOfCovers()
				+ ","
				+ p.getCoversPerTable()
				+ ","
				+ p.getLocation()
				+ ",'"
				+ p.getMetric() + "')";
		String query = "update \"SVGPopUp\" set \"tableLength\"="+p.gettLength()+", \"tableWidth\"="+p.gettWidth()+", \"noOfCovers\"="+p.getNoOfCovers()+", \"coversPerTable\"="+p.getCoversPerTable()+", \"metric\"='"+p.getMetric()+"' where \"id\"="+p.getId()+"";
		try {
			Statement stmt = dbConn.createStatement();
			int result = stmt.executeUpdate(query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out
					.println("Error in executing the insert query for SVGPopUp");
			e.printStackTrace();
		} finally {
			// Con.close(dbConn);
		}
		return state;
	}
	
	public Vector<Vector<String>> getArrangements(String Location) {
		Vector<Vector<String>> Arr = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"SVGPopUp\" where \"location\" = "
					+ Location;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Arr = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("id"));
				Enq.add(rs.getString("tableLength"));
				Enq.add(rs.getString("tableWidth"));
				Enq.add(rs.getString("noOfCovers"));
				Enq.add(rs.getString("coversPerTable"));
				Enq.add(rs.getString("location"));
				Enq.add(rs.getString("metric"));
				Enq.add(rs.getString("name"));
				Arr.add(Enq);
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return Arr;
	}
	
	public boolean addNewArrangement(String loc, String name) {
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		String query = "insert into \"TableArrangement\" (\"location\",\"name\") values ("+loc+",'"+name+"')";
		try {
			Statement stmt = dbConn.createStatement();
			int result = stmt.executeUpdate(query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out
					.println("Error in executing the insert query for SVGPopUp");
			e.printStackTrace();
		} finally {
			// Con.close(dbConn);
		}
		return state;
	}
	
	public Vector<String> getArrangement(String id) {
		Vector<String> Arr = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"SVGPopUp\" p, \"Locations\" l where p.location=l.location_id and \"id\" = "
					+ id;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Arr = new Vector<String>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("id"));
				Enq.add(rs.getString("tableLength"));
				Enq.add(rs.getString("tableWidth"));
				Enq.add(rs.getString("noOfCovers"));
				Enq.add(rs.getString("coversPerTable"));
				Enq.add(rs.getString("location"));
				Enq.add(rs.getString("metric"));
				Enq.add(rs.getString("name"));
				Enq.add(rs.getString("location_name"));
				Enq.add(rs.getString("location_length"));
				Enq.add(rs.getString("location_width"));
				Enq.add(rs.getString("covers"));
				Arr=Enq;
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return Arr;
	}

	public boolean deleteArrangement (String id){
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		String query = "delete from \"TableArrangement\" where \"arrangementId\"="+id+"";
		System.out.println("Executing Query -->" + query);
		try {
			Statement stmt = dbConn.createStatement();
			int result = stmt.executeUpdate(query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out
					.println("Error in executing the insert query for SVGPopUp");
			e.printStackTrace();
		} finally {
			// Con.close(dbConn);
		}
		return state;
	}
}

/*
 * controller for universal search
 * author : ashenkleo@gmail.com
 */

package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class UniversalSearch {

	private DBAccess dba;
	DBConnect Con = DBConnect.getInstance();

	Connection dbConn = null;

	// Search Locations
	public Vector<Vector<String>> SearchLocations(String lName) {
		Vector<Vector<String>> location = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}

		try {
			Statement stmt = dbConn.createStatement();

			String query = "select * from \"Locations\" where UPPER(\"location_name\") like UPPER('%"
					+ lName + "%')";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			location = new Vector<Vector<String>>();

			while (rs.next()) {

				Vector<String> S = new Vector<String>();
				S.add(rs.getString("location_id"));
				S.add(rs.getString("location_name"));
				S.add(rs.getString("category"));
				S.add(rs.getString("description"));
				location.add(S);

			}

		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return location;
	}

	// Search Location Pictures
	public Vector<Vector<String>> searchPictures(String Name) {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures\" where UPPER(\"name\") like UPPER('%"
					+ Name + "%')";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("picId"));
				Enq.add(rs.getString("name"));
				Enq.add(rs.getString("url"));
				Enq.add(rs.getString("location"));
				Enq.add(rs.getString("descripption"));
				Pic.add(Enq);
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return Pic;
	}

	// Search Events
	public Vector<Vector<String>> searchEvent(String search) {

		Vector<Vector<String>> qSearch = null;
		Connection dbConn = null;
		ResultSet rs = null;

		try {

			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"eid\",\"ename\",\"etype\",\"elocation\",\"esdate\",\"eedate\",\"edescription\" from \"event\" where UPPER(\"ename\") like UPPER('%"
					+ search + "%')";

			rs = stmt.executeQuery(query);
			qSearch = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> row = new Vector<String>();
				row.add(rs.getString(1)); // eid
				row.add(rs.getString(2)); // ename
				row.add(rs.getString(3)); // etype
				row.add(rs.getString(4)); // elocation
				row.add(rs.getString(5)); // esdate
				row.add(rs.getString(6)); // eedate
				row.add(rs.getString(7)); // edescription
				qSearch.add(row);
			}

		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {

			DBConnect.close(dbConn);
		}
		return qSearch;
	}

	// Search Packages
	public Vector<Vector<String>> SearchPackage(String name) {

		Vector<Vector<String>> Data = null;
		ResultSet AgentList = null;
		Connection dbConn = null;

		ResultSet rs = null;
		try {
			// Connect to the DB
			dbConn = Con.connect();

			Statement stmt = dbConn.createStatement();

			// Select the JobCatNames
			String query = "SELECT * FROM \"Package\" WHERE UPPER(\"type\") like UPPER('%"+ name + "%')";

			System.out.println(query);
			rs = stmt.executeQuery(query);

			Data = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> D = new Vector<String>();
				D.add(rs.getString("pid"));
				D.add(rs.getString("type"));
				D.add(rs.getString("name"));
				D.add(rs.getString("location"));
				D.add(rs.getString("description"));
				D.add(rs.getString("tot"));
				// D.add(rs.getString("image"));
				Data.add(D);
			}

		} catch (SQLException sQLException) {
			System.out.println(sQLException + "-----------Select query failed");
		} finally {
			// Close the db connection
			// DatabaseManager.con_close(dbConn);
		}
		return Data;

	}
	
	// Search Packages
		public Vector<Vector<String>> SearchLocGroups(String name) {

			Vector<Vector<String>> Data = null;
			ResultSet AgentList = null;
			Connection dbConn = null;

			ResultSet rs = null;
			try {
				// Connect to the DB
				dbConn = Con.connect();

				Statement stmt = dbConn.createStatement();

				// Select the JobCatNames
				String query = "SELECT * FROM \"Groups\" WHERE UPPER(\"group_name\") like UPPER('%"+ name + "%')";

				System.out.println(query);
				rs = stmt.executeQuery(query);

				Data = new Vector<Vector<String>>();

				while (rs.next()) {
					Vector<String> D = new Vector<String>();
					D.add(rs.getString("group_name"));
					D.add(rs.getString("loc_id"));
					D.add(rs.getString("loc_name"));
					Data.add(D);
				}

			} catch (SQLException sQLException) {
				System.out.println(sQLException + "-----------Select query failed");
			} finally {
				// Close the db connection
				// DatabaseManager.con_close(dbConn);
			}
			return Data;

		}
}

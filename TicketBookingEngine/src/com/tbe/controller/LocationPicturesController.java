// Author : Ashen

package com.tbe.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import com.tbe.model.LocationPictures;

public class LocationPicturesController {
	private DBAccess dba;
	DBConnect Con = DBConnect.getInstance();
	Connection dbConn = null;

	public boolean addNewPicture(String pName, String pUrl, String pLocation,
			String pDescription) {
		boolean state = false;
		dba = new DBAccess();

		String Query = "insert into \"LocationPictures\" (\"name\",\"url\",\"location\",\"descripption\") values ('"
				+ pName
				+ "','"
				+ pUrl
				+ "',"
				+ pLocation
				+ ",'"
				+ pDescription
				+ "')";
		state = dba.setData(Query);
		return state;
	}

	public String getLastId() {
		String LastId = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT \"picId\" FROM \"LocationPictures\" ORDER BY \"picId\" DESC LIMIT 1");
			while (rs.next()) {
				LastId = rs.getString("picId");
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed at");
		} finally {
			// Close the database connection
		}
		return LastId;
	}

	public Vector<Vector<String>> getPictures(String Location) {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures\" where \"location\" = "
					+ Location;
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

	public Vector<Vector<String>> getLocationList() {
		Vector<Vector<String>> Enquiry = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select distinct L.\"location_name\", L.\"location_id\" from \"Locations\" L";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Enquiry = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("location_name"));
				Enq.add(rs.getString("location_id"));
				Enquiry.add(Enq);
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return Enquiry;
	}

	public boolean updatePicDetails(String Id, String Name, String Loc,
			String Desc) {
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String Query = "update \"LocationPictures\" set \"name\"='" + Name
					+ "',\"location\"='" + Loc + "',\"descripption\"='" + Desc
					+ "' where \"picId\"=" + Id;
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
		} finally {
			// Con.close(dbConn);
		}
		return state;
	}

	public boolean deletePicture(String Id) {
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String Query = "delete from \"LocationPictures\" where \"picId\"="
					+ Id + "";
			int result = stmt.executeUpdate(Query);
			if (result == 1) {
				state = true;
			} else {
				state = false;
			}
		} catch (SQLException e) {
			System.out.println("Error in executing the update query");
			e.printStackTrace();
		} finally {
			// Con.close(dbConn);
		}
		return state;
	}

	public Vector<Vector<String>> searchPictures(String Location, String Name) {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures\" where \"location\" = "
					+ Location + " and \"name\" like '%" + Name + "%'";
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

	public Vector<Vector<String>> getPicIds() {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select \"picId\" from \"LocationPictures\"";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("picId"));
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

	public Vector<Vector<String>> searchPicturesNoLoc(String Name) {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures\" where \"name\" like '%"
					+ Name + "%'";
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

	public Vector<Vector<String>> getPicturesAll() {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures\"";
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

	public boolean addNewPicTemp(String Url) {
		boolean state = false;
		dba = new DBAccess();

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date date = new Date();
		System.out.println(dateFormat.format(date));

		String Query = "insert into \"LocationPictures_Temp\" (\"url\",\"date\") values ('"
				+ Url + "','" + dateFormat.format(date) + "')";
		state = dba.setData(Query);
		return state;
	}

	public Vector<Vector<String>> getTempPic() {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures_Temp\" order by \"date\"";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("id"));
				Enq.add(rs.getString("url"));
				Enq.add(rs.getString("Location"));
				Enq.add(rs.getString("date"));
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

	public Vector<Vector<String>> getTempPicById(String ID) {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures_Temp\" order by \"date\" where \"id\"="
					+ ID;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("id"));
				Enq.add(rs.getString("url"));
				Enq.add(rs.getString("Location"));
				Enq.add(rs.getString("date"));
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

	public boolean deleteFromTemp(String Id) {
		boolean state = false;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			String Query = "delete from \"LocationPictures_Temp\" where \"id\"="
					+ Id;
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
		} finally {
			// Con.close(dbConn);
		}
		return state;
	}

	public String getPicUrl(String PicID) {
		String LastId = null;
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT \"url\" FROM \"LocationPictures\" where \"picId\"="
							+ PicID);
			System.out.println("SELECT \"url\" FROM \"LocationPictures\" where picId="
					+ PicID);
			while (rs.next()) {
				LastId = rs.getString("url");
			}
		} catch (SQLException sQLException) {
			System.out.println(sQLException + "Select query failed at");
		} finally {
			// Close the database connection
		}
		return LastId;
	}
	
	public Vector<Vector<String>> getTempPicId() {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;

		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select \"id\" from \"LocationPictures_Temp\" order by \"date\"";
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");

			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("id"));;
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
	
	public LocationPictures getPicById(String Id) {
		Vector<Vector<String>> Pic = null;
		Connection dbConn = null;
		ResultSet rs = null;
		LocationPictures lp = new LocationPictures();
		
		
		if (dbConn == null) {
			dbConn = Con.connect();
		}
		try {
			Statement stmt = dbConn.createStatement();
			// Select the MemPlanIds
			String query = "select * from \"LocationPictures\" where \"picId\" = " + Id;
			System.out.println(query);
			rs = stmt.executeQuery(query);
			System.out.println("Success");
			
			Pic = new Vector<Vector<String>>();

			while (rs.next()) {
				lp.setPicid(rs.getString("picId"));
				lp.setName(rs.getString("name"));
				lp.setUrl(rs.getString("url"));
				lp.setLocation(rs.getString("location"));
				lp.setDescription(rs.getString("descripption"));
				/*Vector<String> Enq = new Vector<String>();
				Enq.add(rs.getString("picId"));;
				Enq.add(rs.getString("name"));
				Enq.add(rs.getString("url"));
				Enq.add(rs.getString("location"));
				Enq.add(rs.getString("descripption"));
				
				Pic.add(Enq);*/
			} 
		} catch (SQLException sQLException) {
			System.out.println(sQLException
					+ "-----------Select query failed at");
		} finally {
			// Close the database connection
			// DatabaseManager.con_close(dbConn);
		}
		return lp;
	}
	
}

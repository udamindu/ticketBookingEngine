package com.tbe.controller;
// Author - Sanju
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class PackageController {

	DBConnect Con = DBConnect.getInstance();
	
	/**
	 * Add Packages to 'Package' and the items for 'PItems'
	 * @param name - TestPkg1
	 * @param ename - Sliit got Talent
	 * @param description - Evening Event
	 * @param tot - 25000
	 * @param Rcatergory - Chair
	 * @param Rname - Damro
	 * @param Rquantity - 10
	 * @param catID - 3
	 * @param brandID - 5
	 * @param itemid - 1
	 * @return - true/false
	 */
	public boolean addNewPackageN(String name, String ename, String description, String tot, String Rcatergory, String Rname, String Rquantity, String catID, String brandID, String itemid)
	{				
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				
				String Query = "INSERT INTO \"Package\" (\"name\",\"eventName\",\"description\",\"tot\", \"cus_ID\") VALUES ('"+name+"','"+ename+"','"+description+"','"+tot+"', '1')";
				String Query1 = "INSERT INTO \"PItems\" (\"PCategory\",\"PBrand\",\"Qty\", \"cat_id\", \"brand_id\", \"itemID\", \"cus_ID\") VALUES ('"+Rcatergory+"','"+Rname+"','"+Rquantity+"', '"+catID+"', '"+brandID+"', '"+itemid+"', '1')";
				System.out.print(Query);	
				System.out.print(Query);	
				int result1 = stmt.executeUpdate(Query);
				int result2 = stmt.executeUpdate(Query1);
				if (result1 == 1 && result2 == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------INSERT query for Package, PItems failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;		
	}
	
	/**
	 * Insert data into 'Pack_PItems', contains package id with item for that.
	 * @return - true/false
	 */
	public boolean addPack_PItems()
	{
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				
				String Query = "INSERT INTO \"Pack_PItems\" (\"pid\", \"name\", \"PItemID\") VALUES ('"+getPackID()+"','"+getPName()+"','"+getPItemsID()+"')";
				System.out.print(Query);
				int result1 = stmt.executeUpdate(Query);
				if (result1 == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------INSERT query for Pack_PItems failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;		
	}
	
	/**
	 * Update package details.
	 * @param pid - 1
	 * @param name - TestPkg1
	 * @param description - Evening Event
	 * @param tot - 25000
	 * @return - true/false
	 */
	public boolean updateNewPackageN(String pid, String name, String description,String tot, String RCat, String RName, String RQty)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				
				String Query="UPDATE \"Package\" SET \"description\"='"+description+"',\"tot\"='"+tot+"'WHERE \"pid\"='"+pid+"' )";
								
				System.out.print(Query);
				int result1 = stmt.executeUpdate(Query);
				if (result1 == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------UPDATE query for Package failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;	
	}
	
	/**
	 * Delete Packages.
	 * @param id - 1
	 * @param pname - TestPkg1
	 * @param PItemID - 2
	 * @return - true/false
	 */
	public boolean deletePackage(String id, String pname, String PItemID)
	{					
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				
				String Query = "DELETE FROM \"Package\" WHERE \"pid\"="+id+" AND \"name\"='"+pname+"')";		
				
				String Query3 = "DELETE FROM \"Pack_PItems\" WHERE \"pid\"='"+id+"' AND \"name\"='"+pname+"' AND \"PItemID\"='"+PItemID+"'  )";		
				
				String Query2 = "DELETE FROM \"PItems\"  WHERE \"PItemID\"='"+PItemID+"' )";	
				
				System.out.println(Query);
				System.out.println(Query2);
				System.out.println(Query3);
				int result1 = stmt.executeUpdate(Query);
				int result2 = stmt.executeUpdate(Query);
				int result3 = stmt.executeUpdate(Query);
				if (result1 == 1 && result2 == 1 && result3 == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------DELETE query for Package, Pack_PItems, PItems failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;	
	}

	/**
	 * Return Package id of last inserted row
	 * @return - 1
	 */
	public String getPackID()
	{	
		String ret="";
		String val="";		
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		
		try {
			 ResultSet rs;
			 Statement stmt = dbConn.createStatement();
			 val = "SELECT \"pid\"  FROM \"Package\" ORDER BY \"pid\" DESC LIMIT 1  ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("pid");
				 System.out.print(ret);
			 }
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for PackageID failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}
	
	/**
	 * Return PItemsID of last inserted row
	 * @return - 2
	 */
	public String getPItemsID()
	{	
		String val="";
		String ret="";
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		
		try {
			 Statement stmt = dbConn.createStatement();
			 ResultSet rs;
			 val = "SELECT \"PItemID\"  FROM \"PItems\" ORDER BY \"PItemID\" DESC LIMIT 1  ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("PItemID");
				 System.out.print(ret);
			 }
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for PItemID failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}
	
	/**
	 * Return package name of last added row
	 * @return - TestPkg1
	 */
	public String getPName()
	{	
		String val="";
		String ret="";
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		
		try {
			 Statement stmt = dbConn.createStatement();
			 ResultSet rs;
			 val = "SELECT \"name\"  FROM \"Package\" ORDER BY \"pid\" DESC LIMIT 1  ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("name");
				 System.out.print(ret);
			 }
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for Pname failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}	

	/**
	 * Return All package details
	 * @param id - 1
	 * @return - vector
	 */
	public Vector getPackageDetails(String id){
		
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();	        
	        Statement stmt = dbConn.createStatement();
	        String query = "SELECT * FROM \"Package\" WHERE \"pid\" = '"+id+"' ";

	        System.out.println(query);	               
	        rs = stmt.executeQuery(query);
	        Data = new Vector<Vector<String>>();
	        
	        while(rs.next())
	        {
	        	Vector<String> D = new Vector<String>();
	        	D.add(rs.getString("pid"));
            	D.add(rs.getString("name"));
            	D.add(rs.getString("eventName"));
            	D.add(rs.getString("description")); 
            	D.add(rs.getString("tot"));
	           	Data.add(D);	           
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for Package with pid failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}
	
	/**
	 * Return Package Item Details
	 * @param id - 1
	 * @param name - TestPkg1
	 * @return - vector
	 */
	public Vector getPackageItemsDetails(String id, String name){
		
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "select i.\"PItemID\", i.\"PCategory\", i.\"PBrand\", i.\"Qty\" from \"Package\" p, \"Pack_PItems\" pi, \"PItems\" i where p.\"pid\"=pi.\"pid\" AND p.\"name\"=pi.\"name\" AND pi.\"PItemID\"=i.\"PItemID\" AND p.\"pid\"='"+id+"' AND p.\"name\"='"+name+"' ;";

	        System.out.println(query);	               
	        rs = stmt.executeQuery(query);
	        Data = new Vector<Vector<String>>();
	        
	        while(rs.next())
	        {
	        	Vector<String> D = new Vector<String>();
	        	D.add(rs.getString("PItemID"));
            	D.add(rs.getString("PCategory"));
            	D.add(rs.getString("PBrand"));
            	D.add(rs.getString("Qty"));     
	           	Data.add(D);	           
	        }	
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for Package Items Details with pid failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}

	/**
	 * Return no. of covers for event name
	 * @param eventName - Sliit Got Talent
	 * @return - 1000
	 */
	public String getLocationCovers(String eventName){
	
	    Connection dbConn = null;
	    String ret = "";	
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();
	        
	        Statement stmt = dbConn.createStatement();
	        String query = "SELECT \"covers\"  FROM \"event\" WHERE \"ename\" = '"+eventName+"' ";
	        
	        System.out.println(query);
	        rs = stmt.executeQuery(query);	        
	        while(rs.next())
	        {
	        	ret = rs.getString("covers");
				 System.out.print(ret);
	        }	
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for covers failed");
	    }finally{
	        //Close the db connection
	    	  Con.close(dbConn);
	    }
	    return ret ;
	}

	/**
	 * Return All package details for the event name
	 * @param eventName - Sliit Got Talent
	 * @return - vector
	 */
	public Vector SearchPackage(String eventName) {
		
		Vector<Vector<String>> Data = null;
        Connection dbConn = null;	
        ResultSet rs= null;
        try{
            //Connect to the DB
            dbConn = Con.connect();
            
            Statement stmt = dbConn.createStatement();

            String query = "SELECT * FROM \"Package\" WHERE \"eventName\" like '%"+eventName+"%'";

            System.out.println(query);
            rs = stmt.executeQuery(query);
            Data = new Vector<Vector<String>>();            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();
            	D.add(rs.getString("pid"));
            	D.add(rs.getString("name"));
            	D.add(rs.getString("eventName"));
            	D.add(rs.getString("description")); 
            	D.add(rs.getString("tot")); 
               	Data.add(D);
            }
        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query search package failed");
        }finally{
            //Close the db connection
        	Con.close(dbConn);
        }
        return Data ;       
	}

	/**
	 * Return All package details
	 * @return - vector
	 */
	public Vector getPackageDetails(){
	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;	
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();
	        
	        Statement stmt = dbConn.createStatement();
	
	        String query = "SELECT *  FROM \"Package\" ";
	        
	        System.out.println(query);
	        rs = stmt.executeQuery(query);	
	        Data = new Vector<Vector<String>>();
	        
	        while(rs.next())
	        {
	        	Vector<String> D = new Vector<String>();
	        	D.add(rs.getString("pid"));
	        	D.add(rs.getString("name"));        	
	        	D.add(rs.getString("eventName"));
	        	D.add(rs.getString("description"));            	
	        	D.add(rs.getString("tot"));
	           	Data.add(D);
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for Package failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;   
	}


	/**
	 * Return package item id for that package
	 * @param pid - 1
	 * @param pname - TestPkg1
	 * @return
	 */
	public String getPItemIDDetails(String pid, String pname){
	
		Connection dbConn = null;
	    String ret = "";
	
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();
	        
	        Statement stmt = dbConn.createStatement();	
	        String query = "SELECT \"PItemID\"  FROM \"Pack_PItems\" WHERE \"pid\" = '"+pid+"' AND \"name\" = '"+pname+"' ";
	
	        System.out.println(query);
	        rs = stmt.executeQuery(query);	        
	        while(rs.next())
	        {
	        	 ret = rs.getString("PItemID");
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for PItemID failed");
	    }finally{
	    	Con.close(dbConn);
	    }
	    return ret;
	}

	/**
	 * Return All Package Items details
	 * @return - vector
	 */
	public Vector getPItemsDetails(){
	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;
	
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();
	        
	        Statement stmt = dbConn.createStatement();
	
	        String query = "SELECT R.\"PItemID\", R.\"PCategory\", R.\"PBrand\", R.\"Qty\"   FROM \"PItems\" R ";
	
	        System.out.println(query);
	        rs = stmt.executeQuery(query);	
	        Data = new Vector<Vector<String>>();
	        
	        while(rs.next())
	        {
	        	Vector<String> D = new Vector<String>();
	        	D.add(rs.getString("PItemID"));
	        	D.add(rs.getString("PCategory"));
	        	D.add(rs.getString("PBrand"));
	        	D.add(rs.getString("Qty")); 
	        	
	        	System.out.println(rs.getString("PItemID"));
	        	System.out.println(rs.getString("PCategory"));
	        	System.out.println(rs.getString("PBrand"));
	        	System.out.println(rs.getString("Qty"));
	        	
	           	Data.add(D);
	        }	
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query PItems failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}
	
	/**
	 * Return All event types
	 * @return - vector
	 */
	public Vector getEventTypeDetails(){	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT \"etype\"  FROM \"event\" GROUP BY \"etype\"";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next()) 
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("etype"));        	
	           	Data.add(D);
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for etype failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}
	
	/**
	 * Return all event names
	 * @return - vector
	 */
	public Vector getEventNameDetails()
	{	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT ename  FROM \"event\"";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next())        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("ename"));        	
	           	Data.add(D);
	           	}
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}
	
	/**
	 * Return all locations of the events
	 * @return - vector
	 */
	public Vector getEventLocationDetails(){	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT \"elocation\"  FROM \"event\" GROUP BY \"elocation\" ";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next())  
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("elocation"));        	
	           	Data.add(D);
	       	}
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for elocation failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	 }
	
	/**
	 * Return Company form locations.
	 * @return - vector
	 */
	public Vector getLocComDetails()
	{	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT \"company\"  FROM \"Locations\" GROUP BY \"company\"";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next())  
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("company"));        	
	           	Data.add(D);
	       	}
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for company failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}
	
	/**
	 * Return all event names
	 * @return - vector
	 */
	public Vector getEventNames(){	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT \"ename\"  FROM \"event\"";

	        System.out.println(query);
	        rs = stmt.executeQuery(query);

	        Data = new Vector<Vector<String>>();        
	        while(rs.next())    
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("ename"));        	
	           	Data.add(D);
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for event name failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	 }
	

	/**
	 * return category type only from categories in items
	 * @return - vector
	 */
	public Vector getResCatDetails()
	{	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;
	
	    ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();
	        
	        Statement stmt = dbConn.createStatement();
	
	        String query = "SELECT c.\"Category\"  FROM \"Items\" i, \"ItemCategory\" c "
	        		+ "WHERE i.\"cat_id\"=c.\"cat_id\" GROUP BY i.\"cat_id\", c.\"Category\" ";
	
	        System.out.println(query);
	        rs = stmt.executeQuery(query);
	
	        Data = new Vector<Vector<String>>();
	        
	        while(rs.next())
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("Category"));        	
	           	Data.add(D);
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for Category details failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	}


public String getItemID(String catid, String brandid)
{
	    
    String ret="";
	String val="";
	
	Connection dbConn = null;
	
	if (dbConn==null)
	{
		dbConn = Con.connect();
	}
	
	try {
		 ResultSet rs;
		 Statement stmt = dbConn.createStatement();
		 val = "SELECT i.\"itemID\" FROM \"Items\" i WHERE  i.\"cat_id\"='"+catid+"' AND i.\"brand_id\"='"+brandid+"' ";

		 rs = stmt.executeQuery(val);
		 while (rs.next()){
			 ret = rs.getString("itemID");
			 System.out.println("itemID -> "+ret);
		 }
		 System.out.println("Query -> "+val);
	} catch (SQLException sQLException) {
        System.out.println(sQLException + "-----------Select query for itemID failed");
	}
	finally{
        //Close the db connection
		Con.close(dbConn);
    }
	return ret;

}

	/**
	 * return brand types only from the items
	 * @param category
	 * @return - vector
	 */
	public Vector getResNameDetails(String category){	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;
	
	 ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();
	
	        String query = "SELECT b.\"BrandName\"  FROM \"Items\" i, \"ItemBrand\" b WHERE i.\"brand_id\"=b.\"brand_id\" "
	        		+ "GROUP BY i.brand_id, b.\"BrandName\" ";
	
	        System.out.println(query);
	        rs = stmt.executeQuery(query);
	
	        Data = new Vector<Vector<String>>();        
	        while(rs.next())  
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("BrandName"));        	
	           	Data.add(D);
	        }
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for BrandName failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
    }

public Vector getItemTypeDetails(){	
	Vector<Vector<String>> Data = null;
    Connection dbConn = null;

 ResultSet rs= null;
    try{
        //Connect to the DB
        dbConn = Con.connect();        
        Statement stmt = dbConn.createStatement();

        //Select the JobCatNames
        String query = "SELECT type  FROM \"Items\" GROUP BY type";

        System.out.println(query);
        rs = stmt.executeQuery(query);

        Data = new Vector<Vector<String>>();        
        while(rs.next())        {
        	Vector<String> D = new Vector<String>();        	
        	D.add(rs.getString("type"));        	
           	Data.add(D);
           	}
    } catch (SQLException sQLException) {
        System.out.println(sQLException + "-----------Select query failed");
    }finally{
        //Close the db connection
    	Con.close(dbConn);
    }
    return Data ;
    }

public Vector getItemNameDetails(){	
	Vector<Vector<String>> Data = null;
    Connection dbConn = null;

 ResultSet rs= null;
    try{
        //Connect to the DB
        dbConn = Con.connect();        
        Statement stmt = dbConn.createStatement();

        //Select the JobCatNames
        String query = "SELECT name  FROM \"Items\" GROUP BY name";

        System.out.println(query);
        rs = stmt.executeQuery(query);

        Data = new Vector<Vector<String>>();        
        while(rs.next())        {
        	Vector<String> D = new Vector<String>();        	
        	D.add(rs.getString("name"));        	
           	Data.add(D);
           	}
    } catch (SQLException sQLException) {
        System.out.println(sQLException + "-----------Select query failed");
    }finally{
        //Close the db connection
    	Con.close(dbConn);
    }
    return Data ;
    }
public Vector getItemBrandDetails(){	
	Vector<Vector<String>> Data = null;
    Connection dbConn = null;

 ResultSet rs= null;
    try{
        //Connect to the DB
        dbConn = Con.connect();        
        Statement stmt = dbConn.createStatement();

        //Select the JobCatNames
        String query = "SELECT brand  FROM \"Items\" GROUP BY brand";

        System.out.println(query);
        rs = stmt.executeQuery(query);

        Data = new Vector<Vector<String>>();        
        while(rs.next())        {
        	Vector<String> D = new Vector<String>();        	
        	D.add(rs.getString("brand"));        	
           	Data.add(D);
           	}
    } catch (SQLException sQLException) {
        System.out.println(sQLException + "-----------Select query failed");
    }finally{
        //Close the db connection
    	Con.close(dbConn);
    }
    return Data ;
    }


}

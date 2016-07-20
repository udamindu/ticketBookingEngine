package com.tbe.controller;
// Author : Sanju
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class ResourseController {
	DBConnect Con = DBConnect.getInstance();
	public ResourseController(){
		
	}
	
	// Insert Query for adding new items
	public boolean addNewResourseN(String cat, String brand, String admin_cus, String cost, String description, String length, String width)
	{				
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				String brandID = getBrandID(brand);
				
				String Query="INSERT INTO \"Tables\" (\"brand_id\",\"cat_id\",\"adminCus\",\"price\",\"description\", \"length\", \"width\") VALUES ('"+brandID+"','"+cat+"','"+admin_cus+"','"+cost+"','"+description+"', '"+length+"', '"+width+"')";
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
	
	// Insert Query for adding new items for tables
	public boolean addNewResourseN(String cat, String name, String admin_cus, String cost, String description)
	{	
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				String brandID = getBrandID(name);
				
				String Query="INSERT INTO \"Items\" (\"brand_id\",\"cat_id\",\"adminCus\",\"price\",\"description\") VALUES ('"+brandID+"','"+cat+"','"+admin_cus+"','"+cost+"','"+description+"')";
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
	
	// Insert Query for adding quantity for items
		public boolean addNewQuantity(String itemid, String category, String brand, String description)
		{			
			boolean state = false;	
			Connection dbConn = null;
			
			if (dbConn==null)
			{
				dbConn = Con.connect();
			}
			try {
					Statement stmt = dbConn.createStatement();
					String catName = getCategoryName(category);
					
					String Query="INSERT INTO \"ItemQuantitiy\" (\"itemId\",\"category\",\"brand\",\"description\") VALUES ('"+itemid+"','"+catName+"','"+brand+"','"+description+"')";
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
		       System.out.println(sQLException + "-----------INSERT query for ItemQuantitiy failed");
			}
			finally{
		       //Close the db connection
				Con.close(dbConn);
		}
			return state;		
		}
	
	// update query for Items
	public boolean updateNewResourseN(String itemID, String catID, String brandName, String cost, String description, String length, String width)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				String brandid = getBrandID(brandName);
				
				String Query="UPDATE \"Tables\" SET \"cat_id\"="+catID+",\"brand_id\"="+brandid +",\"price\"='"+cost+"',\"description\"='"+description+"' ,\"length\"='"+length+"' ,\"width\"='"+width+"' WHERE \"itemID\"='"+itemID+"' )";
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
	       System.out.println(sQLException + "-----------UPDATE query for Tables failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;		
	}
	
	// update query for Items
	public boolean updateNewResourseN(String itemID, String catID, String brand, String cost, String description)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				String brandID = getBrandID(brand);
				String Query="UPDATE \"Items\" SET \"cat_id\"="+catID+",\"brand_id\"="+brandID +",\"price\"='"+cost+"',\"description\"='"+description+"'  WHERE \"itemID\"='"+itemID+"' )";
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
	       System.out.println(sQLException + "-----------UPDATE query for Items failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;
		
	}
	
	// Delete Items according to the itemID
	public boolean deleteResource(String id)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				int idd = Integer.parseInt(id);
				String Query = "DELETE FROM \"Items\" WHERE \"itemID\"='"+id+"' )";
				String Query2 = "DELETE FROM \"ItemQuantitiy\" WHERE \"itemId\"='"+id+"' )";
			 	System.out.print(Query);	
				System.out.print(Query2); 
				int result1 = stmt.executeUpdate(Query);
				int result2 = stmt.executeUpdate(Query2);
				if (result1 == 1 && result2 == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
			 System.out.println("Query -> "+Query);
			 System.out.println("Query -> "+Query2);
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------DELETE query for Tables, ItemQuantitiy failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;
	}
	
	// Delete Tables according to the itemID
	public boolean deleteTables(String id)
	{		
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
				Statement stmt = dbConn.createStatement();
				int idd = Integer.parseInt(id);
				String Query = "DELETE FROM \"Tables\" WHERE \"itemID\"='"+id+"' )";
				String Query2 = "DELETE FROM \"ItemQuantitiy\" WHERE \"itemId\"='"+id+"' )";
			 	System.out.print(Query);	
				System.out.print(Query2); 
				int result1 = stmt.executeUpdate(Query);
				int result2 = stmt.executeUpdate(Query2);
				if (result1 == 1 && result2 == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
			 System.out.println("Query -> "+Query);
			 System.out.println("Query -> "+Query2);
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------DELETE query for Tables, ItemQuantitiy failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;
	}
	
	
	/**
	 * update total quantity
	 * @param tot - 100
	 * @param id - 1
	 * @return - true
	 */
public boolean updateQuantityTotal(String tot,String id) {
			
		boolean state = false;	
		Connection dbConn = null;
		
		if (dbConn==null)
		{
			dbConn = Con.connect();
		}
		try {
			 Statement stmt = dbConn.createStatement();
			 int idd = Integer.parseInt(id);
			 String query = "UPDATE \"ItemQuantitiy\" set \"totalAmount\" = '"+tot+"' where \"itemId\" = "+idd+";";
			 int result = stmt.executeUpdate(query);
				if (result == 1)
				{
					state = true;
				} 
				else
				{
					state = false;
				}
			 System.out.println("Query -> "+query);
		} catch (SQLException sQLException) {
	       System.out.println(sQLException + "-----------UPDATE query for totalAmount failed");
		}
		finally{
	       //Close the db connection
			Con.close(dbConn);
	}
		return state;
}
	
/**
 * update damage quantity
 * @param damage - 30
 * @param id - 1
 * @return - true
 */
public boolean updateQuantityDamage(String damage,String id) {
	
	boolean state = false;	
	Connection dbConn = null;
	
	if (dbConn==null)
	{
		dbConn = Con.connect();
	}
	try {
		 Statement stmt = dbConn.createStatement();
		 int idd = Integer.parseInt(id);
		 String query = "UPDATE \"ItemQuantitiy\" set \"damageAmount\" = '"+damage+"' where \"itemId\" = "+idd+";";
		 int result = stmt.executeUpdate(query);
			if (result == 1)
			{
				state = true;
			} 
			else
			{
				state = false;
			}
		 System.out.println("Query -> "+query);
	} catch (SQLException sQLException) {
       System.out.println(sQLException + "-----------UPDATE query for damageAmount failed");
	}
	finally{
       //Close the db connection
		Con.close(dbConn);
   }
	return state;
}

	// Return item_ID according to the catID,BrandID, description
		public String getItemID(String CatID, String brand, String descript)
		{
			String ret="";
			String val="";
			String brandId = getBrandID(brand);
			
			Connection dbConn = null;
			
			if (dbConn==null)
			{
				dbConn = Con.connect();
			}
			
			try {
				 ResultSet rs;
				 Statement stmt = dbConn.createStatement();
				 val = "SELECT \"itemID\" FROM \"Items\" WHERE \"brand_id\"='"+brandId+"' AND \"cat_id\"='"+CatID+"' AND \"description\"='"+descript+"' ";
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
		 * return total quantity for that item id
		 * @param itemID - 
		 * @return - 30
		 */
		public String getTotalAmt(String itemID)
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
				 val = "SELECT \"totalAmount\" FROM \"ItemQuantitiy\" WHERE \"itemId\"='"+itemID+"' ";
				 rs = stmt.executeQuery(val);
				 while (rs.next()){
					 ret = rs.getString("totalAmount");
					 System.out.println("totalAmount -> "+ret);
				 }
				 System.out.println("Query -> "+val);
			} catch (SQLException sQLException) {
		        System.out.println(sQLException + "-----------Select query for totalAmount failed");
			}
			finally{
		        //Close the db connection
				Con.close(dbConn);
		    }
			return ret;
		}
		
		/**
		 * return damage quantity for that item id
		 * @param itemID - 1
		 * @return - 20
		 */
		public String getDmgAmt(String itemID)
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
				 val = "SELECT \"damageAmount\" FROM \"ItemQuantitiy\" WHERE \"itemId\"='"+itemID+"' ";
				 rs = stmt.executeQuery(val);
				 while (rs.next()){
					 ret = rs.getString("damageAmount");
					 System.out.println("damageAmount -> "+ret);
				 }
				 System.out.println("Query -> "+val);
			} catch (SQLException sQLException) {
		        System.out.println(sQLException + "-----------Select query for damageAmount failed");
			}
			finally{
		        //Close the db connection
				Con.close(dbConn);
		    }
			return ret;
		}
		
		
		public String getItemIDOfTable(String CatID, String brandName, String descript)
		{
			String ret="";
			String val="";
			String brandID = getBrandID(brandName);
			
			Connection dbConn = null;
			
			if (dbConn==null)
			{
				dbConn = Con.connect();
			}
			
			try {
				 ResultSet rs;
				 Statement stmt = dbConn.createStatement();
				 val = "SELECT \"itemID\" FROM \"Tables\" WHERE \"brand_id\"='"+brandID+"' AND \"cat_id\"='"+CatID+"' AND \"description\"='"+descript+"' ";
				 rs = stmt.executeQuery(val);
				 while (rs.next()){
					 ret = rs.getString("itemID");
					 System.out.println("itemID -> "+ret);
				 }
				 System.out.println("Query -> "+val);
			} catch (SQLException sQLException) {
		        System.out.println(sQLException + "-----------Select query for itemID of Tables failed");
			}
			finally{
		        //Close the db connection
				Con.close(dbConn);
		    }
			return ret;
		}
	
	// Return brand_id according to the BrandName
	public String getBrandID(String brand)
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
			 val = "SELECT \"brand_id\" FROM \"ItemBrand\" WHERE \"BrandName\"='"+brand+"' ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("brand_id");
				 System.out.println("brand_id -> "+ret);
			 }
			 System.out.println("Query -> "+val);
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for brandID failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}
	
	// Return cat_id according to the ItemCategory
	public String getCategoryID(String cat)
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
			 val = "SELECT \"cat_id\" FROM \"ItemCategory\" WHERE \"Category\"='"+cat+"' ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("cat_id");
				 System.out.println("cat_id -> "+ret);
			 }
			 System.out.println("Query -> "+val);
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for catID failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}
	
	public String getCategoryName(String catid)
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
			 val = "SELECT \"Category\" FROM \"ItemCategory\" WHERE \"cat_id\"='"+catid+"' ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("Category");
				 System.out.println("Category -> "+ret);
			 }
			 System.out.println("Query -> "+val);
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for CategoryName failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}
	
	public String getBrandName(String brandid)
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
			 val = "SELECT \"BrandName\" FROM \"ItemBrand\" WHERE \"brand_id\"='"+brandid+"' ";
			 rs = stmt.executeQuery(val);
			 while (rs.next()){
				 ret = rs.getString("BrandName");
				 System.out.println("BrandName -> "+ret);
			 }
			 System.out.println("Query -> "+val);
		} catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query for BrandName failed");
		}
		finally{
	        //Close the db connection
			Con.close(dbConn);
	    }
		return ret;
	}
	
	
public Vector getQuantityDetails(){
		
		Vector<Vector<String>> qSearch = null;
		Connection dbConn = null;
		ResultSet rs = null;
		
		try{
			
			dbConn = DBConnect.connect();
			Statement stmt = dbConn.createStatement();
			String query = "select \"itemId\",\"category\",\"brand\",\"description\",\"totalAmount\",\"damageAmount\" from \"ItemQuantitiy\" ";
			rs = stmt.executeQuery(query);
			qSearch = new Vector<Vector<String>>();
			
			while (rs.next()) {
                Vector<String> row = new Vector<String>();
                row.add(rs.getString("itemId")); 
                row.add(rs.getString("category")); 
                row.add(rs.getString("brand")); 
                row.add(rs.getString("description")); 
                row.add(rs.getString("totalAmount"));
                row.add(rs.getString("damageAmount")); 
                qSearch.add(row);
            }
			
		}catch (SQLException sQLException) {
			System.out.println(sQLException + "-----------Select query for getQuantityDetails failed"); 
		}finally{
			
			DBConnect.close(dbConn);
		}
			return qSearch;
	}

public Vector getQuantityDetails(String category){
	
	Vector<Vector<String>> qSearch = null;
	Connection dbConn = null;
	ResultSet rs = null;
	
	try{
		
		dbConn = DBConnect.connect();
		Statement stmt = dbConn.createStatement();
		String query = "select \"itemId\",\"category\",\"brand\",\"description\",\"totalAmount\",\"damageAmount\" from \"ItemQuantitiy\" where \"category\"='"+category+"'";
		rs = stmt.executeQuery(query);
		qSearch = new Vector<Vector<String>>();
		
		while (rs.next()) {
            Vector<String> row = new Vector<String>();
            row.add(rs.getString("itemId")); 
            row.add(rs.getString("category")); 
            row.add(rs.getString("brand")); 
            row.add(rs.getString("description")); 
            row.add(rs.getString("totalAmount"));
            row.add(rs.getString("damageAmount")); 
            qSearch.add(row);
        }
		
	}catch (SQLException sQLException) {
		System.out.println(sQLException + "-----------Select query for QuantityDetails by category failed"); 
	}finally{
		
		DBConnect.close(dbConn);
	}
		return qSearch;
}

public String getCategory() {
	String returnString = "";
	String details = "";
	Connection dbConn = null;
	ResultSet rs = null;
	if (dbConn == null) {
		dbConn = Con.connect();
	}
	try {
		Statement stmt = dbConn.createStatement();
		String query = "select * from \"ItemCategory\"";
		System.out.println(query);
		rs = stmt.executeQuery(query);
		System.out.println("Success");
		returnString = "[";
		while (rs.next()) {	
			details = "{";
			details += "'cat_id' : ";
			details += "'" + rs.getString("cat_id") + "'";
			details += ",";
			details += "'Category' : ";
			details += "'"+rs.getString("Category")+ "'";
			details += "}";
			returnString += (details + ",");
		}
		returnString = returnString.substring(0,returnString.length()-1);
		returnString += "]";
		System.out.println ("Return String is -- >" + returnString);
	} catch (SQLException sQLException) {
		System.out.println(sQLException
				+ "-----------Select query for getCategory failed");
	} finally{
		System.out.println("Database execution complete");
	}

	return returnString;
}

public String getBrandsCat() {
	String returnString = "";
	String details = "";
	Connection dbConn = null;
	ResultSet rs = null;
	if (dbConn == null) {
		dbConn = Con.connect();
	}
	try {
		Statement stmt = dbConn.createStatement();
		String query = "select * from \"ItemBrand\"";
		System.out.println(query);
		rs = stmt.executeQuery(query);
		System.out.println("Success");
		returnString = "[";
		while (rs.next()) {	
			details = "{";
			details += "'catID' : ";
			details += "'" + rs.getString("catID") + "'";
			details += ",";
			details += "'BrandName' : ";
			details +=  "'"+rs.getString("BrandName")+ "'";
			details += "}";
			returnString += (details + ",");
		}
		returnString = returnString.substring(0,returnString.length()-1);
		returnString += "]";
		System.out.println ("Return String is -- >" + returnString);
	} catch (SQLException sQLException) {
		System.out.println(sQLException
				+ "-----------Select query for getBrand failed");
	} finally{
		System.out.println("Database execution complete");
	}

	return returnString;
}
	
	// Get BrandName from ItemBrand table
	public Vector getItemBrandDetails()
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
	        while(rs.next())    
	        {
	        	Vector<String> D = new Vector<String>();        	
	        	D.add(rs.getString("BrandName"));        	
	           	Data.add(D);
	      	}
	    } catch (SQLException sQLException) {
	        System.out.println(sQLException + "-----------Select query ItemBrandDetails failed");
	    }finally{
	        //Close the db connection
	    	Con.close(dbConn);
	    }
	    return Data ;
	    }
	
	// Get BrandName According to the Category name, merging tables ItemCategory and ItemBrand
	public Vector getItemBrandDetails(String Category)
	{	
		Vector<Vector<String>> Data = null;
	    Connection dbConn = null;

	 ResultSet rs= null;
	    try{
	        //Connect to the DB
	        dbConn = Con.connect();        
	        Statement stmt = dbConn.createStatement();

	        String query = "SELECT b.\"BrandName\" FROM \"ItemBrand\" b, \"ItemCategory\" c  WHERE  c.\"cat_id\"=b.\"catID\" AND c.\"Category\"='"+Category+"'";

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
	

	
	// Search item details according to the category
	public Vector SearchResource(String name) 
	{	
		Vector<Vector<String>> Data = null;
        Connection dbConn = null;
	
        ResultSet rs= null;
        try{
            //Connect to the DB
            dbConn =  Con.connect();
            
            Statement stmt = dbConn.createStatement();

            String query = "SELECT i.\"itemID\", c.\"Category\", b.\"BrandName\",  i.\"price\", i.\"description\"  FROM \"Items\" i, \"ItemCategory\" c, \"ItemBrand\" b WHERE b.\"brand_id\"=i.\"brand_id\" AND i.\"cat_id\"=c.\"cat_id\" AND c.\"Category\" like '%"+name+"%'";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();
            	D.add(rs.getString("itemID"));
            	D.add(rs.getString("Category"));
            	D.add(rs.getString("BrandName"));       	
            	D.add(rs.getString("price"));
            	D.add(rs.getString("description"));
               	Data.add(D);
            }           

        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query for search failed");
        }finally{
            //Close the db connection
        	Con.close(dbConn);
        }
        return Data ;
       
	}
	

	/**
	 * return all items details
	 * @return - vector
	 */
	public Vector getResourseDetails()
	{		
		Vector<Vector<String>> Data = null;
        Connection dbConn = null;
	
        ResultSet rs= null;
        try{
            //Connect to the DB
            dbConn = Con.connect();
            
            Statement stmt = dbConn.createStatement();
            String query = "SELECT i.\"itemID\", c.\"Category\", b.\"BrandName\",  i.\"price\", i.\"description\"  FROM \"Items\" i, \"ItemCategory\" c, \"ItemBrand\" b WHERE b.\"brand_id\"=i.\"brand_id\" AND i.\"cat_id\"=c.\"cat_id\" ";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();
            	D.add(rs.getString("itemID"));
            	D.add(rs.getString("Category"));
            	D.add(rs.getString("BrandName"));  
            	D.add(rs.getString("price")); 
            	D.add(rs.getString("description")); 
               	Data.add(D);
            }
        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query for items failed");
        }finally{
            //Close the db connection
        	Con.close(dbConn);
        }
        return Data ;    
    }

	/**
	 * return all table details
	 * @return - vector
	 */
public Vector getTablesDetails()
{		
		Vector<Vector<String>> Data = null;
        Connection dbConn = null;
	
        ResultSet rs= null;
        try{
            //Connect to the DB
            dbConn = Con.connect();
            
            Statement stmt = dbConn.createStatement();
            String query = "SELECT i.\"itemID\", c.\"Category\", b.\"BrandName\",  i.\"price\", i.\"description\", i.\"length\", i.\"width\"  FROM \"Tables\" i, \"ItemCategory\" c, \"ItemBrand\" b WHERE b.\"brand_id\"=i.\"brand_id\" AND i.\"cat_id\"=c.\"cat_id\" ";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();
            	D.add(rs.getString("itemID"));
            	D.add(rs.getString("Category"));
            	D.add(rs.getString("BrandName"));  
            	D.add(rs.getString("price")); 
            	D.add(rs.getString("description")); 
            	D.add(rs.getString("length")); 
            	D.add(rs.getString("width")); 
               	Data.add(D);
            }
        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query for Tables failed");
        }finally{
            //Close the db connection
        	Con.close(dbConn);
        }
        return Data ;    
    }

public Vector getTablesDetails(String id)
{		
		Vector<Vector<String>> Data = null;
        Connection dbConn = null;
	
        ResultSet rs= null;
        try{
            //Connect to the DB
            dbConn = Con.connect();
            
            Statement stmt = dbConn.createStatement();
            String query = "SELECT i.\"itemID\", c.\"Category\", b.\"BrandName\",  i.\"price\", i.\"description\", i.\"length\", i.\"width\"  FROM \"Tables\" i, \"ItemCategory\" c, \"ItemBrand\" b WHERE b.\"brand_id\"=i.\"brand_id\" AND i.\"cat_id\"=c.\"cat_id\" AND i.\"itemID\"="+id+" ";

            System.out.println(query);
            rs = stmt.executeQuery(query);

            Data = new Vector<Vector<String>>();
            
            while(rs.next())
            {
            	Vector<String> D = new Vector<String>();
            	D.add(rs.getString("itemID"));
            	D.add(rs.getString("Category"));
            	D.add(rs.getString("BrandName"));  
            	D.add(rs.getString("price")); 
            	D.add(rs.getString("description")); 
            	D.add(rs.getString("length")); 
            	D.add(rs.getString("width")); 
               	Data.add(D);
            }
        } catch (SQLException sQLException) {
            System.out.println(sQLException + "-----------Select query for Tables failed");
        }finally{
            //Close the db connection
        	Con.close(dbConn);
        }
        return Data ;    
    }



// Return items details according to the item id
public Vector getR(String id)
{
	
	Vector<Vector<String>> Data = null;
    Connection dbConn = null;

 ResultSet rs= null;
    try{
        //Connect to the DB
        dbConn = Con.connect();
        
        Statement stmt = dbConn.createStatement();
        String query = "SELECT i.\"itemID\", c.\"Category\", b.\"BrandName\",  i.\"price\", i.\"description\"  FROM \"Items\" i, \"ItemCategory\" c, \"ItemBrand\" b WHERE b.\"brand_id\"=i.\"brand_id\" AND i.\"cat_id\"=c.\"cat_id\" AND i.\"itemID\"="+id+" ";

        System.out.println(query);
               
        rs = stmt.executeQuery(query);

        Data = new Vector<Vector<String>>();
        
        while(rs.next())
        {
        	Vector<String> D = new Vector<String>();
        	D.add(rs.getString("itemID"));
        	D.add(rs.getString("Category"));
        	D.add(rs.getString("BrandName"));  
        	D.add(rs.getString("price")); 
        	D.add(rs.getString("description")); 
           	Data.add(D);          	
            
            System.out.println(rs.getString("itemID"));
            System.out.println(rs.getString("Category"));
            System.out.println(rs.getString("BrandName"));
            System.out.println(rs.getString("price"));
            System.out.println(rs.getString("description"));
        }       

    } catch (SQLException sQLException) {
        System.out.println(sQLException + "-----------Select query items details failed");
    }finally{
        //Close the db connection
    	Con.close(dbConn);
    }
    return Data ; 
}

	// Return Category details from itemCategory
public Vector getCategoryDetails()
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
        
        while(rs.next())
        {
        	Vector<String> D = new Vector<String>();
        	D.add(rs.getString("Category"));
           	Data.add(D);
        }       

    } catch (SQLException sQLException) {
        System.out.println(sQLException + "-----------Select query CategoryDetails failed");
    }finally{
    	Con.close(dbConn);
    }
    return Data ;
}

	// Return BrandName from ItemBrand
public Vector getBrandNameDetails()
{	
	Vector<Vector<String>> Data = null;
    Connection dbConn = null;

    ResultSet rs= null;
    try{
        //Connect to the DB
        dbConn = Con.connect();
        
        Statement stmt = dbConn.createStatement();

        String query = "SELECT \"BrandName\" FROM \"ItemBrand\" ";

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
        System.out.println(sQLException + "-----------Select query BrandName failed");
    }finally{
    	Con.close(dbConn);
    }
    return Data ;
}

}

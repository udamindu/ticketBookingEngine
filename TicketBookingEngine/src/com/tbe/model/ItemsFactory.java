package com.tbe.model;

import com.tbe.model.*;


public class ItemsFactory {
	 
	    public Items getItem(String cat, String brand, String cost, String description, String length, String width)
	    {
	    	Items items = null;
	    	
	        if(cat.equalsIgnoreCase("3"))
	        {
	        	items =  new Table(cat, brand, cost, description,  length,  width);
	        }
	        else
	        {
	        	items =  new OtherItems(cat, brand, cost, description);
	        }
	        
	        return items;
	    }
	    
	    public Items getItem(String id,String cat, String brand, String cost, String description, String length, String width)
	    {
	    	Items items = null;
	    	
	        if(cat.equalsIgnoreCase("3"))
	        {
	        	items =  new Table(id, cat, brand, cost, description,  length,  width);
	        }
	        else
	        {
	        	items =  new OtherItems(id, cat, brand, cost, description);
	        }
	        
	        return items;
	    }

}

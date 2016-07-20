package com.tbe.model;

import com.tbe.controller.ResourseController;

public abstract class Items {

	public String itemid;
	public String cat;
	public String brand;
	public String cost;
	public String description;
	
	// Constructors
	public Items()
	{
		
	}
	public Items(String cat,String brand,String cost,String description)
	{
		this.cat=cat;
		this.brand=brand;
		this.cost=cost;
		this.description=description;
	}
	public Items(String itemid,String cat,String brand,String cost,String description)
	{
		this.itemid=itemid;
		this.cat=cat;
		this.brand=brand;
		this.cost=cost;
		this.description=description;
	}
	
	public abstract boolean insertData();
	
	public abstract boolean updateData();
	
	public abstract boolean insertQuantity();
	
	
	
	
	public abstract String getItemid();

	public abstract void setItemid(String itemid);

	public abstract String getName();

	public abstract void setName(String name);

	public abstract String getBrand();

	public abstract void setBrand(String brand);

	public abstract String getCost();
	
	public abstract void setCost(String cost);

	public abstract String getDescription();

	public abstract void setDescription(String description);
	
}

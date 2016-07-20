package com.tbe.model;

import com.tbe.controller.ResourseController;

public class Table extends Items {
	
	// Common variables
	private String length;
	private String width;	
	
	// Constructors
	public Table(String cat,String brand,String cost,String description, String length, String width){
		
		super.cat=cat;
		super.brand=brand;
		super.cost=cost;
		super.description=description;
		this.length = length;
		this.width = width;		
	}
	
public Table(String id, String cat,String brand,String cost,String description, String length, String width){
		
		this.itemid = id;
		super.cat=cat;
		super.brand=brand;
		super.cost=cost;
		super.description=description;
		this.length = length;
		this.width = width;		
	}
	
	
	// Methods only for tables
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	
	
	
	// Overridden method from Items
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		super.itemid = itemid;
	}
	public String getName() {
		return cat;
	}
	public void setName(String name) {
		super.cat = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		super.brand = brand;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		super.cost = cost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		super.description = description;
	}
	
	
	@Override
	public boolean insertData() {
		
		ResourseController rc = new ResourseController();
		boolean state =  false;	
		String admin = "admin";
		System.out.println("Cat id - "+cat);
		System.out.println("Brand Name - "+brand);
		state = rc.addNewResourseN(cat, brand, admin, cost, description, length, width);
		return state;
	}
	
	
	@Override
	public boolean updateData() {
		
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		state = rc.updateNewResourseN(itemid, cat, brand, cost, description, length, width);
		return state;
	}
	
	
	@Override
	public boolean insertQuantity(){
		
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		String itemID = rc.getItemIDOfTable(cat, brand, description);
		state = rc.addNewQuantity(itemID, cat, brand, description);
		return state;
	}
	

}

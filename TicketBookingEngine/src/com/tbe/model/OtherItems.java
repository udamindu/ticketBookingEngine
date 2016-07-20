package com.tbe.model;

import com.tbe.controller.ResourseController;

public class OtherItems extends Items {
	
	// Constructors
	public OtherItems(String cat,String brand,String cost,String description){
		super.cat=cat;
		super.brand=brand;
		super.cost=cost;
		super.description=description;
	}
	
	public OtherItems(String id, String cat,String brand,String cost,String description){
		this.itemid = id;
		super.cat=cat;
		super.brand=brand;
		super.cost=cost;
		super.description=description;
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
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		String admin = "admin";
		state = rc.addNewResourseN(cat, brand, admin, cost, description);
		return state;
		
	}

	@Override
	public boolean updateData() {
		
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		state = rc.updateNewResourseN(itemid, cat, brand, cost, description);
		return state;
	}
	
	@Override
	public boolean insertQuantity(){
		
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		String itemID = rc.getItemID(cat, brand, description);
		state = rc.addNewQuantity(itemID, cat, brand, description);
		return state;
	}

}

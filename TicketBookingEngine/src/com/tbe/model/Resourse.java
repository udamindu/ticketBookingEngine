package com.tbe.model;

import com.tbe.controller.DBAccess;
import com.tbe.controller.ResourseController;

public class Resourse {
	
	String itemID;
	String cat;
	String name;
	String cost;
	String description;
	String totalAmt;
	String damageAmt;
	String length;
	String width;
	
	

	public Resourse()
	{
		
	}
	

	public Resourse(String id,String cat,String name, String cost,String description)
	{
		this.itemID=id;
		this.cat=cat;
		this.name=name;
		this.cost=cost;
		this.description=description;
		
	}
	
	public Resourse(String id,String cat,String name, String cost,String description, String length, String width)
	{
		this.itemID=id;
		this.cat=cat;
		this.name=name;
		this.cost=cost;
		this.description=description;
		this.length = length;
		this.width = width;
		
	}
	public Resourse(String cat,String name, String cost,String description)
	{	
		this.cat=cat;
		this.name=name;
		this.cost=cost;
		this.description=description;		
	}
	
	
	public boolean insertData ()
	{
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		String cat_id = rc.getCategoryID(cat);
		System.out.println(cat_id);
		String brand_id = rc.getBrandID(name);
		System.out.println(brand_id);
		String admin = "admin";
		state = rc.addNewResourseN(cat_id, brand_id, admin, cost, description);
		return state;
	}
	
	public boolean updateData()
	{
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		int cat_id = Integer.parseInt(rc.getCategoryID(cat));
		System.out.println(cat_id);
		int brand_id = Integer.parseInt(rc.getBrandID(name));
		System.out.println(brand_id);
		state = rc.updateNewResourseN(itemID, cat, name, cost, description);
		return state;
		
	}
	
	public boolean insertQuantity()
	{
		ResourseController rc=new ResourseController();
		boolean state =  false;	
		String cat_id = rc.getCategoryID(cat);
		System.out.println(cat_id);
		String brand_id = rc.getBrandID(name);
		System.out.println(brand_id);
		String itemID = rc.getItemID(cat_id, brand_id, description);
		state = rc.addNewQuantity(itemID, cat, name, description);
		return state;
	}
		
		
	public String getTotalAmt() {
		return totalAmt;
	}


	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}


	public String getDamageAmt() {
		return damageAmt;
	}


	public void setDamageAmt(String damageAmt) {
		this.damageAmt = damageAmt;
	}


	public String getItemID() {
		return itemID;
	}
	
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

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


}

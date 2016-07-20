package com.tbe.model;

import java.util.Vector;

import com.tbe.controller.DBAccess;
import com.tbe.controller.categoryController;

public class Category {
	
	String catID;
	String cat;
	
	public Category(String CatID, String Cat){
		this.catID = CatID;
		this.cat = Cat;
	}
	
	public Category(){
		
	}
	
	public Category(String Cat){
		this.cat = Cat;
	}	
	
	public boolean insertData()
	{
		boolean state =  false;	
		String checkValue = "";
		categoryController cc = new categoryController();		

		Vector<Vector<String>> Enquiry = cc.getCategoryNames();
		for(int i = 0; i<Enquiry.size(); i++){
			 if(Enquiry.get(i).toString().trim().equalsIgnoreCase(cat))
			  {			
				checkValue = Enquiry.get(i).toString();
				System.out.println("checkValue -> "+checkValue);
				state = false;  
				break;			   
			  }			
		}
		if(!checkValue.equals(cat)){
			state = cc.addNewCategory(cat);			
		}
		return state;		
	}
	
	public String getCatID() {
		return catID;
	}
	public void setCatID(String catID) {
		this.catID = catID;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	

}

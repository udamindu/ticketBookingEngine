package com.tbe.model;

import java.util.Vector;

import com.tbe.controller.brandController;

public class Brand {
	
	String brand_id;
	String brand;
	String catID;
	
	

	/*public Brand(String BrandID, String Brand){
		this.brand_id = BrandID;
		this.brand = Brand;
	}*/
	
	public Brand(String Brand, String CatID){
		this.brand = Brand;
		this.catID = CatID;
	}
	
	
	public Brand(){
		
	}
	
	public Brand(String Brand){
		this.brand = Brand;
	}	
	
	public boolean insertData()
	{
		boolean state =  false;	
		String checkValue = "";
		brandController cc = new brandController();		

		Vector<Vector<String>> Enquiry = cc.getBrandNames();
		for(int i = 0; i<Enquiry.size(); i++){
			 if(Enquiry.get(i).toString().trim().equalsIgnoreCase(brand))
			  {			
				checkValue = Enquiry.get(i).toString();
				System.out.println("checkValue -> "+checkValue);
				state = false;  
				break;			   
			  }			
		}
		if(!checkValue.equals(brand)){
			state = cc.addNewBrand(brand, catID);			
		}
		return state;		
	}
	
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCatID() {
		return catID;
	}

	public void setCatID(String catID) {
		this.catID = catID;
	}

}

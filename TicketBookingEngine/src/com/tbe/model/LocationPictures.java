// Author : Ashen

package com.tbe.model;

import com.tbe.controller.LocationPicturesController;

public class LocationPictures {
	private String PicId;
	private String Name;
	private String Url;
	private String Location;
	private String Description;
	
	LocationPicturesController lpc = new LocationPicturesController();	;
	
	public LocationPictures(){
	}

	
	public LocationPictures(String pName,String pUrl,String pLocation,String pDescription){
		this.Name = pName;
		this.Url = pUrl;
		this.Location = pLocation; 
		this.Description = pDescription;
	}


	public String getPicId() {
		return PicId;
	}


	public String getName() {
		return Name;
	}


	public String getUrl() {
		return Url;
	}


	public String getLocation() {
		return Location;
	}


	public String getDescription() {
		return Description;
	}

	public void setPicid(String id) {
		PicId = id;
	}
	
	public void setName(String name) {
		Name = name;
	}


	public void setUrl(String url) {
		Url = url;
	}


	public void setLocation(String location) {
		Location = location;
	}


	public void setDescription(String description) {
		Description = description;
	}
	
	public boolean insertData ()
	{
		//this.setId();
		boolean state =  false;	
		state = lpc.addNewPicture(Name, Url, Location, Description);
		return state;
	}
	
	/*private void setId(){
		String last = lpc.getLastId();
		int next = Integer.parseInt(last);
		next++;
		this.PicId = next+"";
	}*/
}

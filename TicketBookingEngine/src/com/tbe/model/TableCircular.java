package com.tbe.model;

public class TableCircular implements ITable{
	private String radius;
	
	public void generateDimensions(){		
		int index;
		index = description.indexOf("radius=");
		radius = description.substring(index+7,description.length());
	}

	public String getRadius() {
		return radius;
	}

	public void setRadius(String radius) {
		this.radius = radius;
	}
	
	
}

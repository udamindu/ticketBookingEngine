package com.tbe.model;

public class TableRectangular implements ITable{

	private String xSize;
	private String ySize;
	
	public void generateDimensions(){		
		int xIndex;
		int yIndex;
		xIndex = description.indexOf("length=");
		yIndex = description.indexOf("width=");
		xSize = description.substring(xIndex+7,yIndex);
		ySize = description.substring(yIndex+6,description.length());
	}

	public String getxSize() {
		return xSize;
	}

	public void setxSize(String xSize) {
		this.xSize = xSize;
	}

	public String getySize() {
		return ySize;
	}

	public void setySize(String ySize) {
		this.ySize = ySize;
	}
	
	
}

package com.tbe.model;

public class TableFactory {
	
	public ITable getTable(String tableType){
		switch (tableType) {
		case "circular":
			return  new TableCircular();
		case "rectangular":
			return new TableRectangular();
		default:
			return null;
		}
	}
	
}

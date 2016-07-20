/*
 * Author : Ashen Kleo
 */

package com.tbe.model;

public interface ITable {
	
	String name = "";
	String id = "";
	int quantity = 0;
	String description = "";
	
	public void generateDimensions();
	
	
}

/*
 * Author : Ashen Kleo
 */

package com.tbe.model;

public class TableArrangement {
	private String arrangementId;
	private String name;
	private String background;
	private String tableArray;
	private String location;
	
	public TableArrangement(String arrangementId, String name,
			String background, String tableArray, String location) {
		super();
		this.arrangementId = arrangementId;
		this.name = name;
		this.background = background;
		this.tableArray = tableArray;
		this.location = location;
	}

	public String getArrangementId() {
		return arrangementId;
	}

	public void setArrangementId(String arrangementId) {
		this.arrangementId = arrangementId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getTableArray() {
		return tableArray;
	}

	public void setTableArray(String tableArray) {
		this.tableArray = tableArray;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
}

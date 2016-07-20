package com.tbe.model;

public class SVGPopUp {
	private int id;
	private String name;
	private double tWidth;
	private double tLength;
	private int noOfCovers;
	private int coversPerTable;
	private String metric;
	private int Location;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double gettWidth() {
		return tWidth;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void settWidth(double tWidth) {
		this.tWidth = tWidth;
	}
	public double gettLength() {
		return tLength;
	}
	public void settLength(double tLength) {
		this.tLength = tLength;
	}
	public int getNoOfCovers() {
		return noOfCovers;
	}
	public void setNoOfCovers(int noOfCovers) {
		this.noOfCovers = noOfCovers;
	}
	public int getCoversPerTable() {
		return coversPerTable;
	}
	public void setCoversPerTable(int coversPerTable) {
		this.coversPerTable = coversPerTable;
	}
	public String getMetric() {
		return metric;
	}
	public void setMetric(String metric) {
		this.metric = metric;
	}
	public int getLocation() {
		return Location;
	}
	public void setLocation(int location) {
		Location = location;
	}
	
	
}

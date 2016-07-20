/*
 * Author : ashenkleo@gmail.com
 * A class to generate activity log according to user actions
 * */

package com.tbe.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class History {
	private String type;
	private String dateTime;
	private String iconClass;
	private String url;
	private String caption;
	private String action;
	private String timeFromNow;
	private String attribute;

	public History(String type, String dateTime) {
		super();
		this.type = type;
		this.dateTime = dateTime;
		this.generateInnerData(type);
		this.calculateTimeFromNow(dateTime);
	}
	
	public History(String type, String dateTime, String attribute) {
		super();
		this.type = type;
		this.dateTime = dateTime;
		this.attribute = attribute;
		this.generateInnerData(type);
		this.calculateTimeFromNow(dateTime);
	}

	/* To generate data needed in the ui */
	private void generateInnerData(String pType) {
		switch (pType) {
		case "EditLocationPicture":
			this.iconClass = "fa fa-picture-o icon-green";
			this.caption = "Edited location picture details";
			this.url = "/TicketBookingEngine/views/location-picture-edit/location-picture-edit.jsp?Id="+this.attribute;
			this.action = "Edit";
			break;
		case "DeleteLocationPicture":
			this.iconClass = "fa fa-picture-o icon-red";
			this.caption = "Deleted location picture";
			this.url = "/TicketBookingEngine/views/location-picture-view/location-picture-table.jsp";
			this.action = "Delete";
			break;
		case "AddLocationPicture":
			this.iconClass = "fa fa-picture-o icon-blue";
			this.caption = "Added New location pictures";
			this.url = "/TicketBookingEngine/views/location-picture-view/location-picture-matrix.jsp";
			this.action = "Add";
			break;
		case "AddTableArrangement":
			this.iconClass = "fa fa-building-o icon-blue";
			this.caption = "Added new table arrangement";
			this.url = "/TicketBookingEngine/views/table-arrangement/table-arrangement-selecter.jsp";
			this.action = "Add";
			break;
		case "ClearHistory":
			this.iconClass = "fa fa-history icon-red";
			this.caption = "Cleared Activity Log";
			this.url = "/TicketBookingEngine/views/history/history.jsp";
			this.action = "Delete";
			break;
		case "Search":
			this.iconClass = "fa fa-search";
			this.caption = "Searched with keyword " + this.attribute;
			this.url = "/TicketBookingEngine/SearchResults?kw="+ this.attribute;
			this.action = "Search";
			break;
		case "UpdateLocation":
			this.iconClass = "fa fa-building-o icon-green";
			this.caption = "Edited a location";
			this.url = "/TicketBookingEngine/views/locations-update/update-location.jsp?id="+this.attribute;
			this.action = "Edit";
			break;
		default:
			this.iconClass = "";
			this.caption = "Unknown";
			this.url = "";
			break;
		}
	}

	/* Method to claculate the time difference between current time and activity time */
	private void calculateTimeFromNow(String date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
        String FinalString = "";
        try
        {
            Date updatedDate = simpleDateFormat.parse(date);
            String nowDateString = simpleDateFormat.format(new Date());
            Date nowDate =  simpleDateFormat.parse(nowDateString);
            long diff = nowDate.getTime()-updatedDate.getTime();

            long diffSeconds = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000);
            int diffInDays = (int) ((updatedDate.getTime() - nowDate.getTime()) / (1000 * 60 * 60 * 24));
                           
            if (diffInDays > 1) {
                System.err.println("Difference in number of days (2) : " + diffInDays);
            } else if (diffHours > 24) {

                System.err.println(">24");
            } else if ((diffHours == 24) && (diffMinutes >= 1)) {
                System.err.println("minutes");
            }
            
            if (diffInDays > 0){
            	if (diffInDays == 1){
            		FinalString += diffInDays + "day ";
            	} else {
            		FinalString += diffInDays + "days ";
            	}
            }
            if (diffHours > 0) {
            	if (diffHours == 1){
            		FinalString += diffHours + "hour ";
            	} else {
            		FinalString += diffHours + "hours ";
            	}
            }
            if (diffMinutes > 0) {
            	if (diffMinutes == 1){
            		FinalString += diffMinutes + "minute ";
            	} else {
            		FinalString += diffMinutes + "minutes ";
            	}
            }
            if (diffMinutes == 0 && diffHours == 0 && diffInDays == 0) {
            	FinalString += "few seconds ";
            }
            FinalString += "ago";
            this.timeFromNow = FinalString;
        }
        catch (ParseException ex)
        {
            System.out.println("Exception "+ex);
        }
        finally {
        	
        }
	}

	// Getters and Setters
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getIconClass() {
		return iconClass;
	}

	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getTimeFromNow() {
		return timeFromNow;
	}

	public void setTimeFromNow(String timeFromNow) {
		this.timeFromNow = timeFromNow;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	
}

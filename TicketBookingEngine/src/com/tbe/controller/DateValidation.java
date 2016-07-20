package com.tbe.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateValidation {
		
	/**
	 * This method validates form input dates and times
	 * @param eSdate - starting date to be validated
	 * @param eEdate - ending date to be validated
	 * @return validation status accordingly
	 */
	
	public int validateDateTime(String eSdate,String eEdate){
		
		String sdate[] = eSdate.split(" ");
		String edate[] = eEdate.split(" ");
		int returnValue = -4;
			
		SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeParser = new SimpleDateFormat("HH:mm");
		
		try{
			Date startDate = dateParser.parse(sdate[0]);
			//Date today = Calendar.getInstance().getTime();
			Date endDate = dateParser.parse(edate[0]);
			Date startTime = timeParser.parse(sdate[1]);
			Date endTime = timeParser.parse(edate[1]);
				
				if((endDate.compareTo(startDate))>0){		
					returnValue = 1;	
				}
				else if((endDate.compareTo(startDate))==0){
					if(endTime.after(startTime))
						returnValue = 1;
					else if(endTime.compareTo(startTime)<=0)
						returnValue = -2;
				}
				else
					returnValue = -2;				
			
		}catch (ParseException e) {
				e.printStackTrace();
		}
		return returnValue;
	}
				
}

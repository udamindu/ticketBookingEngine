package com.tbe.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import com.tbe.controller.*;

public class TestPurpose {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		//SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
		DateValidation dv = new DateValidation();
		String sdate = "2015-11-05T17:00";
		String edate = "2015-11-05T16:00";
		int answer = dv.validateDateTime(sdate, edate);
		System.out.println("LOOKKKK MANN "+answer);
		
		/*try {
			Date ss = dateParser.parse("2015-11-04");
			Date ee = dateParser.parse("2015-11-03");
			
			System.out.println(ss.after(ee));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	*/
		
	}

}

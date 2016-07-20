package com.tbe.controller;

import java.util.Vector;

import com.tbe.controller.Ticket;

public class TicketFactory {

	public static Ticket newTicket;
	
	//public static final String[] names = {"Rob", "Joe", "Julie"};
	
	public static AbstractTicketLog getPurchaseLog(String eid){
		
		newTicket = new Ticket();
		
		Vector<Vector<String>> eventpurchases = newTicket.getpurchaseDetails(eid);
		
		if(eventpurchases!=null)
			return new RealTicketLog(eid);
						
		return new NullTicketLog();
	}
}

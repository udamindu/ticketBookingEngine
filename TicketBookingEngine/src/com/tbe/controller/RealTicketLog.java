package com.tbe.controller;

import java.util.Vector;

public class RealTicketLog extends AbstractTicketLog{

	Ticket tc = new Ticket();
	
	public RealTicketLog(String eid) {
		this.eventId = eid;
		this.log = tc.getpurchaseDetails(eid);
	}
	
	@Override
	public Vector<Vector<String>> purchaseLog() {
		return log;
	}
	
	@Override
	public boolean isNil() {
		return false;
	}
}

package com.tbe.controller;

import java.util.Vector;

public abstract class AbstractTicketLog {

	protected String eventId;
	protected Vector<Vector<String>> log;
	
	public abstract boolean isNil();
	public abstract Vector<Vector<String>> purchaseLog();
}

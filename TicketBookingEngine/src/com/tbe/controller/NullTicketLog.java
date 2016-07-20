package com.tbe.controller;

import java.util.Vector;

public class NullTicketLog extends AbstractTicketLog{

	@Override
	public Vector<Vector<String>> purchaseLog() {
		return log;
	}

	@Override
	public boolean isNil() {
		return true;
	}
}

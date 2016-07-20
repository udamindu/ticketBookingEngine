<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="com.tbe.controller.Ticket"%> 

		<%
		if (request.getParameter("eid") != null) {
			Ticket newTicket = new Ticket();
			int previous;
			int count = newTicket.getNumberOfTicketsSold(request.getParameter("eid"));
			if(count==0){				
		%>		
				<%=count+"" %>				
		<%  }else if(count>0){ %>
				<%=count+"" %>	<span class="label label-info">New</span>		
		<%	
			previous = newTicket.getNumberOfTicketsSold(request.getParameter("eid"));
			}
			previous = newTicket.getNumberOfTicketsSold(request.getParameter("eid"));
		}%>
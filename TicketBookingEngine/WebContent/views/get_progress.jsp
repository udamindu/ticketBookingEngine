<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="com.tbe.controller.Ticket"%> 

		<%
		if (request.getParameter("eid") != null) {
			Ticket newTicket = new Ticket();			
			double progress = newTicket.calculateProgress(request.getParameter("eid"));
							
		%>	

					<p>
                        <strong>Progress of Current Event</strong>
                        <span class="pull-right text-muted"><%=progress %>%Complete</span>
                    </p>
                    <div class="progress progress-striped active">
                         <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <%=progress%>%">
                              <span class="sr-only"><%=progress %>%Complete</span>
                          </div>
                     </div>
                     
         <%} %>            
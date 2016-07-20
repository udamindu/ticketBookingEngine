<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tbe.controller.Ticket"%> 
    
    <%
    	String lineData = null;
    	if (request.getParameter("eid") != null) {
			Ticket tc = new Ticket();
			lineData = tc.getLineChartJSON(request.getParameter("eid"));
			if(lineData!=null){
	%>
				<label class="label label-success">Sells per Day</label>
    			<div id="linechart" style="height: 250px;"></div>
    		
    <%  
			}
			else{%>
				<div id="linechart" style="height: 250px;">No details to show !!</div>
			<%}
    	}  
    %>		
    
    
    <script>
    new Morris.Line({
    	  element: 'linechart',
    	  data: <%=lineData%>, 	  
    	  xkey: 'y',
    	  ykeys: ['a'],
    	  labels: ['Sold Tickets']
    	});
    </script>
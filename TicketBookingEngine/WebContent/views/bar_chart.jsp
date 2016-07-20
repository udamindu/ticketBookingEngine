<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tbe.controller.Ticket"%> 
    
    <%
    	String barData = null;
    	if (request.getParameter("eid") != null) {
			Ticket tc = new Ticket();
			barData = tc.getBarchartJSON(request.getParameter("eid"));
			if(barData!=null){
	%>
				<label class="label label-success">Ticket Sells</label>
    			<div id="barchart" style="height: 250px;"></div>
    		
    <%  
			}
			else{%>
				<div id="barchart" style="height: 250px;">No details to show !!</div>
			<%}
    	}  
    %>		
    
    
    <script>
    Morris.Bar({
    	  element: 'barchart',
    	  data: <%=barData%>, 	  
    	  xkey: 'y',
    	  ykeys: ['a'],
    	  labels: ['Sold Tickets']
    	});
    </script>	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="com.tbe.controller.Ticket"%>  
<%@page import="com.tbe.controller.Events"%>



		<%
		if (request.getParameter("eid") != null) {
			Ticket newTicket = new Ticket();
												
		%>		
		<table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">			             

												
					<thead>
						<tr>
							<th>Ticket Id</th>
							<th>Time</th>
							<th>Buyer</th>
							<th>Email</th>
							<th>Contact</th>							                
						</tr>
					</thead>									        								        
									        
					<tfoot>
						<tr>
							<th>Ticket Id</th>
							<th>Time</th>
							<th>Buyer</th>
							<th>Email</th>
							 <th>Contact</th>							                
						</tr>
					</tfoot>																																		
										        
					<tbody id="logTableBody">
						<%		
							Vector<Vector<String>> logVector = newTicket.getpurchaseDetails(request.getParameter("eid"));
							String ticketId="";
							String buyingTime="";
							String buyerName="";
							String buyerMail="";
							String buyerContact="";
							for(Vector<String> Enq:logVector){
								ticketId = Enq.get(0);
								buyingTime = Enq.get(1);
								buyerName = Enq.get(2);
								buyerMail = Enq.get(3);
								buyerContact = Enq.get(4);										
						%>						
						<tr>
																													
							<td style="width: 20%"><%=ticketId %></td>
							<td style="width: 20%"><%=buyingTime %></td>
							<td style="width: 20%"><%=buyerName %></td>
							<td style="width: 20%"><%=buyerMail %></td>
							<td style="width: 20%"><%=buyerContact %></td>						
													
						</tr>
							<%} %>							
					</tbody>
				
		</table> 
		
		<%												
		}
		%>
<script>
	$('#example').DataTable();
</script>		

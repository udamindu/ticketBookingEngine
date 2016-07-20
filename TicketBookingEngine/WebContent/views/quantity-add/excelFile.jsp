<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
  	function openPage(pageURL)
  	{
  	window.location.href = pageURL;
  	}
</script>
 <%
        String exportToExcel = request.getParameter("exportToExcel");
        if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES"))
        {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls"); 
        }
        
 %> 
 
<style type="text/css">
	body {
		margin-top: 20px;
	}
</style>

<table align="center" border="2">
    <thead>            
       <tr bgcolor="lightgreen">
         	<th>itemId</th>
            <th>Category</th>
            <th>Brand</th> 
            <th>Description</th>
            <th>Total Amount</th>
            <th>Damaged Amount</th>                                        
      </tr>
   </thead>
                                
  <tbody>
                                
 	<%@page import="java.util.*"%>
    <%@page import="java.lang.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.tbe.controller.*"%>
	<%@page import="com.tbe.model.*"%>
	<%
			ResourseController em = new ResourseController();
			String itemID;
			String category;
			String name;
			String description;
			String totalAmt;
			String damageAmt;
									
			Resourse rm;
				
			Vector<Vector<String>> Enquiry;		
						
			
			Enquiry = em.getQuantityDetails();
								
			for(Vector<String> Enq:Enquiry)
			{
									
				String QString = null;
				rm=new Resourse();
				rm.setItemID(Enq.get(0));
				rm.setCat(Enq.get(1));
				rm.setName(Enq.get(2));									
				rm.setDescription(Enq.get(3));	
				rm.setTotalAmt(Enq.get(4));
				rm.setDamageAmt(Enq.get(5));
							
	%>                               
     <tr bgcolor="lightblue">
        <td><%=rm.getItemID()%></td>
        <td><%=rm.getCat()%></td>
       	<td><%=rm.getName()%></td>
        <td><%=rm.getDescription()%></td>
        <td><%=rm.getTotalAmt()%></td>
        <td><%=rm.getDamageAmt()%></td>
    </tr>                                   
	<%						
			}
	%>
	<tr></tr>
    
    <tr>
    <button type="button" class="btn btn-default" onclick=openPage("../quantity-add/add-quantity.jsp")>Back </button> 
    </tr>  
       
    </tbody>
                                
</table>


<%
        if (exportToExcel == null) 
        {
%>
    <a href="excelFile.jsp?exportToExcel=YES">Export to Excel</a>
<%
        }
%> 

</body>
</html>
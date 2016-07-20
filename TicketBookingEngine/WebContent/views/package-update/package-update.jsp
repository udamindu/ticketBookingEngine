<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Package</title>

<!-- Angular JS -->
<script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<script language=Javascript>
      
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
      
</script>
<script type="text/javascript">
	function openPage(pageURL)
	{
		/* alert("Check"); */
	window.location.href = pageURL;
	
	}
</script>
</head>

<body>
<script type="text/javascript">
	var app = angular.module('TBE',[]);
	app.controller('Package',function($scope){
		
	});
</script>

<div id="wrapper" ng-app="TBE" ng-controller="Package">
		
<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
<div id="page-wrapper">
<div class="container-fluid">

<div class="row">
<div class="row">

<div class="col-lg-10">
	<h2>Update Packages</h2>
	<div class="table-responsive">
	
	<form id="form1" method="post"	action="/TicketBookingEngine/SearchPackage">

		<div  class="col-lg-4" >
        <label>Search Package From Event Name:</label>
        <input type="text" name="txtsearch" class="form-control" <% if(null!=request.getAttribute("key")){ %> value="<%=request.getAttribute("key").toString() %>" <%}%>>
                               
        <p>
        <p>
                            	
     	</div>     
     	</br>
        </br>
        </br>		

	</form>
	<%
		String msg = null;
		if (null != request.getAttribute("message")) 
		{
			msg = request.getAttribute("message").toString();
	%>
	<div class="alert alert-success">
	<strong>Well done!</strong>
			<%=msg%>
	</div>
	<%
		}
	%>

	<form id="mainform"	action="/TicketBookingEngine/deleteallPackage" method="post">
		<table class="table table-hover table-striped">
			<thead>
				<tr>
				<th></th>
				<!-- 1 -->
				<th>Package Name</th>
				<!-- 2 -->
				<th>Event Name</th>
				<!-- 3 -->
				<th>Description</th>
				<!-- 4 -->
				<th>Total Price</th>
				<!-- 5 -->
				<th>Options</th>
				<!-- 6 -->
				<th></th>
				</tr>
			</thead>

			<tbody>

				<%@page import="java.util.*"%>
				<%@page import="java.lang.*"%>
				<%@page import="java.sql.*"%>
				<%@page import="com.tbe.controller.PackageController"%>
				<%@page import="com.tbe.model.Package"%>
				<%
					PackageController em = new PackageController();
					String itemID;
					String location;
					String name;
					String type;
					String Company;
					String costs;
					String description;

					Package rm;

					Vector<Vector<String>> Enquiry;		
					if (null != request.getAttribute("key")) 
					{
						Enquiry = em.SearchPackage(request.getAttribute("key").toString()); // to search
					} 
					else
					{
						Enquiry = em.getPackageDetails();
					}

					for (Vector<String> Enq : Enquiry) 
					{
						String QString = null;
						String QString2 = null;
						
						rm = new Package();
						rm.setPid(Enq.get(0));
						rm.setName(Enq.get(1));
						rm.setEventName(Enq.get(2));
						rm.setDescription(Enq.get(3));
						rm.setTot(Enq.get(4));

				%>
				<tr>
					<td><input type="checkbox" value="" name="cb_<%=rm.getPid()%>"></td>
					<td><%=rm.getName()%></td>
					<td><%=rm.getEventName()%></td>
					<td><%=rm.getDescription()%></td>
					<td><%=rm.getTot()%></td>
					<%
						QString = "?pid=" + rm.getPid()+"&pname="+rm.getName();
					%>

					<td><button type="button" name="btnEd"	onclick=openPage("/TicketBookingEngine/views/package-update/package-editform.jsp<%=QString%>") class="fa fa-pencil-square-o fa-2x"></button>
						<button type="submit" name="btnDel_<%=rm.getPid()%>" class="fa fa-trash-o fa-2x"></button> 
					</td>

				</tr>


				<%
				}
				%>
		</tbody>

		</table>
		<button type="submit" name="btnDelAll" class="btn btn-danger">Delete Selected</button>
	</form>
</div>
</div>
</div>
</div>
</div>
</div>

<!-- /.row -->
</div>
	
<!-- jQuery -->
<script src="/TicketBookingEngine/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/TicketBookingEngine/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/TicketBookingEngine/bower_components/dist/js/sb-admin-2.js"></script>

</body>

</html>

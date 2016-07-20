<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="/TicketBookingEngine/data1/browserIcon.ico">
<title>Select Arrangement</title>

<!-- Angular JS -->
<script
	src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

<!-- Bootstrap Core CSS -->
<link
	href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Sweet Alert -->
<link
	href="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js"></script>

<!-- Custom Fonts -->
<link
	href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Font Awesome -->
<link
	href="/TicketBookingEngine/bower_components/font-awesome-default/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="/TicketBookingEngine/bower_components/font-awesome-default/font-awesome.css"
	rel="stylesheet" type="text/css">

<!-- Angular bootstrap -->
<script
	src="/TicketBookingEngine/bower_components/angular-bootstrap/ui-bootstrap-tpls-0.13.0.min.js"></script>

<script
	src="/TicketBookingEngine/views/table-arrangement/table-arrangement-selecter.js"></script>

</head>
<body>

	<div id="wrapper" ng-app="TBE" ng-controller="locationpics">
		<div
			ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'">
		</div>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<%@page import="com.tbe.controller.*"%>
					<%@page import="com.tbe.model.*"%>
					<%@page import="com.tbe.servlet.SVGEditorPopupServlet"%>
					<%@page import="com.tbe.model.LocationPictures"%>
					<%@page import="com.tbe.controller.LocationPicturesController"%>
					<%@page import="com.tbe.model.LocationPictures"%>
					<%
					LocationPicturesController lc = new LocationPicturesController();
					TableArrangementController control = new TableArrangementController();
					ArrayList<TableArrangement> arrangements =  null;
			/* 		if (request.getParameter("id")!=null){
						arrangements = control.getArrangements(request.getParameter("id")); */
					/* } else { */
						arrangements = control.getArrangements("1");
						System.out.print("KK"+ arrangements);
					/* } */
				%>
					<div class="row">
						<h4>Table Arrangements</h4>
					</div>
					<div class="row">
						<br>
					</div>
					<%String Arrangements = control.getArrangements(); %>
					<div class="row" ng-init="arrangements = <%=Arrangements%>">
					<%String Locs = control.getLocations(); %>
						<div class="form-inline" ng-init="locations=<%=Locs%>">
							Location <select class="form-control" ng-model="selectedLocation" ng-change="selectArrangements()">
								<option ng-repeat="i in locations" value="{{i.id}}">{{i.name}}</option>
							</select>
							<button ng-click="open()" class="btn btn-primary">
								<i class="icon-plus-sign"></i> Add New Arrangement
							</button>
						</div>
					</div>
				</div>
				<div class="row">
					<hr>
				</div>
				<div class="row">
					<%-- <%if (arrangements != null){ %> --%>
					<form action="/TicketBookingEngine/DeleteTableArrangemet" method="post">
						<ul>
							<li ng-repeat="arr in selectedArrangements">
							<a
								href="/TicketBookingEngine/views/table-arrangement/table-arrangement.jsp?id={{arr.id}}"><i
									class="icon-cogs"></i> {{arr.name}} </a>
								<button type="submit" class="btn btn-default btn-sm" name="btnDel_{{arr.id}}" >
									<i class="icon-trash"></i>
								</button></li>

						</ul>
					</form>
					<%-- <%} %> --%>
				</div>
				<div class="row">
					<hr>
				</div>
			</div>

		<script type="text/ng-template" id="myModalContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Add New Table Arrangement</h3>
        </div>
		<form action="/TicketBookingEngine/AddNewArrangement" method="post">
        <div class="modal-body">
          <div class="form-group" ng-init="locations=<%=Locs%>">
    		<label for="exampleInputEmail1">Arrangement Name</label>
    		<input type="text" ng-model="name" class="form-control" name="name" id="exampleInputEmail1" placeholder="Name" required>
  		  </div>
			<div class="form-group">
			<label> Location </label>
					<select name="location" class="form-control" ng-model="locationAddSel" required>
			   			<option ng-repeat="item in locations" value="{{item.id}}">{{item.name}}</option>
					</select>
			</div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" ng-click="ok()" type="submit">OK</button>
            <button class="btn btn-warning" ng-click="cancel()" type="button">Cancel</button>
        </div>
		</form>
    	</script>

		</div>
</body>
</html>
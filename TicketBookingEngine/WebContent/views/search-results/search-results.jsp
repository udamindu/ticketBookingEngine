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
    <link rel="shortcut icon" href="/TicketBookingEngine/data1/browserIcon.ico">

    <title>Search Results</title>

<

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
    
    <!-- Dedicated js -->
    <script type="text/javascript" src="/TicketBookingEngine/views/search-results/search-results.js"></script>
    
    <!-- Js to highlight -->
    <script type="text/javascript" src="/TicketBookingEngine/bower_components/highlighter/jquery.highlight-5.js"></script>
    
    

</head>

<body>

   <div id="wrapper" ng-app="TBE" ng-controller="search">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>
        
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                <% String keyword=null;
					if (null!=request.getAttribute("kw")){
						keyword = request.getAttribute("kw").toString();
					}
				%>
                 
                 <script type="text/javascript">
                 $('body').text().highlight('a');

				</script>
                           
				<%@page import="com.tbe.controller.UniversalSearch"%>
				<%@page import="java.util.*" %>
				<%UniversalSearch search = new UniversalSearch(); %>
                    <div class="col-lg-12">
                    	<div class="row">
                    		<div class="col-md-6"><h4 class="page-header"><b>Showing results for </b> <%=keyword %></h4></div>                      
                        	<div class="col-md-6">
                        		<button type="button" class="btn btn-primary pull-right" ng-click="collapseAll()"><i class="fa fa-minus"></i> Collapse All</button>
                        		<button type="button" class="btn btn-primary pull-right" ng-click="expandAll()"><i class="fa fa-plus"></i> Expand All</button>	
                        	</div>
                        </div>
                        <%
                        	Vector<Vector<String>> locations = search.SearchLocations(keyword);
                        %>
                        <div class="row" style="background-color: cornflowerblue; cursor:pointer" ng-click="toggleLocation()">
                        <h5 style="margin-left: 7px"><i class="fa fa-building-o"></i>  Locations <i ng-show="!isOpenLocation" class="fa fa-plus pull-right" style="margin-right: 7px"></i><i ng-show="isOpenLocation" class="fa fa-minus pull-right" style="margin-right: 7px"></i></h5>
                        </div>
                        <div ng-show="isOpenLocation">
                        <% if(locations.isEmpty()){ %>
                        	No Results
                       <%} else { %>
                        <table class="table table-hover">
                        	<tr>
                        		<th>Name</th>
                        		<th>Category</th>
                        		<th>Description</th>
                        	</tr>
                        	<%for(Vector<String> location: locations){ %>
                  				<tr ng-click="navigate('/TicketBookingEngine/views/locations-update/update-location.jsp?id=<%=location.get(0) %>')">
                  					<td><%=location.get(1) %></td>
                  					<td><%=location.get(2) %></td>
                  					<td><%=location.get(3) %></td>
                  				</tr>
                  			<%} %>
                     	</table>
                     	<% } %>
                     	
                     	<hr>
                     	</div>
                     	<br>
                     	
                     	<%
                        	Vector<Vector<String>> locationPictures = search.searchPictures(keyword);
                        %>
                    	<div class="row" style="background-color: cornflowerblue; cursor:pointer" ng-click="toggleLocPics()">
                        <h5 style="margin-left: 7px"><i class="fa fa-picture-o"></i>  Location Pictures <i ng-show="!isOpenLocPics" class="fa fa-plus pull-right" style="margin-right: 7px"></i><i ng-show="isOpenLocPics" class="fa fa-minus pull-right" style="margin-right: 7px"></i></h5>
                        </div>
                        <div ng-show="isOpenLocPics">
                        <% if(locationPictures.isEmpty()){ %>
                        	No Results
                       <%} else { %>
                        <table class="table table-hover">
                        	<tr>
                        		<th>Image</th>
                        		<th>Name</th>
                        		<th>Description</th>
                        	</tr>
                        	<%for(Vector<String> picture: locationPictures){ 
                        		int index = picture.get(2).indexOf("data1");
                        	%>
                  				<tr ng-click="navigate('/TicketBookingEngine/views/location-picture-edit/location-picture-edit.jsp?Id=<%=picture.get(0) %>')">
                  					<td><img src="/TicketBookingEngine/<%=picture.get(2).substring(index)%>" alt="Smiley face" height="100" width="100" class="img-rounded"></td>
                  					<td><%=picture.get(1) %></td>
                  					<td><%=picture.get(4) %></td>
                  				</tr>
                  			<% } %>
                     	</table>
                     	<%} %>
                     	<hr>
                     	</div>
                     	<br>
                     	<%
                        	Vector<Vector<String>> locationGroups = search.SearchLocGroups(keyword);
                        %>
                    	<div class="row" style="background-color: cornflowerblue; cursor:pointer" ng-click="toggleLocGroups()">
                        <h5 style="margin-left: 7px"><i class="fa fa-table"></i>  Location Groups <i ng-show="!isOpenLocGroups" class="fa fa-plus pull-right" style="margin-right: 7px"></i><i ng-show="isOpenLocGroups" class="fa fa-minus pull-right" style="margin-right: 7px"></i></h5>
                        </div>
                        <div ng-show="isOpenLocGroups">
                        <% if(locationGroups.isEmpty()){ %>
                        	No Results
                       <%} else { %>
                        <table class="table table-hover">
                        	<tr>
                        		<th>Name</th>
                        		<th>Location</th>
                        	</tr>
                        	<%for(Vector<String> picture: locationGroups){ 
                        	%>
                  				<tr  ng-click="navigate('/TicketBookingEngine/views/locations-groups-view/view-groups.jsp')">
                  					<td><%=picture.get(0) %></td>
                  					<td><%=picture.get(2) %></td>
                  				</tr>
                  			<% } %>
                     	</table>
                     	<%} %>
                     	<hr>
                     	</div>
                     	<br>
                     	<%
                        	Vector<Vector<String>> events = search.searchEvent(keyword);
                        %>
                    	<div class="row" style="background-color: cornflowerblue; cursor:pointer" ng-click="toggleEvents()">
                        <h5 style="margin-left: 7px"><i class="fa fa-shopping-cart"></i>  Events <i ng-show="!isOpenEvents" class="fa fa-plus pull-right" style="margin-right: 7px"></i><i ng-show="isOpenEvents" class="fa fa-minus pull-right" style="margin-right: 7px"></i></h5>
                        </div>
                        <div ng-show="isOpenEvents">
                        <table class="table table-hover">
                        	<tr>
                        		<th>Name</th>
                        		<th>Category</th>
                        		<th>Start Time</th>
                        		<th>End Time</th>
                        	</tr>
                        	<%for(Vector<String> picture: events){ %>
                  				<tr>
                  					<td><%=picture.get(2) %></td>
                  					<td><%=picture.get(3) %></td>
                  					<td><%=picture.get(4) %></td>
                  					<td><%=picture.get(5) %></td>
                  				</tr>
                  			<% } %>
                     	</table>
                     	<hr>
                     	</div>
                     	<br>
                     	<%
                        	Vector<Vector<String>> packages = search.SearchPackage(keyword);
                        %>
                    	<div class="row" style="background-color: cornflowerblue; cursor:pointer" ng-click="togglePackage()">
                        <h5 style="margin-left: 7px"><i class="fa fa-building-o"></i>  Package <i ng-show="!isOpenPackage" class="fa fa-plus pull-right" style="margin-right: 7px"></i><i ng-show="isOpenPackage" class="fa fa-minus pull-right" style="margin-right: 7px"></i></h5>
                        </div>
                        <div ng-show="isOpenPackage">
                        <table class="table table-hover">
                        	<tr>
                        		<th>Name</th>
                        		<th>Type</th>
                        		<th>Description</th>
                        	</tr>
                        	<%for(Vector<String> picture: packages){ %>
                  				<tr ng-click="navigate('/TicketBookingEngine/views/package-update/package-update.jsp')">
                  					<td><%=picture.get(2) %></td>
                  					<td><%=picture.get(1) %></td>
                  					<td><%=picture.get(4) %></td>
                  				</tr>
                  			<% } %>
                     	</table>
                     	</div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

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

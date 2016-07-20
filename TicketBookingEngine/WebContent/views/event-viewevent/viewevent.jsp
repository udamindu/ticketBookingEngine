<%@page import="com.tbe.controller.Events"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Event Timeline</title>
    
    <!-- timeline related scripts -->
	<link rel="stylesheet" href="/TicketBookingEngine/bower_components/css/style.css"> <!-- Resource style -->
	<script src="/TicketBookingEngine/bower_components/js/modernizr.js"></script> <!-- Modernizr -->
	
	<link type="text/css" href="/TicketBookingEngine/bower_components/css/inputElements.css" rel="stylesheet"/>
	<link type="text/css" href="/TicketBookingEngine/bower_components/dist/css/bootstrap-theme.css" rel="stylesheet"/>

    <!-- Bootstrap Core CSS -->
    <link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Angular JS -->
    <script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

  <script type="text/javascript">
	var app = angular.module('TBE',[]);
	app.controller('newevent',function($scope){
		
	});
  </script>

    <div id="wrapper" ng-app="TBE" ng-controller="newevent">
		<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
        <!-- Page Content -->
        <div id="page-wrapper">
        
            <div class="container-fluid">
            
            	<!--page heading  -->
                <div class="row">              
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Event Timeline
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="searchevents.jsp">Search Events</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> View Events
                            </li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                
            </div>
            <!-- /.container-fluid -->
            
             <div class="container-fluid" id="tlBody">
            	<section id="cd-timeline" class="cd-container">

					<% Events ev = new Events(); %>
						<%	ArrayList<String> idList = ev.viewEventIDs();
							ArrayList<String> nameList = ev.viewEventNames();						
							ArrayList<String> locationList = ev.viewEventLocations();							
							ArrayList<String> dateList = ev.viewEventDates();						
							ArrayList<String> desList = ev.viewEventDescriptions();
							String eventId="";
							String eventName="";
							String eventDate="";
							String eventLocation="";
							String eventDescription="";
							int count = ev.numOfRows();
							
							for(int i=0;i<count;i++){
								eventId = idList.get(i);
								eventName = nameList.get(i);
								eventDate = dateList.get(i);
								eventLocation = locationList.get(i);
								eventDescription = desList.get(i); %>
					<div class="cd-timeline-block">
						<div class="cd-timeline-img cd-picture">
							<!-- <img src="../img/cd-icon-picture.svg" alt="Picture"> -->
						</div> <!-- cd-timeline-img -->

						<div class="cd-timeline-content">
							<h1><%=eventName %></h1>																							
							<p class="lead" style="font-size:15px">Location: <%=eventLocation %></p>
							<p class="lead" style="font-size:15px"><font color="#6867A1">"<%=eventDescription %>"</font></p>																						
							<a href="/TicketBookingEngine/views/event-eventdashboard/eventdashboard.jsp?eid=<%=eventId %>" class="cd-read-more">Monitor the Event</a>
							
							<span class="cd-date" style="font-size:15px"><%=eventDate %></span>
						</div> <!-- cd-timeline-content -->
					</div> <!-- cd-timeline-block -->
						<%} %>

				</section> <!-- cd-timeline -->
				<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
				<script src="js/main.js"></script> Resource jQuery -->
            </div>
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
	
	<!-- jQuery -->
    <script src="/TicketBookingEngine/bower_components/js/jquery.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/TicketBookingEngine/bower_components/js/main.js"></script> <!-- Resource jQuery -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/TicketBookingEngine/bower_components/js/bootstrap.min.js"></script>

</body>

</html>

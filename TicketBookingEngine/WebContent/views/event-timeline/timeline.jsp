<!-- uthpala damindu bandara -->

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Page Content -->
        <div id="page-wrapper">
            
             <div class="container-fluid" id="tlBody">
            	<section id="cd-timeline" class="cd-container">

					<% Events ev = new Events(); %>
						<%	ArrayList<String> nameList = ev.viewEventNames();						
							ArrayList<String> locationList = ev.viewEventLocations();							
							ArrayList<String> dateList = ev.viewEventDates();						
							ArrayList<String> desList = ev.viewEventDescriptions();
							int count = ev.numOfRows();
							
							for(int i=0;i<count;i++){
							String eventName = nameList.get(i);
							String eventDate = dateList.get(i);
							String eventLocation = locationList.get(i);
							String eventDescription = desList.get(i); %>
					<div class="cd-timeline-block">
						<div class="cd-timeline-img cd-picture">
							<img src="../img/cd-icon-picture.svg" alt="Picture">
						</div> <!-- cd-timeline-img -->

						<div class="cd-timeline-content">
							<h1><%=eventName %></h1>
							<p class="lead" style="font-size:20px"><font color="#6867A1"><%=eventDescription %></font></p>
							<a href="#0" class="cd-read-more">Read more</a>
							<span class="cd-date" style="font-size:20px"><%=eventDate %></span>
						</div> <!-- cd-timeline-content -->
					</div> <!-- cd-timeline-block -->
						<%} %>

					<div class="cd-timeline-block">
						<div class="cd-timeline-img cd-movie">
							<img src="../images/ff.png" alt="Movie">
						</div> <!-- cd-timeline-img -->

						<div class="cd-timeline-content">
							<h1>Title of section 2</h1>
							<p class="lead">Lorem ipsum dolor sit amet, consectetur adipm bitis unde?</p>
							<a href="#0" class="cd-read-more">Read more</a>
							<span class="cd-date">Jan 18</span>
						</div> <!-- cd-timeline-content -->
					</div> <!-- cd-timeline-block -->


					<div class="cd-timeline-block">
						<div class="cd-timeline-img cd-location">
							<img src="../img/cd-icon-location.svg" alt="Location">
						</div> <!-- cd-timeline-img -->

						<div class="cd-timeline-content">
							<h1>Title of section 4</h1>
							<p class="lead">Lorem ipsum dolor sit amet, consecteturora tis qui ut.</p>
							<a href="#0" class="cd-read-more">Read more</a>
							<span class="cd-date">Feb 14</span>
						</div> <!-- cd-timeline-content -->
					</div> <!-- cd-timeline-block -->

					<div class="cd-timeline-block">
						<div class="cd-timeline-img cd-movie">
							<img src="../img/cd-icon-movie.svg" alt="Movie">
						</div> <!-- cd-timeline-img -->

						<div class="cd-timeline-content">
							<h1>Final Section</h1>
							<p class="lead">This is the content of the last section</p>
							<span class="cd-date">Feb 26</span>
						</div> <!-- cd-timeline-content -->
					</div> <!-- cd-timeline-block -->
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

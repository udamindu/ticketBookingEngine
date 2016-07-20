<!-- uthpala damindu bandara -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>New Event Type</title>
    
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
    
    <script type="text/javascript">
    	//function to hide error messages   	
		function hidePara(id){
			$(id).hide();
		}
		//function to hide success message
		setTimeout(function() {
    		$('#success').fadeOut('slow');
		}, 5000);
		
		//function to hide error messages automatically
		setTimeout(function() {
    		$('#err1').fadeOut('slow');
		}, 5000);
    </script>

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
            
                                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Create an Event Type
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="/TicketBookingEngine/views/dashboard/dashboard.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Create an Event Type
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row" >
                	<div class="col-lg-6">
                		
                	</div>
                	<div class="col-lg-6" ></div>
                	
                </div>

                <div class="row">
                    <div class="col-lg-6 form-group">

                        <form name="form1" method="post" action="/TicketBookingEngine/EventType" autocomplete="on">
						<!-- start id-form -->	
						<table class="table" id="id-form">
							<tr>
								<th valign="top">New Event Type:</th>
								<td>
									<input type="text" class="form-control inp-form" name="ttype" placeholder="Event Type" autofocus required/>
								</td>
								<td></td>
							</tr>	
	
							<tr>
								<th valign="top">Type Description:</th>
								<td>
									<textarea rows="" cols="" class="form-control inp-form" name="tdescription"></textarea>
								</td>
								<td></td>
							</tr>
	
							<tr>
								<th>&nbsp;</th>
								<td valign="top">
									<input type="submit" value="Add" class="btn btn-primary" />
									<input type="reset" value="Reset" class="btn btn-warning"  />
								</td>
								<td></td>
							</tr>
						</table>
						</form>

                    </div>
                    
                    <div class="col-lg-3">
                    	
                       <% if(null!=request.getAttribute("message")){
										%>
										<div id="err1" class="alert alert-danger" role="alert">
										<%=request.getAttribute("message").toString() %>
										</div>	
									<%} %>
						<% if(null!=request.getAttribute("message1")){
										%>
										<div id="success" class="alert alert-success" role="alert">
										<%=request.getAttribute("message1") %>
										</div>
									<%} %>			
								
                    </div>
                    
                    <div class="col-lg-3">
                    	                  	
                    </div>
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

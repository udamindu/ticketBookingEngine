<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="shortcut icon" href="/TicketBookingEngine/data1/browserIcon.ico">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Upload Location Pictures</title>

	<!-- Angular JS -->
    <script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->


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

	<!-- Drop Zone File Upload Stuff : Ashen -->
	<script src="/TicketBookingEngine/bower_components/js/dropzone.js"></script>
	<link rel="stylesheet" href="/TicketBookingEngine/bower_components/css\dropzone.css">

</head>

<body>

    <script>
		var app = angular.module('TBE',[]);
		app.controller('locationpics',function($scope){
		
		});
	</script>
   <div id="wrapper" ng-app="TBE" ng-controller="locationpics">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>
        

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Blank</h1>
                        
                        <div>
						<form method="post" action="../../fileUpload" class="dropzone">                        	
						</form>	
							</div>
							<br>
							<form method="" action="location-picture-details-new.jsp">
							Location <select name="LocId" class="form-control">
							<%@page import="com.tbe.controller.LocationPicturesController"%>
							<%@page import="java.util.*" %>
							<% LocationPicturesController lc = new LocationPicturesController();
			   				Vector<Vector<String>> Enquiry = lc.getLocationList();
			   				String Location = null;
							String LocId = null;
			   				for (Vector<String> Enq:Enquiry){
			   				Location = Enq.get(0); 
							LocId = Enq.get(1); %>
			   							
                            <option value="<%=LocId%>"><%=Location %></option>			
							<%}%>
							</select>
							<br>
							<br>
								<input type="submit" value="Next" class="btn btn-primary" onClick="GalleryHover.jsp" />
							</form>                      
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
    <script src="../../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../bower_components/dist/js/sb-admin-2.js"></script>

</body>

</html>

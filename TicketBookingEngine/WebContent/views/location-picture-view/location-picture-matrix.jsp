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

    <title>Location Pictures</title>

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

<!-- Open Window Script : Ashen -->    
	<script type="text/javascript">
 		function openpage(pageURL)
 		{
			window.location.href = pageURL;
 		}
	</script>
	<!-- Open Window Script : Ashen -->    
	<script type="text/javascript">
 		function openPage(pageURL)
 		{
			window.location.href = pageURL;
 		}
	</script>
	
	<!-- Styles for the Gallery : Ashen -->
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: #EEE;
	font: 10px/13px 'Lucida Sans', sans-serif;
}

.wrap {
	overflow: hidden;
	margin: 10px;
}

.box {
	float: left;
	position: relative;
	width: 20%;
	padding-bottom: 20%;
}

.boxInner {
	position: absolute;
	left: 10px;
	right: 10px;
	top: 10px;
	bottom: 10px;
	overflow: hidden;
}

.boxInner img {
	width: 100%;
}

.boxInner .titleBox {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	margin-bottom: -50px;
	background: #000;
	background: rgba(0, 0, 0, 0.5);
	color: #FFF;
	padding: 10px;
	text-align: center;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

body.no-touch .boxInner:hover .titleBox, body.touch .boxInner.touchFocus .titleBox
	{
	margin-bottom: 0;
}

@media only screen and (max-width : 480px) {
	/* Smartphone view: 1 tile */
	.box {
		width: 100%;
		padding-bottom: 100%;
	}
}

@media only screen and (max-width : 650px) and (min-width : 481px) {
	/* Tablet view: 2 tiles */
	.box {
		width: 50%;
		padding-bottom: 50%;
	}
}

@media only screen and (max-width : 1050px) and (min-width : 651px) {
	/* Small desktop / ipad view: 3 tiles */
	.box {
		width: 33.3%;
		padding-bottom: 33.3%;
	}
}

@media only screen and (max-width : 1290px) and (min-width : 1051px) {
	/* Medium desktop: 4 tiles */
	.box {
		width: 25%;
		padding-bottom: 25%;
	}
}
</style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                        <h1 class="page-header">Location Pictures</h1>
                        <%@page import="com.tbe.controller.LocationPicturesController"%>
    			<%@page import="com.tbe.model.LocationPictures"%>    		
				<%@page import="java.util.*" %>
				<%LocationPicturesController lc = new LocationPicturesController();
				Vector<Vector<String>> Enquiry;
				if (null!=request.getAttribute("Loc")){
					if (null!=request.getAttribute("kw")){		
						Enquiry = lc.searchPictures(request.getAttribute("Loc").toString(), request.getAttribute("kw").toString());
					} else {
			   			Enquiry = lc.getPictures(request.getAttribute("Loc").toString());
					}
				} else {
					if (null!=request.getAttribute("kw")){		
						Enquiry = lc.searchPicturesNoLoc(request.getAttribute("kw").toString());
					} else {
			   			Enquiry = lc.getPicturesAll();
					}
				}%>
						<div class="col_lg_12">
									<div class="form-group input-group">
                     		Search
                     		<form action="/TicketBookingEngine/SearchPicturesMatrix" method="post" class="form-inline">
  								<div class="form-group">
  									<label>Location </label>
  								</div>
  								<div class="form-group">
                                <select name="Loc"  class="form-control">
                                	<option value="Any">Any</option>
                                	<%Vector<Vector<String>> Enquir = lc.getLocationList();
			   						String Location = null;
									String LocId = null;
			   						for (Vector<String> Enq:Enquir){
			   						Location = Enq.get(0); 
									LocId = Enq.get(1); %>
			   						<option value="<%=LocId%>"><%=Location %> <% if(request.getAttribute("Loc")==LocId){ %> selected="selected" <%} %></option>			
									<%}%>
                                </select>
                                </div>
                                <div class="form-group">
                                <input type="text" name="search" placeholder="Search Keyword" class="form-control" <% if(null!=request.getAttribute("kw")){ %> value="<%=request.getAttribute("kw").toString() %>" <%}%>>
                                </div>
                                <div class="form-group">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            	</div>
                            	<div class="form-group">
                                <input type="button" value="Table View" class="btn btn-info" onClick=openPage("/TicketBookingEngine/views/location-picture-view/location-picture-table.jsp") >
                            	</div>
                            </form>
                            </div>
                            <div class="raw">
							<div class="wrap">
								<% LocationPictures lp;
			   					String Url = null;
			   					String QString = null;
			   					int count = 0;
			   					for (Vector<String> Enq:Enquiry){
				   					lp = new LocationPictures();
				   					lp.setPicid(Enq.get(0));
			   	   					lp.setName(Enq.get(1)); 
			   	   					lp.setUrl(Enq.get(2));
			   	   					lp.setLocation(Enq.get(3));
			   	   					lp.setDescription(Enq.get(4));
			   	   					int index = lp.getUrl().indexOf("data1");
			   	   					Url = "/TicketBookingEngine/" + lp.getUrl().substring(index);	
			   	   					
			   	   					QString = "?Id="+ lp.getPicId() ;
			   	   				%>
								<!-- Define all of the tiles: -->
								
								<div class="box">
									<div class="boxInner">
										<img width=200 height=150
											src="<%=Url %>" />
										<div class="titleBox">
											Name : <%=lp.getName() %>
											<input type="button" value="Edit" class="btn btn-info" onClick=openPage("/TicketBookingEngine/views/location-picture-edit/location-picture-edit.jsp<%=QString %>") >
										</div>
									</div>
								</div>									
								<%} %>
                        
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
    
    	<script type="text/javascript">
				$(function() {
					// See if this is a touch device
					if ('ontouchstart' in window) {
						// Set the correct [touchscreen] body class
						$('body').removeClass('no-touch').addClass('touch');

						// Add the touch toggle to show text when tapped
						$('div.boxInner img').click(
								function() {
									$(this).closest('.boxInner').toggleClass(
											'touchFocus');
								});
					}
				});
			</script>

</body>

</html>

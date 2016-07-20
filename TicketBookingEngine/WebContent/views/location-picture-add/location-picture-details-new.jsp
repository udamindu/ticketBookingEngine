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

	<!-- Page Title -->
    <title>Location Picture Details</title>

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
	
	<!-- Font Awesome -->
	 <link href="/TicketBookingEngine/bower_components/font-awesome-default/font-awesome.min.css" rel="stylesheet" type="text/css">
	 <link href="/TicketBookingEngine/bower_components/font-awesome-default/font-awesome.css" rel="stylesheet" type="text/css">
	
    <!-- Custom Fonts -->
    <link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Open Window Script : Ashen -->    
	<script type="text/javascript">
 		function openPage(pageURL)
 		{
			window.location.href = pageURL;
 		}
	</script>
	
</head>

<body>
	<script>
		var app = angular.module('TBE',[]);
		app.controller('locationpics',function($scope){
		
		});
	</script>
   <div id="wrapper" ng-app="TBE" ng-controller="locationpics">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Location Pictures
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Data</a>
                            </li>
                             <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Locations</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Add Location Images
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				<%@page import="com.tbe.controller.LocationPicturesController"%>
    			<%@page import="com.tbe.model.LocationPictures"%>    		
				<%@page import="java.util.*" %>

                <div class="row">
                 <div class="col-lg-12">
                            <% String msg=null;
							   if (null!=request.getAttribute("message")){
							   		msg = request.getAttribute("message").toString();
							%>
                            <div class="alert alert-success">
                    			<strong>Well done!</strong> <%=msg %>
                			</div>
							<%}%>   		
                 <!--  start product-table ..................................................................................... -->
				<form id="mainform" action="/TicketBookingEngine/AddPicturesServlet" method = "post">
				<table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table" class="table table-hover">
				<tr>
					<th class="table-header-repeat line-left"><a href="">Picture</a></th>
					<th class="table-header-options line-left"><a href="">Name</a></th>
					<th class="table-header-options line-left"><a href="">Description</a></th>
					<th class="table-header-options line-left"><a href="">Options</a></th>
				</tr>
							
			   	<% LocationPicturesController LPC = new LocationPicturesController();
			   	String eUrl = null;
			   	Vector<Vector<String>> Enquiry = LPC.getTempPic();
			   	String QString = null;
			   	int count = 0;
			   	String Url = null;
			   	String Location = null;
			   	String id= null;
			   	
			   	String Loc = null;
			   	if (null!= request.getAttribute("Loc")){
			   		Loc = request.getAttribute("Loc").toString();
			   	}
			   	if (null!=request.getParameter("LocId")){
			   		Loc = request.getParameter("LocId").toString();
			   	}
			   	
			   	for (Vector<String> Enq:Enquiry){
			   	   id = Enq.get(0);
				   Url = Enq.get(1);
				   Location = Enq.get(2);
			   	   int index = Url.indexOf("data1");
			   	   eUrl = "/TicketBookingEngine/" + Url.substring(index);			   	   
			   	   %>
			   	   
			   	   
				<tr>
					
										
					<td><img src="<%=eUrl %>" alt="Smiley face" height="100" width="100">
						<input type="hidden" name="Url_<%=id %>" value="<%=Url %>">
						<input type="hidden" name="Loc_<%=id %>" value="<%=Loc %>">
					</td>
					<td><input class="form-control" name="Name_<%=id %>" ></td>
					<td><textarea class="form-control"  name="Desc_<%=id %>" rows="3"></textarea></td>
					<td class="options-width">
						<button type="submit" name="btnAd" class="btn btn-primary" value="<%=id %>">Add</button> <button type="submit" name="btnDel" class="btn btn-danger" value="<%=id %>">Delete</button>
					</td>
				</tr>
				<%} %>
				</table>
				<button type="submit" name="btnDone" class="btn btn-success">Done</button>
				</form>
                    
                    </div>
              
                
                <!-- /.row -->
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
    <script src="/TicketBookingEngine/bower_components/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/TicketBookingEngine/bower_components/js/bootstrap.min.js"></script>

</body>

</html>

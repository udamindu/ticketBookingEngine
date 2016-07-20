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

    <title>Edit Location Pictures</title>

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
                <% String msg=null;
								if (null!=request.getAttribute("message")){
									msg = request.getAttribute("message").toString();
							%>
                            <div class="alert alert-danger">
                    			<strong>Oh snap!</strong> Change a few things up and try submitting again.
                			</div>
							<%}%>
							<%@page import="com.tbe.controller.LocationPicturesController"%>
							<%@page import="com.tbe.model.LocationPictures"%>
							<%
								LocationPictures lp;
                    			LocationPicturesController lpc = new LocationPicturesController();
                    			lp = lpc.getPicById(request.getParameter("Id").toString());
							%>
                    <div class="col-lg-12">
                        <h2 class="page-header">Edit Location Picture Details</h2>
                        <form role="form" action="/TicketBookingEngine/UpdatePicDetailsServlet" method="post">
                        	<div class="form-group">
                        		<% 
                    					String pUrl = null;
                    					String PicUrl = lpc.getPicUrl(request.getParameter("Id").toString());
                    					int index = PicUrl.indexOf("data1");
			   	   						pUrl = "../../" + PicUrl.substring(index);	%>	
                        		 <img src="<%=pUrl %>" alt="<%=lp.getName() %>" width=150 height=150 class="img-thumbnail">
                       		<!-- 	<button type="button" class="btn btn-info">Change</button> -->
                       	</div>
                        
							<div class="form-group">
								<input type=hidden id="thisField" name="Id" value="<%=lp.getPicId() %>">
                                <label>Location</label>
                                <select class="form-control" name="Loc">                                	
									<%@page import="java.util.*" %>
									<% LocationPicturesController lc = new LocationPicturesController();
			   						Vector<Vector<String>> Location = lc.getLocationList();
			  					 	String Location1 = null;
									String LocId = null;
			   						for (Vector<String> Loc:Location){
			   							Location1 = Loc.get(0); 
			   							LocId = Loc.get(1); %>
			   							
                                    	<option value="<%=LocId%>" <% if(LocId==lp.getPicId()){ %>selected <%} %>><%=Location1 %></option>
                                    <%}%>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Name</label>
                                <input class="form-control" value="<%=lp.getName() %>" name="Name" required="required">
                            </div>
                            
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" value="<%=lp.getDescription() %>" name="Desc" rows="3"><%=lp.getDescription() %></textarea>
                
                            </div>
                			
                			<div class="form-group">
                				<button type="submit" class="btn btn-primary">OK</button>   <button type="button" class="btn btn-warning">Cancel</button>               				
                			</div>               			                  
                        </form>
                        
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

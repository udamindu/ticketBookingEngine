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

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

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
    
    <script type="text/javascript">
	function openPage(pageURL)
	{
		window.location.href = pageURL;
	}
		
	 function isNumber(evt) {
	        evt = (evt) ? evt : window.event;
	        var charCode = (evt.which) ? evt.which : evt.keyCode;
	        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	            return false;
	        }
	        return true;
	    }
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
	var app = angular.module('SVGApp',[]);
	app.controller('SVGCtrl',function($scope){
		
	});
	</script>
    <div id="wrapper" ng-app="SVGApp" ng-controller="SVGCtrl">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>
        
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Update Location</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-building-o"></i>  <a href="/TicketBookingEngine/views/locations-add/add-location.html">Add New Locations</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> <a href="/TicketBookingEngine/views/locations-groups/location-groups.jsp">Group Locations</a>
                            </li>
                        </ol>                        
                        
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <div class="row">
                    <div class="col-lg-6">

					<%@page import="java.util.*"%>
					<%@page import="java.lang.*"%>
					<%@page import="java.sql.*"%>
					<%@page import="com.tbe.controller.LocationController"%>
					<%
										
					LocationController lc = new LocationController();

					String id=null;
					String name=null;
					String length=null;
					String width=null;
					String scale=null;	
					String covers=null;
					String company=null;
					String category=null;
					String description=null;

						Vector<Vector<String>> Loc = lc.getLocations(request.getParameter("id"));										
																				
									for(Vector<String> Enq:Loc){
										id = Enq.get(0);	
										name = Enq.get(1);										
										length = Enq.get(2);
										width = Enq.get(3);
										scale = Enq.get(4);
										covers = Enq.get(5);
										company = Enq.get(6);
										category = Enq.get(7);
										description = Enq.get(8);	
									}
									System.out.println("I'm Awesome" + category);
						%>


                        <form role="form" method="post" action="/TicketBookingEngine/UpdateLocations">

                           <div class="form-group">
                                <label>Location ID:</label>
                                <label for="name" class="control-label"><%=id %></label> 
                          		<input type="hidden" name="lblID" value="<%=id %>" required>
                            </div>
                           
                            <div class="form-group">
                                <label>Location Name:</label>
                                <input class="form-control" value="<%=name %>" name="txtLName" required>                               
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Location Length:</label>
                                <input class="form-control" value="<%=length %>" name="txtLLength" onkeypress="return isNumber(event)">                                
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Location Width:</label>
                                <input class="form-control" value="<%=width %>" name="txtLWidth" onkeypress="return isNumber(event)" required>                                
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Unit:</label>
                                <input class="form-control" value="<%=scale %>" name="txtUnit" required>                                
                            </div>    
                            
                            
                            <div class="form-group">
                                <label>Covers:</label>
                                <input class="form-control" value="<%=covers %>" name="txtCovers" onkeypress="return isNumber(event)" required>                                
                            </div>                   


                            <div class="form-group">
                                <label>Company Name:</label>
                                <input class="form-control" value="<%=company %>" name="txtComName" required>
                                
                            </div>

                           <div class="form-group" >
                                <label>Category</label>
                              <select class="form-control" name="combCat">
									                               
                                    <option <% if (category.equals("Ball Room")) { %> selected <%} %>>Ball Room</option> 
                                    
                                    <option <% if (category.equals("Auditorium")) { %> selected <%} %>>Auditorium</option>
                                    
                                    <option <% if (category.equals("Conference Hall")) { %> selected <%} %>>Conference Hall</option> 
                                    
                                    <option <% if (category.equals("Parking Lots")) { %> selected <%} %>>Parking Lots</option> 
                                                            
                                </select>  
                                
                                <!-- <input class="form-control" value="<%=category %>" name="txtCatName" >   -->
                                
                            </div>

                            <div class="form-group" >
                                <label>Description</label>
                                <textarea name="txtDes" value="<%=description %>" class="form-control" rows="3" required><%=description %></textarea>
                            </div>
                           

                            <button type="submit" onclick="window.location.href='view-location.jsp'" class="btn btn-default">Submit</button>
                            <button type="reset" class="btn btn-default">Reset</button>
                            
                            <br>
                            <br>
                            <br>

                        </form>
					
                    </div>                                  

                    </div>
                
            
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
</div>
</div>
</body>

</html>

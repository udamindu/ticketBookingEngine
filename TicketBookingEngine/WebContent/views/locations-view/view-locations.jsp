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
	app.controller('loc',function($scope){
		
	});
	</script>
    <div id="wrapper" ng-app="TBE" ng-controller="loc">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>
     
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           View Locations
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-building-o"></i>  <a href="/TicketBookingEngine/views/locations-add/add-location.html">Add New Locations</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> <a href="/TicketBookingEngine/views/locations-groups/location-groups.jsp">Group Locations</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> <a href="/TicketBookingEngine/views/locations-groups-view/view-groups.jsp">View Grouped Locations</a>
                            </li>
                        </ol>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="col-lg-12 ">
                     <form action="/TicketBookingEngine/SearchLocations" method="post" class="form-inline">
                        <div class="form-group">
                                <label>Location Name:</label>
                                <div class="input-group custom-search-form">
                                <input type="text" name="txtsearch" placeholder="Enter Location Name" class="form-control" <% if(null!=request.getAttribute("key")){ %> value="<%=request.getAttribute("key").toString() %>" <%}%>>                                                            
                                
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                                
                            </div>
                                <br>
                                <br>                            
                            	                            	
                            </div>
                            <br>
                     </form>
                        <div class="table-responsive">
                        <form action="/TicketBookingEngine/DeleteLocations" method="post">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                    	<th class="table-header-check"><a id="toggle-all" ></a> </th>
                                        <th>Location Name</th>
                                        <th>Location ID</th>
                                        <th>Length</th>
                                        <th>Width</th>
                                        <th>Unit</th>
                                        <th>Covers</th>
                                        <th>Company</th>
                                        <th>Category</th>
                                        <th>Description</th>
                                        <th>Options</th>
                                    </tr>
                                </thead>
				
				<%@page import="java.util.*"%>
					<%@page import="java.lang.*"%>
					<%@page import="java.sql.*"%>
					<%@page import="com.tbe.controller.LocationController"%>
					<%
						LocationController lc = new LocationController();

						String Lname;	
						String LId;
						String Llength;
						String LWidth;
						String Scale;
						String Covers;
						String ComName;
						String Category;
						String Description;
						
						Vector<Vector<String>> Loc;									
										
				if (null!=request.getAttribute("key"))
				{
			   		Loc = lc.SearchLocations(request.getAttribute("key").toString()); // to search					
				}
				
				else 
				{
			   		Loc = lc.getLocDetailsToTable();
			   	}					
									
				for(Vector<String> Enq:Loc)
				{
					LId = Enq.get(0);
					Lname = Enq.get(1);	
					Llength= Enq.get(2);
					LWidth= Enq.get(3);	
					Scale = Enq.get(4);
					Covers= Enq.get(5);
					ComName = Enq.get(6);
					Category = Enq.get(7);
					Description = Enq.get(8);
									
					%>
				 <tbody>
                                    <tr>
                                    	<td><input name="ct_<%=LId%>" type="checkbox"/></td>
                                        <td><%=Lname%></td>
                                        <td><%=LId%></td>
                                        <td><%=Llength%></td>
                                        <td><%=LWidth%></td>
                                        <td><%=Scale%></td>   
                                        <td><%=Covers%></td>                                         
                                        <td><%=ComName%></td>
                                        <td><%=Category%></td>
                                        <td><%=Description%></td>
                                        
					<td class="options-width">
						<button type="button" name="btnEd_" onclick=openPage("/TicketBookingEngine/views/locations-update/update-location.jsp?id=<%=LId %>") class="btn btn-primary">Edit</button>
						<button type="submit" name="btnDel_<%=LId %>" class="btn btn-danger">Delete</button>
					</td>
                                    </tr>
                                   
                                </body>
				
				<%}%>
				</table>
				<div id="actions-box">
				<a href="" class="action-slider"></a>
				<div id="actions-box-slider">
					<button  type="submit" name="btnDelAll"  class="btn btn-danger">Delete Selected</button>
				</div>
				<div class="clear"></div>
			</div>
				<!--  end product-table................................... --> 
				</form>
			</div>
			<!--  end content-table  -->
		
			<!--  start actions-box ............................................... -->
			
			
			<!-- end actions-box........... -->
						
			<div class="clear"></div>
		 
		</div>
		<!--  end content-table-inner ............................................END  -->
		</td>
		<td id="tbl-border-right"></td>
	</tr>
	<tr>
		<th class="sized bottomleft"></th>
		<td id="tbl-border-bottom">&nbsp;</td>
		<th class="sized bottomright"></th>
	</tr>
	</table>
	<div class="clear">&nbsp;</div>

</div>
                
                
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>

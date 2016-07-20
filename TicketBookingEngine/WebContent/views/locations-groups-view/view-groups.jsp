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
                        <h1 class="page-header">View Location Groups</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-building-o"></i>  <a href="/TicketBookingEngine/views/locations-add/add-location.html">Add New Locations</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> <a href="/TicketBookingEngine/views/locations-groups/location-groups.jsp">Group Locations</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> <a href="/TicketBookingEngine/views/locations-view/view-locations.jsp">View Locations</a>
                            </li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <div class="row">
                    
                    <div class="col-lg-12 ">
                     <form action="/TicketBookingEngine/SearchGroups" method="post" class="form-inline">
                        <div class="form-group">
                                <label>Group Name:</label>
                                <div class="input-group custom-search-form">
                                <input type="text" name="txtsearch" placeholder="Enter Group Name" class="form-control" <% if(null!=request.getAttribute("key")){ %> value="<%=request.getAttribute("key").toString() %>" <%}%>>                                                            
                                
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                                
                            </div>
                                <br>
                                <br>                            
                            	                            	
                            </div>
                            <br>
                     </form>
                        <div class="table-responsive">
                        <form action="/TicketBookingEngine/DeleteGroups" method="post">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                    	<th class="table-header-check"><a id="toggle-all" ></a> </th>                                        
                                        <th>Group Name</th>
                                        <th>Location ID</th>
                                        <th>Location Name</th>                                       
                                                                          
                                    </tr>
                                </thead>
                                
				
			    	<%@page import="java.util.*"%>			    	
					<%@page import="java.lang.*"%>					
					<%@page import="java.sql.*"%>
					<%@page import="com.tbe.controller.LocationController"%>
					<%
						LocationController lc = new LocationController();

						String gName;	
						String LId;
						String lName;																			

						Vector<Vector<String>> Loc;		
						
						if (null!=request.getAttribute("key"))
						{
				   			Loc = lc.searchGroups(request.getAttribute("key").toString());
				   		} 
						else 
						{
				   			Loc = lc.getGroupDetails();
						}								
									
									for(Vector<String> Enq:Loc){										
										    gName = Enq.get(0);
											LId = Enq.get(1);	
											lName = Enq.get(2);																	
										
					%>
				 <tbody>
                                    <tr>
                                    	<td><input name="ct_<%=gName%>" type="checkbox"/></td>
                                         <td><%=gName%></td>
                                        <td><%=LId%></td>
                                        <td><%=lName%></td>                               			
                                    </tr>
                                   
                                </tbody>
				
				<%}%>
				</table>
				<div id="actions-box">
				<a href="" class="action-slider"></a>
				<div id="actions-box-slider">
					<button  type="submit" name="btnDelAll"  class="btn btn-danger">Delete Selected</button>
					 <button type="reset" class="btn btn-default">Reset</button>
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

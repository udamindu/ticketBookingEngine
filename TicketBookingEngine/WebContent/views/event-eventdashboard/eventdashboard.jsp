<!-- uthpala damindu bandara -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="com.tbe.controller.Ticket"%>  
<%@page import="com.tbe.controller.Events"%>  
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Event Dashboard</title>
    
    
    <link type="text/css" href="/TicketBookingEngine/bower_components/css/inputElements.css" rel="stylesheet"/>
	<link type="text/css" href="/TicketBookingEngine/bower_components/dist/css/bootstrap-theme.css" rel="stylesheet"/>

    <!-- Bootstrap Core CSS -->
    <link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    
    <!-- Morris Charts CSS -->
    <link href="../../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Datatable plugin styles and scripts-->	
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" rel="stylesheet">
	
	<script src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
	
	<!--  <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
	
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css">
	<link href="//maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cosmo/bootstrap.min.css" rel="stylesheet"> -->	
    
    <script>
    	function go(){
   			var sel = document.getElementById('switchEvent');
   			var id = sel.options[sel.selectedIndex].value;
    		window.location.href='/TicketBookingEngine/views/event-eventdashboard/eventdashboard.jsp?eid=' + id;
      }
    </script>
    
    <script>
    	/* var hiddenValue = document.getElementById("thisEventName").value;
    	document.getElementById("currentProgressename").innerText = hiddenValue; */
    </script>
    
    <script>
	$(document).ready(function(){		
    	$('[data-toggle="tooltip"]').tooltip(); 
    	setInterval(function (){
    		$.ajax({url: "/TicketBookingEngine/views/gettable.jsp?eid=<%=request.getParameter("eid")%>", success: function(result){
        		
                $("#logTableDiv").html(result);
            }})
    	},10000);
    	setInterval(function (){
    		$.ajax({url: "/TicketBookingEngine/views/get_ticket_count_table.jsp?eid=<%=request.getParameter("eid")%>", success: function(result){
        		
                $("#soldTicketCount").html(result);
            }})
    	},1000);    	
    	setInterval(function (){
    		$.ajax({url: "/TicketBookingEngine/views/bar_chart.jsp?eid=<%=request.getParameter("eid")%>", success: function(result){        		
                $("#barchartDiv").html(result);
            }})
    	},1000);
    	setInterval(function (){
    		$.ajax({url: "/TicketBookingEngine/views/line_chart.jsp?eid=<%=request.getParameter("eid")%>", success: function(result){        		
                $("#linechartDiv").html(result);
            }})
    	},1000);
    	setInterval(function (){
    		$.ajax({url: "/TicketBookingEngine/views/get_progress.jsp?eid=<%=request.getParameter("eid")%>", success: function(result){        		
                $("#progressValue").html(result);
            }})
    	},10000);
    	
	});
	</script>
		   
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
    
    <!-- Tooltip -->
    
    
    <style type='text/css'>
		.fieldset {
  			border: 1px solid #ccc;
  			padding: 10px;
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

    <div id="wrapper">

        <!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		
			<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/TicketBookingEngine/views/dashboard/dashboard.html">Home</a>
            </div>
            
            <ul class="nav navbar-top-links navbar-right">
            
            	 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                             <a href="#">
                                <div id="progressValue">
                                   <!--  <p>
                                        <strong id="currentProgressename">Progress of Current Event</strong>
                                        <span class="pull-right text-muted">40%Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div> -->
                                </div>
                             </a>
                        </li>
                        <li class="divider"></li>                                                         
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>                            
                <!-- /.dropdown -->
                              
            </ul>
            <!-- /.navbar-top-links -->
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	                        
                        <%  Events ev = new Events();
                        	//hardcoded cid
                        	int cid = 3;
                        	Vector<Vector<String>> nameIdPair = ev.getNameIdPair(cid);
                        	String pairName ="";
                        	String pairId = "";
                        %>
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">                            	
                                <select class="form-control" name="switchEvent" id="switchEvent">
								<%  for(Vector<String> pair:nameIdPair){ 
									pairId = pair.get(0);
									pairName = pair.get(1);									
								%>												
									<option value="<%=pairId%>"><%=pairName %></option>
								<%} %>		
								</select>
								
                                <span class="input-group-btn">
                                    <%-- <a href="/TicketBookingEngine/views/event-eventdashboard/eventdashboard.jsp?eid=<%=pairId%>"> --%>
                                    	<button onclick="go()" type="button" class="btn btn-default" data-placement="right" data-toggle="tooltip" title="Switch Event">
                                    		<span class="glyphicon glyphicon-share-alt"></span>
                                    	</button>
                                    <!-- </a> -->
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                                                                
                        <!-- dashboard -->
                        <li>
                            <!-- <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a> -->
                                                     
                        </li>
                                             
                        <li>
                            <a href="/TicketBookingEngine/views/package-update/package-update.jsp?eid=<%=request.getParameter("eid")%>"><i class="glyphicon glyphicon-gift"></i> Packages</a>
                        </li>
                        <li>
                            <a href="/TicketBookingEngine/views/resourse-edit/resourse-update.jsp?eid=<%=request.getParameter("eid")%>"><i class="glyphicon glyphicon-shopping-cart"></i> Resourses</a>
                        </li>
                        <li>
                            <a href="/TicketBookingEngine/views/dashboard/dashboard.html?eid=<%=request.getParameter("eid")%>"><i class="glyphicon glyphicon-map-marker"></i> Locations</a>
                        </li>
                        <li>
                            <a href="/TicketBookingEngine/views/dashboard/dashboard.html?eid=<%=request.getParameter("eid")%>"><i class="glyphicon glyphicon-th"></i> Table Arrangements</a>
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
            
		</nav>
        <!-- Page Content -->
        
        <div id="page-wrapper">
        
            <div class="container-fluid">
            
                                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                    	<div class="page-header">
	                        <h1>
	                            Event Dashboard
	                        </h1>
                        </div>
                        
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="/TicketBookingEngine/views/dashboard/dashboard.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="glyphicon glyphicon-dashboard"></i> Event Dashboard
                            </li>
                            <li class="breadcrumb">
                            	<i class="glyphicon glyphicon-wrench"></i>  <a href="/TicketBookingEngine/views/event-editevents/editevents.jsp?eid=<%=request.getParameter("eid")%>">Edit this Event</a>
                            </li>
                            <li class="breadcrumb">
                                <i class="glyphicon glyphicon-film"></i> <a href="/TicketBookingEngine/views/event-viewevent/viewevent.jsp">Event Timeline</a>
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

				<!-- row: Basic ticket details -->
                <div class="row">
                
                	<%
						if (request.getParameter("eid") != null) {							
							
							Vector<Vector<String>> qSearch = ev.getEvent(request.getParameter("eid"));
							String ename = "";
							String etype = "";		
							String elocation = "";
							
							for(Vector<String> Enq:qSearch){
								ename = Enq.get(1);	
								etype = Enq.get(2);
								elocation = Enq.get(3);
						%>
					<input type="hidden" id="thisEventName" value="<%=ename%>">
                    <div class="col-lg-6 form-group table-responsive">

                        <!--  <form name="form1" method="get" action="/TicketBookingEngine/EventServelet" autocomplete="on"> -->                                             												
						 <input type="hidden" name="id" value="<%=request.getParameter("eid")%>">
						 <div class="panel panel-info">
						 	<div class="panel-heading">
        						<h4 class="panel-title">
          							<!-- <a data-toggle="collapse" href="#ticketsDiv">Tickets</a> -->
          							Tickets
        						</h4>
      						</div>
      						
      						<div id="ticketsDiv">
  							<table class="table .table-condensed" id="id-form">
	
								<tr>
									<th>Event Name</th>
									<th>Tickets Printed</th>
									<th>Tickets Sold</th>								
								</tr>	
								
								<tr class="success">
									<td><%=ename %></td>
									<td>1000</td><!-- should come from db -->
									<td id="soldTicketCount"> </td> <!-- should come from db by ajax request -->
								</tr>			
					
							</table>
							</div>
							
 						</div>						
 						</div>
 						
 						<div class="col-lg-6 form-group table-responsive">
 						<div class="panel panel-info">
						 	<div class="panel-heading">
        						<h4 class="panel-title">
          							<!-- <a data-toggle="collapse" href="#ticketsDiv">Tickets</a> -->
          							Event Details
        						</h4>
      						</div>
      						
      						<div id="ticketsDiv">
  							<table class="table .table-condensed" id="id-form">
	
								<tr>
									<th>Name</th>
									<th>Type</th>
									<th>Location</th>								
								</tr>	
								
								<tr class="success">
									<td><%=ename %></td>
									<td><%=etype %></td><!-- should come from db -->
									<td><%=elocation%></td><!-- should come from db dynamically -->
								</tr>			
					
							</table>
							</div>
							
 						</div>
 						<%}}%>					
 											
						<!-- </form> -->
                    </div>                
                    
                </div>
                <!-- /.row -->
                
                <!-- next row: ticket purchases table -->
                <div class="row">
                	<div class="col-lg-12 form-group table-responsive">
	                	<div class="panel panel-info">
	                		<div class="panel-heading">
	        					<h4 class="panel-title">
	          						<a data-toggle="collapse" href="#ticketslog">Ticket Purchases</a>
	        					</h4>
	        					<div class="pull-right">
            						<div class="btn-group"></div>                        						
        						</div> 
	      					</div>                           
		    				
		    				<div class="panel-body">
		    				
			                	<div id="ticketslog" class="panel-collapse collapse">            	
								
								
									<input type="hidden" name="barVal" id="barVal">
									<div id="logTableDiv">

			                		</div>              	             	
			                	</div>			                			                	
			                </div>	
	                	</div>
 					</div>
                </div>
                
                <!-- next row: charts and graphs -->
                <div class="row">
                	<div class="col-lg-6 form-group" id="linechartDiv">
                		
                	</div>
                	<div class="col-lg-6 form-group" id="barchartDiv">
                		             		         		
                	</div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <!-- <script src="/TicketBookingEngine/bower_components/jquery/dist/jquery.min.js"></script> -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/TicketBookingEngine/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="../../bower_components/raphael/raphael-min.js"></script>
    <script src="../../bower_components/morrisjs/morris.min.js"></script>
    <script src="../../bower_components/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/TicketBookingEngine/bower_components/dist/js/sb-admin-2.js"></script>
    
    <script>
/*     new Morris.Line({
    	 
    	  element: 'myfirstchart',
    	
    	  data: [
    	    { year: '2008', value: 20 },
    	    { year: '2009', value: 10 },
    	    { year: '2010', value: 5 },
    	    { year: '2011', value: 5 },
    	    { year: '2012', value: 20 }
    	  ],
    	  
    	  xkey: 'year',
    	  
    	  ykeys: ['value'],
    	
    	  labels: ['Value']
    	}); */
    
 
	  	     
    </script>
  
</body>

</html>

<!-- uthpala damindu bandara -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.tbe.controller.ToolBox"%>    
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tool Box Arrangement</title>
    
    <!-- Angular js -->
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
    
    <script type="text/javascript">
    
    function tableHide(para,input){
		$(para).hide();
		$(input).show();
	}
	function tableShow(para,input){
		$(para).show();
		$(input).hide();
	}
	
	setTimeout(function() {
		$('#success').fadeOut('slow');
	}, 5000);
	
    </script>

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
                <a class="navbar-brand" href="index.html">SB Admin v2.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
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
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">ToolBox Table Editor</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<% if(null!=request.getAttribute("message")){
										%>
										<div id="success" class="alert alert-success" role="alert">
										<%=request.getAttribute("message").toString() %>
										</div>	
						<%} %>
					</div>
					<div class="col-lg-4"></div>
				</div>
                
                <div class="row">
                	<!-- <div class="col-lg-6" id="addtb">
                		
                		
                	</div> -->
                	<div class="col-lg-12" id="edittb" ng-app="">
                		<table class="table table-striped table-bordered" id="id-form" style="width: 100%">
                		<% ToolBox tb = new ToolBox();
							   Vector<Vector<String>> rectTableInfo = tb.getRectTab();
							   Vector<Vector<String>> circTableInfo = tb.getCircTab();

							%>
							<% 	String name = "";
								String name2 = "";
								int x = 0;
								int y = 0;
								int cx = 0;
								int cy = 0;
								int width = 0;
								int height = 0;
								int r = 0;
								int i= 0 ;
								int k= 5;%>
								
								<tr><p style="color: #00CC66"><b> * 10 px = 1 meter</b></p></tr>
									<tr><th style="width: 14%;color: #5E98EF">Table Name</th>
										<th style="width: 14%;color: #5E98EF">Table Width(px) &lt; 81</th>
										<th style="width: 14%;color: #5E98EF">Table Height(px) &lt; 81</th>
										<th style="width: 14%;color: #5E98EF">Value from X axis(px)</th>
										<th style="width: 14%;color: #5E98EF">Value from Y axis(px)</th>
										<th style="width: 14%;color: #5E98EF">Sample Appearance</th>
										
									</tr>
								
								<%for(Vector<String> Enq:rectTableInfo){
									name = Enq.get(0);
									x = Integer.parseInt(Enq.get(1));
									y = Integer.parseInt(Enq.get(2));
									height = Integer.parseInt(Enq.get(3));
									width = Integer.parseInt(Enq.get(4));
									i++;
									%>
									
									<tr>
																					
										<input type="hidden" name="id" value="<%=name%>">
										
										<td class="warning" style="width: 16%;color: #FF5050"><%=name%></td>
										
										<td style="width: 16%"><p id="pcell<%=i %>" onclick="tableHide('#pcell<%=i %>','#cell<%=i %>')"><%=width%></p><div class="owner" id="cell<%=i %>"><form method="get" action="EditRectTable" id="<%=i %>"><input style="width: 100%" name="id1" type="number" min="20" max="80"  ng-model="v" required="required"><input type="hidden" name="id" value="<%=name%>"><input type="submit" class="btn-default"></form><button class="btn-default" onclick="tableShow('#pcell<%=i %>','#cell<%=i %>')">Cancel</button></div></td>
										<%i++; %>
										<td style="width: 16%"><p id="pcell<%=i %>" onclick="tableHide('#pcell<%=i %>','#cell<%=i %>')"><%=height%></p><div class="owner" id="cell<%=i %>"><form method="get" action="EditRectTable" id="<%=i %>"><input style="width: 100%" name="id2" type="number" min="20" max="80"  ng-model="vv" required="required"><input type="hidden" name="id" value="<%=name%>"><input type="submit" class="btn-default"></form><button class="btn-default" onclick="tableShow('#pcell<%=i %>','#cell<%=i %>')">Cancel</button></div></td>
										
										<td class="warning" style="width: 16%;color: #FF5050"><%=x%></td>
										
										<td class="warning" style="width: 16%;color: #FF5050"><%=y%></td>
										
										<td class="warning" style="width: 16%;color: #FF5050">	<svg width="100%" height="100%">
  																									<rect x="35" y="35" width="{{v}}" height="{{vv}}"
  																									style="fill:blue;stroke:pink;stroke-width:5;opacity:0.5" />
																								</svg>
										</td>				
																	
									</tr>
									
								<% } %>
								</table>
								
								<table class="table table-striped table-bordered" id="id-form" style="width: 100%">
								
									<tr><p style="color: #00CC66"><b> * You Can change Radius value only</b></p></tr>
									<tr><th style="width: 14%;color: #5E98EF">Table Name</th>
										<th style="width: 14%;color: #5E98EF">Table Radius(px) &lt; 71</th>
										<th style="width: 14%;color: #5E98EF">Value from X axis(px)</th>
										<th style="width: 14%;color: #5E98EF">Value from Y axis(px)</th>
										<th style="width: 14%;color: #5E98EF">Sample Appearance</th>
										
									</tr>
								
								<%for(Vector<String> Enq:circTableInfo){
									name2 = Enq.get(0);
									cx = Integer.parseInt(Enq.get(1));
									cy = Integer.parseInt(Enq.get(2));
									r = Integer.parseInt(Enq.get(3));
									k++;
								%>
									<tr>
																					
										<input type="hidden" name="id" value="<%=name2%>">
										
										<td class="warning" style="width: 20%;color: #FF5050"><%=name2%></td>
										
										<td style="width: 20%"><p id="pcell<%=k %>" onclick="tableHide('#pcell<%=k %>','#cell<%=k %>')"><%=r%></p><div class="owner" id="cell<%=k %>"><form method="get" action="EditCircTable" id="<%=k %>"><input style="width: 100%" name="id3" type="number" min="20" max="70" ng-model="z" required="required"><input type="hidden" name="id" value="<%=name2%>"><input type="submit" class="btn-default"></form><button class="btn-default" onclick="tableShow('#pcell<%=k %>','#cell<%=k %>')">Cancel</button></div></td>								
										
										<td class="warning" style="width: 20%;color: #FF5050"><%=cx%></td>
										
										<td class="warning" style="width: 20%;color: #FF5050"><%=cy%></td>	
										
										<td class="warning" style="width: 20%;color: #FF5050">	<svg height="100%" width="100%">
  																									<circle cx="90" cy="75" r="{{z}}" style="fill:blue;stroke:pink;stroke-width:5;opacity:0.5" />
																								</svg>
										</td>		
																	
									</tr>
								
								<%} %>
							
								</table>
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
    
    <!-- jQuery -->
	<script src="/TicketBookingEngine/bower_components/js/jquery.js"></script>
	<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/TicketBookingEngine/bower_components/js/main.js"></script>
	<!-- Resource jQuery -->

	<!-- Bootstrap Core JavaScript -->
	<script src="/TicketBookingEngine/bower_components/js/bootstrap.min.js"></script>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>

<head>
<link
	href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<link rel="shortcut icon"
	href="/TicketBookingEngine/data1/browserIcon.ico">
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/TicketBookingEngine/bower_components/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="/TicketBookingEngine/bower_components/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/TicketBookingEngine/bower_components/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="/TicketBookingEngine/bower_components/css/drag.css" />
<link
	href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<link
	href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.css"
	rel="stylesheet" type="text/css">
<link
	href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<link
	href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css"
	rel="stylesheet">
<link href="/TicketBookingEngine/views/history/HistoryStyles.css"
	rel="stylesheet">
<link
	href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<script src="/TicketBookingEngine/bower_components/js/dropzone.js"></script>
<link rel="stylesheet"
	href="/TicketBookingEngine/bower_components/css/dropzone.css">
<script
	src="/TicketBookingEngine/bower_components/InteractJs/interact-1.2.5.js"></script>
<script
	src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>
<script src="/TicketBookingEngine/bower_components/js/snap.svg-min.js"></script>
<script src="/TicketBookingEngine/bower_components/js/classie.js"></script>
<script
	src="/TicketBookingEngine/bower_components/js/draggabilly.pkgd.min.js"></script>
<script
	src="/TicketBookingEngine/views/table-arrangement/table-arrangement.js"></script>
<script
	src="/TicketBookingEngine/bower_components/jquery/dist/jquery.min.js"></script>
<script
	src="/TicketBookingEngine/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.js"></script>
<script src="/TicketBookingEngine/bower_components/js/sb-admin-2.js"></script>
<script
	src="/TicketBookingEngine/bower_components/angular-bootstrap/ui-bootstrap-tpls-0.13.0.min.js"></script>
<script
	src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js"></script>

<title>Table Arrangement</title>
	<!-- Open Window Script : Ashen -->    
	<script type="text/javascript">
 		function openPage(pageURL)
 		{
			window.location.href = pageURL;
 		}
	</script>
<style>
.draggable {
	cursor: move;
}

,
.svg {
	background-image: url("ABC.jpg")
}
</style>
</head>

<body>

	<%@page import="com.tbe.model.History"%>
	<%@page import="com.tbe.controller.Utilities"%>
	<%@page import="com.tbe.controller.Events"%>
	<%@page import="java.util.*"%>
	<%@page import="java.lang.*"%>
	<%@page import="java.sql.*"%>

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand"
			href="/TicketBookingEngine/views/dashboard/dashboard.html"><i
			class="fa fa-ticket"></i>Ticket Booking Engine</a>
	</div>

	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-messages">
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>Read
							All Messages</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-messages --></li>
		<!-- /.dropdown -->

		<%
			History historyClass;
			Utilities util = new Utilities();
			Vector<Vector<String>> history = util.getHistory();
		%>

		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-history"></i> <i
				class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-tasks">
				<%
					int count = 1;
							for (Vector<String> item : history) {
								if (count > 8) {
									break;
								}
								historyClass = new History(item.get(1), item.get(2),
										item.get(3));
				%>
				<li><a href="<%=historyClass.getUrl()%>">
						<div>
							<i class="<%=historyClass.getIconClass()%>"></i>
							<%=historyClass.getCaption()%>
							<span class="pull-right text-muted small"><%=historyClass.getTimeFromNow()%></span>
						</div>
				</a></li>
				<li class="divider"></li>

				<%
					count++;
							}
				%>

				<li><a class="text-center"
					href="/TicketBookingEngine/views/history/history.jsp"> <strong>See
							All Tasks</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-tasks --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li><a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> New Comment <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
								class="pull-right text-muted small">12 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> Message Sent <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> New Task <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>See
							All Alerts</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-alerts --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i> User
						Profile</a></li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
						Logout</a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>

	<!-- Page Content -->
	<div>

		<%@page import="com.tbe.controller.TableArrangementController"%>
		<%@page import="com.tbe.model.TableArrangement"%>

		<%
			TableArrangementController ctrl = new TableArrangementController();
			String id = null;
			if (request.getParameter("id") != null) {
				id = request.getParameter("id").toString();
			}
			String arrangementId = id;
			TableArrangement arrangement = ctrl
					.getTableArrangement(arrangementId);
			String location = arrangement.getLocation();
		%>

		<div class="container-fluid">
			<div class="row" ng-app="SVGApp" ng-controller="SVGCtrl">
			<div id="backgroundsDiv"></div>
				<script type="text/ng-template" id="myModalContent.html">
                    <div class="modal-header">
                        <h3 class="modal-title">Add Table Set</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Table</label>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control" ng-model="table" ng-options="table as table.name for table in tableList">
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Number of tables</label>
                            </div>
                            <div class="col-md-6">
                                <input ng-model="noOfTables" class="form-control" placeholder="( number )" type="number" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Covers per table</label>
                            </div>
                            <div class="col-md-6">
                                <input ng-model="coversPerTable" class="form-control" placeholder="( covers )" type="number" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
                        <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
                    </div>
                </script>

				<br>
				<div class="col-lg-12">
					<div class="panel panel-primary" style="background-color: #c6c6c6">
						<button class="btn btn-primary" onClick="openPage('/TicketBookingEngine/views/table-arrangement/table-arrangement-selecter.jsp')">
							<i class="icon-undo"></i> Back To Dashboard
						</button>
						<button class="btn btn-primary">
							<i class="icon-undo"></i> Save
						</button>
						<button class="btn btn-primary" ng-click="clearAll();">
							<i class="icon-undo"></i> Clear All
						</button>
						<button class="btn btn-primary" ng-click="popTable();">
							Remove Last Table</button>
						<button class="btn btn-primary pull-right"
							ng-click="isDpOpen = !isDpOpen">Add Blue Print</button>
					</div>
				</div>
				<div ng-show="isDpOpen">
					<div>
						<form method="post" action="../../BlueprintUpload"
							class="dropzone"></form>
					</div>
				</div>
				<hr>
				<script type="text/ng-template" id="myPopoverTemplate.html">
                    <div>lol</div>
                    <div class="form-group">
                        <label>Popup Title:</label>
                        <input type="text" ng-model="dynamicPopover.title" class="form-control">
                    </div>
                </script>

				<script type="text/ng-template" id="addTable.html">
                    <div ng-init="tableListRound=[{'name': 'table1Round','radius': 50},{'name': 'table2Round','radius': 70},{'name': 'table3Round','radius': 58}]"></div>
                    <div ng-init="tableListSquare=[{'name': 'table1','width': 100,'length': 200}, {'name': 'table2','width': 75,'length': 75}, {'name': 'table3','width': 251,'length': 300}]"></div>
                    <div class="modal-header">
                        <h3 class="modal-title">Add Table</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Table</label>
                            </div>
                            <div class="col-md-6">
                                <select ng-show="tableType=='round'" class="form-control" ng-model="table" ng-options="table as table.name for table in tableListRound">
                                    <option disabled value="">- Table -</option>
                                </select>
                                <select ng-show="tableType=='square'" class="form-control" ng-model="table" ng-options="table as table.name for table in tableListSquare">
                                    <option disabled value="">- Table -</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Covers per table</label>
                            </div>
                            <div class="col-md-6">
                                <input class="form-control" type="number" ng-model="coversPerTable" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
                        <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
                    </div>
                </script>

				<script type="text/ng-template" id="addImage.html">
					<div class="modal-header">
                        <h3 class="modal-title">Add Blueprint</h3>
                    </div>
                    <div class="modal-body">
						<div>
							<form method="post" action="/TicketBookingengine/fileUpload" class="dropzone">
							</form>
						</div>
					</div>
				</script>

				<div class="col-md-12" ng-init="allBackgrounds=<%=ctrl.getBackrounds("1")%>">
					<div class="row"
						ng-init="locationDimensions=<%=ctrl.getLocationDimensions(location)%>">
						<div class="col-md-2"
							style="height: 579px; overflow: auto; background-color: mintcream">
							<div class="panel panel-default">
								<div class="panel-heading">
									<label>Toolbar</label>
								</div>
								<div class="panel-body">
									<div class="panel panel-primary">
										<div ng-click="toggleTableTools()" class="panel-heading">
											<label>Tables</label><i ng-if="!isTableToolOpened"
												class="fa fa-chevron-right pull-right"></i><i
												ng-if="isTableToolOpened"
												class="fa fa-chevron-down pull-right"></i>
										</div>
										<div ng-show="isTableToolOpened" class="panel-body">
											<br> <img style="max-width: 120px;"
												src="../../styles/images/squaretable.png" alt="..."
												title="Add Rectangular Shaped Table" class="img-thumbnail"
												ng-click="addTable()"> <br> <img
												style="max-width: 120px;"
												src="../../styles/images/roundtable.png" alt="..."
												class="img-thumbnail" ng-click="addTableRound()">
											<!-- <button class="btn btn=default" ng-click="open()">Table
												Set</button> -->
										</div>
									</div>
									<div class="panel panel-primary">
										<div ng-click="toggleBackgroundTools()" class="panel-heading">
											<label>Backgrounds</label><i ng-if="!isBackgroundToolOpened"
												class="fa fa-chevron-right pull-right"></i><i
												ng-if="isBackgroundToolOpened"
												class="fa fa-chevron-down pull-right"></i>
										</div>
										<div ng-show="isBackgroundToolOpened" class="panel-body">
											<br>
											<div ng-repeat="image in allBackgrounds">
												<img style="max-width: 120px;" src="{{image.url}}" alt="..."
													title="{{image.title}}" class="img-thumbnail"
													ng-click="changeBackground(image.url)"> <br>
											</div>
											<div>
												<button class="btn btn-default"
													ng-click="setDefaultBackground();">Restore Default</button>
											</div>
										</div>
									</div>

									<div class="panel panel-primary">
										<div ng-click="toggleInfo()" class="panel-heading">
											<label>Info</label><i ng-if="!isInfoOpened"
												class="fa fa-chevron-right pull-right"></i><i
												ng-if="isInfoOpened" class="fa fa-chevron-down pull-right"></i>
										</div>
										<div ng-show="isInfoOpened" class="panel-body">
											<div class="row">
												<div class="col-md-6">
													<h6>Name :</h6>
												</div>
												<div class="col-md-6">
													<h6>{{locationDimensions.locationName}}</h6>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h6>Length :</h6>
												</div>
												<div class="col-md-6">
													<h6>{{locationDimensions.length}}</h6>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h6>Length :</h6>
												</div>
												<div class="col-md-6">
													<h6>{{locationDimensions.width}}</h6>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h6>Tables :</h6>
												</div>
												<div class="col-md-6">
													<h6>{{tableArray.length}}</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="panel panel-primary">
										<div ng-click="toggleInfo()" class="panel-heading">
											<label>Table Info</label><i ng-if="!isInfoOpened"
												class="fa fa-chevron-right pull-right"></i><i
												ng-if="isInfoOpened" class="fa fa-chevron-down pull-right"></i>
										</div>
										<div ng-show="isInfoOpened" class="panel-body">
											<div ng-repeat="table in tableArray">
												<div class="row">
													<h6>Table {{$index + 1}}</h6>
													<h6>--x : {{table.xPosition}}</h6>
													<h6>--y : {{table.yPosition}}</h6>
												</div>
											</div>
										</div>
									</div>
									<br>
								</div>
							</div>
						</div>
						<div class="col-md-10" style="height: 579px; overflow: auto;">
							<svg width="{{locationDimensions.length}}"
								height="{{locationDimensions.width}}"
								style="background-image: url({{backgroundUrl}}); background-size: 100% 100%;"
								version="1.1">
                                <g ng-repeat="table in tableArray">
                                    <g ng-if="table.type=='round'"
									class="draggable">
                                        <circle cx="{{table.xPosition}}"
									cy="{{table.yPosition}}" r="{{table.radius}}" stroke="black"
									stroke-width="4" fill="white"
									style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)" />
                                        <text x="{{table.xPosition}}"
									y="{{table.yPosition}}" style="stroke: #660000; fill: #660000">
                                            {{$index}}({{table.covers}})</text>
                                    </g>
                                    <g ng-if="table.type=='square'"
									class="draggable">
                                        <rect id="drag-1"
									width="{{table.xSize}}" height="{{table.ySize}}"
									style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)"
									x="{{table.xPosition}}" y="{{table.yPosition}}"
									transform="matrix(1 0 0 1 0 0)" ng-click="selectElement(evt)" />
                                        <text
									x="{{table.xPosition+(table.xSize/2)}}"
									y="{{table.yPosition+(table.ySize/2)}}"
									style="stroke: #660000; fill: #660000">
                                            {{$index}}({{table.covers}})</text>
                                    </g>
                                </g>
                            </svg>
						</div>

					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->


	</div>
	<!-- /#wrapper -->


	<script>
	$(document).ready(function(){		
    	$('[data-toggle="tooltip"]').tooltip(); 
    	setInterval(function (){
    		$.ajax({url: "/TicketBookingEngine/views/table-arrangement/backgrounds.jsp?id=<%=request.getParameter("id")%>",
													success : function(result) {
														$("#backgroundDiv")
																.html(result);
													}
												})
									}, 10000);
						});
	</script>

</body>

</html>
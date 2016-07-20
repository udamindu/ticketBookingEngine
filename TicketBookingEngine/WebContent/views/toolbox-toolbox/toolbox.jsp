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

<title>Design Interior</title>

<!-- Bootstrap Core CSS -->
<link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">SB Admin v2.0</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
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
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">40%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 2</strong> <span class="pull-right text-muted">20%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 3</strong> <span class="pull-right text-muted">60%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 4</strong> <span class="pull-right text-muted">80%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
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
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
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
							</div> <!-- /input-group -->
						</li>
						<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
								Dashboard</a></li>
						<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
								Charts<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="flot.html">Flot Charts</a></li>
								<li><a href="morris.html">Morris.js Charts</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
								Tables</a></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								Forms</a></li>
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
								Elements<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="panels-wells.html">Panels and Wells</a></li>
								<li><a href="buttons.html">Buttons</a></li>
								<li><a href="notifications.html">Notifications</a></li>
								<li><a href="typography.html">Typography</a></li>
								<li><a href="icons.html"> Icons</a></li>
								<li><a href="grid.html">Grid</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
								Multi-Level Dropdown<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">Second Level Item</a></li>
								<li><a href="#">Second Level Item</a></li>
								<li><a href="#">Third Level <span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>
						<li class="active"><a href="#"><i
								class="fa fa-files-o fa-fw"></i> Sample Pages<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a class="active" href="blank.html">Blank Page</a></li>
								<li><a href="login.html">Login Page</a></li>
							</ul> <!-- /.nav-second-level --></li>
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
						<h1 class="page-header">Interior Designing</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<svg width="100%" height="600"  id="mysvg"
							xmlns:svg="http://www.w3.org/2000/svg"
							xmlns="http://www.w3.org/2000/svg" version="1.1" >
							 
     					
     						 <style type="text/css">
								.draggable {
									cursor: move;
								}
								.caption{
									font-size: 14px;
									font-family: Georgia, serif;
    							}
								.tooltip{
      								font-size: 12px;
   								 }
    							.tooltip_bg{
     								fill: white;
									stroke: black;
									stroke-width: 1;
									opacity: 0.85;
    							 }
							 </style>
    
    						 <script type="text/ecmascript">
																					
								<![CDATA[
    							var selectedElement = 0;
    							var currentX = 0;
    							var currentY = 0;
    							var currentMatrix = 0;
    							
    							//tooltip initialization
    							/* function init(evt){
    						        if ( window.svgDocument == null ){
    						          svgDocument = evt.target.ownerDocument;
    						        }
    						        tooltip = svgDocument.getElementById('tooltip');
    						        tooltip_bg = svgDocument.getElementById('tooltip_bg');
    						    }
    						    function ShowTooltip(evt, mouseovertext){
    						        //svg = document.getElementById("mysvg");
    								//console.log("mysvg",svg);
    						        tooltip.setAttributeNS(null,"x",evt.clientX+11);
    						        tooltip.setAttributeNS(null,"y",evt.clientY+27);
    						        tooltip.firstChild.data = mouseovertext;
    						        tooltip.setAttributeNS(null,"visibility","visible");
    						        
    						        length = tooltip.getComputedTextLength();
    						        tooltip_bg.setAttributeNS(null,"width",length+8);
    						        tooltip_bg.setAttributeNS(null,"x",evt.clientX+8);
    						        tooltip_bg.setAttributeNS(null,"y",evt.clientY+14);
    						        tooltip_bg.setAttributeNS(null,"visibility","visibile");
    						    }
    						    function HideTooltip(evt){
    						        tooltip.setAttributeNS(null,"visibility","hidden");
    						        tooltip_bg.setAttributeNS(null,"visibility","hidden");
    						      } */

    							function selectElement(evt) {
      								selectedElement = evt.target;
      								currentX = evt.clientX;
      								currentY = evt.clientY;
      								currentMatrix = selectedElement.getAttributeNS(null, "transform").slice(7,-1).split(' ');
    
      								for(var i=0; i<currentMatrix.length; i++) {
        							currentMatrix[i] = parseFloat(currentMatrix[i]);
      								}
      
      								selectedElement.setAttributeNS(null, "onmousemove", "moveElement(evt)");
      								selectedElement.setAttributeNS(null, "onmouseout", "deselectElement(evt)");
      								selectedElement.setAttributeNS(null, "onmouseup", "deselectElement(evt)");
    							}
        
    							function moveElement(evt) {
      								var dx = evt.clientX - currentX;
      								var dy = evt.clientY - currentY;
      								currentMatrix[4] += dx;
      								currentMatrix[5] += dy;
      
      								selectedElement.setAttributeNS(null, "transform", "matrix(" + currentMatrix.join(' ') + ")");
      								currentX = evt.clientX;
      								currentY = evt.clientY;
    							}
    							/* function mouseOver() {
    							    alert("event fired!");
    							} */
        
    							function deselectElement(evt) {
      								if(selectedElement != 0){
          								selectedElement.removeAttributeNS(null, "onmousemove");
          								selectedElement.removeAttributeNS(null, "onmouseout");
          								selectedElement.removeAttributeNS(null, "onmouseup");
          								selectedElement = 0;
          								
          								var xmlns = "http://www.w3.org/2000/svg";
          								var elem = document.createElementNS(xmlns, "rect");
          								//alert("event fired!");
          								var circles = document.createElementNS(xmlns, "circle");
          								var cusrect = document.createElementNS(xmlns, "rect");
          								var cuscirc = document.createElementNS(xmlns, "circle");
          								
          								elem.setAttributeNS(null,"class","draggable");
          								elem.setAttributeNS(null,"x",30);
          								elem.setAttributeNS(null,"y",60);
          								elem.setAttributeNS(null,"width",80);
          								elem.setAttributeNS(null,"height",80);
          								elem.setAttributeNS(null,"fill", "blue");
          								elem.style.stroke = "pink";
          								elem.style['stroke-width']="5";
          								elem.style.opacity="0.5"
          								
          								document.getElementById('mysvg').appendChild(elem);
          								//elem.addEventListener("onmousedown", selectElement(evt));
          								//elem.addEventListener("transform",matrix);
          								
          								
          								
          								//circles.setAttribute("class","draggable"");
          								circles.setAttributeNS(null,"cx",70);
          								circles.setAttributeNS(null,"cy",190);
          								circles.setAttributeNS(null,"r",40);
          								circles.setAttributeNS(null,"fill","blue");
          								circles.style.stroke = "pink";
          								circles.style['stroke-width']="5";
          								circles.style.opacity="0.5"
          								
          								document.getElementById('mysvg').appendChild(circles);
          								
          								//svg1.appendChild(circles);
          								//"fill:blue;stroke:pink;stroke-width:5;opacity:0.5"
          								
          								// custom svg elements
          								cusrect.setAttributeNS(null,"class","draggable");
          								cusrect.setAttributeNS(null,"x",30);
          								cusrect.setAttributeNS(null,"y",370);
          								cusrect.setAttributeNS(null,"width",80);
          								cusrect.setAttributeNS(null,"height",80);
          								cusrect.setAttributeNS(null,"fill", "white");
          								cusrect.style.stroke = "black";
          								cusrect.style['stroke-width']="5";
          								cusrect.style.opacity="1"
          								
          								document.getElementById('mysvg').appendChild(cusrect);
          								
          								cuscirc.setAttributeNS(null,"cx",70);
          								cuscirc.setAttributeNS(null,"cy",500);
          								cuscirc.setAttributeNS(null,"r",40);
          								cuscirc.setAttributeNS(null,"fill","white");
          								cuscirc.style.stroke = "black";
          								cuscirc.style['stroke-width']="5";
          								cuscirc.style.opacity="1"
          								
          								document.getElementById('mysvg').appendChild(cuscirc);
          						}
        					}
    							
        
    						]]> 
						
							</script>
							
							<% ToolBox tb = new ToolBox();
							   Vector<Vector<String>> rectTableInfo = tb.getRectTab();
							   Vector<Vector<String>> circTableInfo = tb.getCircTab();

							%>
							<% 	String name = "";
								int x = 0;
								int y = 0;
								int cx = 0;
								int cy = 0;
								int width = 0;
								int height = 0;
								int r = 0;
								
								for(Vector<String> Enq:rectTableInfo){
									x = Integer.parseInt(Enq.get(1));
									y = Integer.parseInt(Enq.get(2));
									height = Integer.parseInt(Enq.get(3));
									width = Integer.parseInt(Enq.get(4));
								}
								
								for(Vector<String> Enq:circTableInfo){
									cx = Integer.parseInt(Enq.get(1));
									cy = Integer.parseInt(Enq.get(2));
									r = Integer.parseInt(Enq.get(3));
								}
							%>
							
     						<g>
     						<rect x="0.5" y="0.5" width="95%" height="595" fill="none"
								stroke="black" />
							<text x="6" y="340" font-family="Verdana" font-size="18" fill="black" >Custom Shapes</text>
							<text x="34" y="20" font-family="Verdana" font-size="18" fill="black" >Tables</text>
							</g>
     						
     						
  							<rect class="draggable" x="<%=x %>" y="<%=y %>" width="<%=width %>" height="<%=height %>"
								style="fill:blue;stroke:pink;stroke-width:5;opacity:0.5"
								transform="matrix(1 0 0 1 0 0)" onmousedown="selectElement(evt)" />							
						
      										
  							<circle class="draggable" cx="<%=cx %>" cy="<%=cy %>" r="<%=r %>"
								style="fill:blue;stroke:pink;stroke-width:5;opacity:0.5"
								transform="matrix(1 0 0 1 0 0)" onmousedown="selectElement(evt)" /> 
								
							<!--  <line x1="150" y1="10" x2="150" y2="95%" style="stroke-opacity: 0.4; stroke: black; stroke-width: 5;" />-->
							<line x1="6" y1="350" x2="148" y2="350" style="stroke-opacity: 0.4; stroke: black; stroke-width: 5;" />
							<line x1="6" y1="25" x2="148" y2="25" style="stroke-opacity: 0.4; stroke: black; stroke-width: 5;" />
							<line x1="146" y1="28" x2="146" y2="55" style="stroke-opacity: 0.4; stroke: black; stroke-width: 5;" />
							<line x1="146" y1="352" x2="146" y2="380" style="stroke-opacity: 0.4; stroke: black; stroke-width: 5;" />
							
							<!-- custom items -->
							<rect class="draggable" x="30" y="370" width="80" height="80"
								style="fill:white;stroke:black;stroke-width:5;opacity:1"
								transform="matrix(1 0 0 1 0 0)" onmousedown="selectElement(evt)" />
							
							<circle class="draggable" cx="70" cy="500" r="40"
								style="fill:white;stroke:black;stroke-width:5;opacity:1"
								transform="matrix(1 0 0 1 0 0)" onmousedown="selectElement(evt)" />	
							
							<!-- <rect class="tooltip_bg" id="tooltip_bg" x="0" y="0" rx="4" ry="4" width="55" height="17" visibility="hidden"/>
							<text class="tooltip" id="tooltip" x="0" y="0" visibility="hidden">Tooltip</text> -->
								
						</svg>
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
	<script src="/TicketBookingEngine/dist/js/sb-admin-2.js"></script>

</body>

</html>

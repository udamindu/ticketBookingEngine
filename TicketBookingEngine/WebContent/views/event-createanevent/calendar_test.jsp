<!-- uthpala damindu bandara -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%> 
<%@page import="com.tbe.controller.Events"%>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>New Event</title>
    
    <link type="text/css" href="/TicketBookingEngine/bower_components/css/inputElements.css" rel="stylesheet"/>
	<link type="text/css" href="/TicketBookingEngine/bower_components/dist/css/bootstrap-theme.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="/TicketBookingEngine/bower_components/dist/css/jquery.datetimepicker.css"/>

    <!-- Bootstrap Core CSS -->
    <link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Angular JS -->
    <script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>
    
    <!-- jquery -->
    <script src="/TicketBookingEngine/bower_components/jquery/dist/jquery.min.js"></script>
    
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
    <!-- <script src="http://ericwenn.se/kalendar/free/"></script> -->
    
    <script src="/TicketBookingEngine/bower_components/kalender/kalender.js"></script>
    
    <style>
  		.modal-header, h5, .close {
      		background-color: #AAEAFF;
      		color:white !important;
      		text-align: center;
      		font-size: 30px;
  		}
  		.modal-footer {
      		background-color: #f9f9f9;
  		}
  	</style>
    
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
    
    <script>
	/* 	$(document).ready(function(){
		    $("#myBtn").click(function(){
		        $("#myModal").modal();
		    });
		}); */
	</script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#myBtn").click(function(){
	        $("#myModal").modal();
	    });
		
	    var minStartDate= new Date();
	    var dd = minStartDate.getDate();
	    var mm = minStartDate.getMonth()+1; //January is 0!

	    var yyyy = minStartDate.getFullYear();
	    if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	    minStartDate= yyyy+'-'+mm+'-'+dd;
	    
		jQuery('#startingtime').datetimepicker({
			format:'Y-m-d H:i',
			minDate:'-minStartDate'//'-2015-11-09'
		});
		jQuery('#endingtime').datetimepicker({
			format:'Y-m-d H:i',
			minDate:'-minStartDate'//'-2015-11-09'
		});
	});
		
	</script>
	
	<script>
	function validate(){
		   var now = new Date();
		   var cur_Year = now.getFullYear();
		   var cur_Month = now.getMonth();
		   var cur_Day = now.getDate();
		   var cur_Hour = now.getHours();
		   var cur_Min = now.getMinutes();
		   var currentdate= new Date(cur_Year,cur_Month,cur_Day,cur_Hour,cur_Min);
		   //alert("currentdate is "+currentdate);
		 
		   var year_st = document.getElementById("startingtime").value.slice(0,4);
		   var month_st = document.getElementById("startingtime").value.slice(5,7) - 1;
		   var day_st = document.getElementById("startingtime").value.slice(8,10);
		   var hour_st = document.getElementById("startingtime").value.slice(11,13);
		   var min_st = document.getElementById("startingtime").value.slice(14,16);
		   var sdate = new Date(year_st ,month_st ,day_st,hour_st,min_st);//ymd
		   //alert("sdate is "+sdate);
		
		   var year_en = document.getElementById("endingtime").value.slice(0,4);
		   var month_en = document.getElementById("endingtime").value.slice(5,7) - 1;
		   var day_en = document.getElementById("endingtime").value.slice(8,10);
		   var hour_en = document.getElementById("endingtime").value.slice(11,13);
		   var min_en = document.getElementById("endingtime").value.slice(14,16);
		   var edate = new Date(year_en ,month_en ,day_en,hour_en,min_en);//ymd
		   //alert("edate is "+edate);
		   var errorDiv = document.getElementById("jserrs");
		   var startInput = document.getElementById("startingtime");
		   var endInput = document.getElementById("endingtime");
		 
		   try{
		   if(currentdate > sdate ){
		      //alert('error');
		      //startInput.value = '';
		      $('#startingtime').val('');
		      throw "Please check the Starting Date again!";
		   }
		   if(currentdate <= sdate){
		      if(sdate < edate){
		        alert('ok');
		      }
		      if(+sdate == +edate){
		        //alert('error3');
		        //endInput.value = '';
		        $('#endingtime').val('');
			    throw "Please check the Starting and Ending Dates";
		      }
		      if(sdate > edate){  
		        //alert('error2');
		        //endInput.value = '';
		        $('#endingtime').val('');
			    throw "Please check the Starting and Ending Dates";			    
		      }
		   }
		   }catch(err){
			   $('#jserrs').css({'display':'block'});
			   errorDiv.className =errorDiv.className + " alert-danger";
			   errorDiv.innerHTML =  err;
			   setTimeout(function(){
				   $('#jserrs').hide(500);
			   },5000);
		   }
		   finally{
			   
		   }
		}
		function checkForNull(){
			var startInput = document.getElementById("startingtime");
			var endInput = document.getElementById("endingtime");
			var errorDiv = document.getElementById("jserrs");
	
			if(startInput.value == null || startInput.value == ""){
				$('#jserrs').css({'display':'block'});
				errorDiv.className =errorDiv.className + " alert-danger";
				errorDiv.innerHTML =  "Please put a Starting date";
				setTimeout(function(){
					   $('#jserrs').hide(500);
				},5000);
				return false;
			}
			if(endInput.value == null || endInput.value == ""){
				$('#jserrs').css({'display':'block'});
				errorDiv.className =errorDiv.className + " alert-danger";
				errorDiv.innerHTML =  "Please put a Ending date";
				setTimeout(function(){
					   $('#jserrs').hide(500);
				},5000);
				return false;
			}
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
	app.controller('newevent',function($scope){
		
	});
  </script>
    <div id="wrapper" ng-app="TBE" ng-controller="newevent">
		<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
        <!-- Page Content -->
        
        <div id="page-wrapper">
        
            <div class="container-fluid">
            
                                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Create an Event
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="/TicketBookingEngine/views/dashboard/dashboard.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Create an Event
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row" >
                	<div class="col-lg-12">                    			
				                       <% if(null!=request.getAttribute("message")){ %>										
											<div id="err1" class="alert alert-danger" role="alert"><p>
												<%=request.getAttribute("message").toString() %></p>
											</div>	
										<%} %>
										<% if(null!=request.getAttribute("message1")){ %>										
											 <div id="success" class="alert alert-success" role="alert">
												<%=request.getAttribute("message1") %>
											 </div>
										<%} %>
										<div id="jserrs" style="display: none;" class="alert" role="alert">											
										</div>			
                	</div>
                	
                </div>

                <div class="row">
                <%Events newEvent = new Events();
                  int cid = 3; //should retrieve from session
                  Vector<String> types = newEvent.fillEventTypes(cid);
                  Vector<String> locations = newEvent.fillLocations(cid);
                %>
                    <div class="col-lg-6 form-group">

                        <form name="form1" method="get" onsubmit="return checkForNull()" action="/TicketBookingEngine/EventServelet" autocomplete="on">
						<!-- start id-form -->	
						<table class="table" id="id-form">
							<tr>
								<th valign="top">Event Name:</th>
								<td>
									<input type="text" class="form-control inp-form" name="name" placeholder="Event Name" autofocus required/>
								</td>
								<td></td>
							</tr>
		
							<tr>
								<th valign="top">Event Type:</th>
								<td>	
									<select  class="form-control inp-form" name="type" id="type" required>
									<%for(String type:types){ %>
										<option value="<%=type%>"><%=type %></option>
									<%} %>
									</select>
								</td>
								<td>
								</td>
							</tr>
	
							<tr>
								<th valign="top">Location:</th>
								<td>		
									<select  class="form-control inp-form" name="location" id="location">
									<%for(String location:locations){ %>
										<option value="<%=location%>"><%=location %></option>
									<%} %>			
									</select>		
								</td>
								<td></td>
							</tr>
							
							<tr>
								<th valign="top">Starting date:</th>
								<td>	
									<input type="text" name="startingtime" id="startingtime" style="cursor:pointer; background-color: #FFFFFF" class="form-control inp-form" onblur="hidePara('#err1')" readonly="readonly" required/>		
								</td>
								<td>
								</td>
							</tr>
							
							<tr>
								<th valign="top">Ending date:</th>
								<td>	
									<input type="text" name="endingtime" id="endingtime" style="cursor:pointer; background-color: #FFFFFF" class="form-control inp-form" onchange="validate()" readonly="readonly" required/>		
								</td>
								<td>
								</td>
							</tr>
	
							<tr>
								<th valign="top">Description:</th>
								<td>
									<textarea rows="" cols="" class="form-control inp-form" name="description" required></textarea>
								</td>
								<td></td>
							</tr>
	
							<tr>
								<th>&nbsp;</th>
								<td valign="top">
									<input type="submit" value="create" class="btn btn-primary" />
									<input type="reset" value="Reset" class="btn btn-warning"  />
								</td>
								<td></td>
							</tr>
					</table>
					</form>

                    </div>
                    
                    <div class="col-lg-3">
                    	
                    	<br>
                    	<br>
                    	<br>
						<button type="button" class="btn btn-default btn-sm" id="myBtn"><span class="glyphicon glyphicon-plus"></span></button>
								
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog"> 
									      
							<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header" style="padding:35px 50px;">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									    <h5><span class="glyphicon glyphicon-lock"></span> Add Type</h5>
									</div>
									<div class="modal-body" style="padding:40px 50px;">
										<form name="form" method="post" action="/TicketBookingEngine/EventType" autocomplete="on">
									    	<table class="table" id="id-form">
												<tr>
													<th valign="top">New Event Type:</th>
													<td>
														<input type="text" class="form-control inp-form" name="ttype" placeholder="Event Type" required/>
													</td>
													<td></td>
												</tr>	
												<tr>
													<th valign="top">Type Description:</th>
													<td>
														<textarea rows="" cols="" class="form-control inp-form" name="tdescription"></textarea>
													</td>
													<td></td>
												</tr>
												<tr>
													<th>&nbsp;</th>
													<td valign="top">
														<input type="submit" value="Add" class="btn btn-primary" />
														<input type="reset" value="Reset" class="btn btn-warning"  />
													</td>
													<td></td>
												</tr>
											</table>
									      </form>
									   </div>
									</div>     	    
								</div>									    
							</div>
							
							<div id="calander">
							
							</div>						
								
                    </div>
                    
                    <div class="col-lg-3">
                    	<!-- <iframe src="/TicketBookingEngine/views/event-timeline/timeline.jsp" style="width: 100%; height: 100px">
                    	     
                    	</iframe>   -->           	
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
    
    <script src="/TicketBookingEngine/bower_components/datePicker/jquery.datetimepicker.full.js"></script>

</body>

</html>

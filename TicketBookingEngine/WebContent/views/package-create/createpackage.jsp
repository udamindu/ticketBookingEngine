<%@page import="com.tbe.servlet.PAdd"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
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

<title>Create Package</title>

<!-- Angular JS -->
<script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

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
	
<!-- Sweet  alert -->
<link href="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.css" rel="stylesheet" type="text/css">

<script src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js"></script>

<script language=Javascript>
      
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
      
   </script>
</head>

<body>

<% 
	boolean isSuccess = false;
	boolean check = false;
	boolean wrongPkg = false;
	String totalCovers = null;
	
	if (request.getAttribute("check") != null)
	{
		check = Boolean.parseBoolean(request.getAttribute("check").toString()); 
				
	} 
	
	if (request.getAttribute("isSuccess") != null)
	{
		isSuccess = Boolean.parseBoolean(request.getAttribute("isSuccess").toString()); 	
	
	}
	
	if (request.getAttribute("wrongPkg") != null)
	{
		wrongPkg = Boolean.parseBoolean(request.getAttribute("wrongPkg").toString()); 	
	
	}
	
	if (request.getAttribute("totalCovers") != null)
	{
		totalCovers = request.getAttribute("totalCovers").toString(); 
				
	} 
%>

<script type="text/javascript">
	var app = angular.module('TBE',[]);
	app.controller('Package',function($scope){
		
		$scope.ok = function() {
			swal("Good job!", "Successfully Added!", "success")				
			};
			
		$scope.error = function() {
			swal("Quantity should be less than "+<%=totalCovers%>)				
			};
			
		$scope.errorPkg = function() {
			swal("Oops.. Duplicate Package Names")				
			};
				
		<% if (isSuccess) { %>
				$scope.ok();
		<% }if(check){ %>
				$scope.error();
		<% }if(wrongPkg){%> 
				$scope.errorPkg();
		<%}%>		

	});
</script>
<div id="wrapper" ng-app="TBE" ng-controller="Package">
<!-- ############################ -->
<!-- Navigation -->
	
<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
		
<!-- ############################ -->
<!-- Page Content -->
<div id="page-wrapper">

<div class="container-fluid">

		
		<form id="form1" method="post" action="/TicketBookingEngine/PAdd">

		<div class="row">
		<div class="col-lg-12">
		<h1 class="page-header">Create Package</h1>
		</div>
		<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
				<%@page import="java.util.*"%>
				<%@page import="java.lang.*"%>
				<%@page import="java.sql.*"%>
				<%@page import="com.tbe.controller.PackageController"%>
				<%@page import="com.tbe.model.Package"%>
				<div class="col-lg-6">
				
							
					<div class="form-group">
					<label>Enter Package Name</label>
					<input class="form-control" id="pkgName" placeholder="Enter Package Name" name="pkgName" required="required">
					<p class="help-block"></p>
					</div>

						<div class="form-group">
						<label>Select Event Name</label> 
						<select class="form-control" name="ename">
						<%
						try {
								PackageController em = new PackageController();
								String ename = null;

								Vector<Vector<String>> Enquiry = em.getEventNames();
								for (Vector<String> Enq : Enquiry)
								{
									ename = Enq.get(0);
						%>
						<option id="list2" value="<%=ename%>"><%=ename%></option>
						<%
								}
							} 
						catch (Exception e)
							{
								e.printStackTrace();
							}
						%>
						</select>
						</div>
						<br /> <br />
						</div>
						

						<div class="col-lg-12">
						<div class="row">
						<div class="form-group">
							<label>Items</label>
						</div>
						<div class="row">
							<% String RCat = null; %>
							<% String selectedItem = null; %>
							<div class="form-group">
							<div class="col-lg-3 text-center">
							<!-- <div class="panel panel-default"> -->
							<div class="panel-body">
								<div class="form-group">
									<label>Select Category</label> 
									<select class="form-control" name="RCat" >
									<%
									try {
											PackageController em = new PackageController();
											Vector<Vector<String>> Enquiry = em.getResCatDetails();
											for (Vector<String> Enq : Enquiry) 
											{
												RCat = Enq.get(0);
									%>
										<option id="list2" value="<%=RCat%>"><%=RCat%></option>
									<%														
											}
											if(request.getParameter("RCat")!=null)
											{
											   selectedItem=request.getParameter("RCat").toString();
											}
										}
									catch (Exception e) 
									{
										e.printStackTrace();
									}
									%>
									</select>
									</div>											
							</div>
							</div>
							
							
							<div class="col-lg-3 text-center">
								<div class="panel-body">
								<div class="form-group">
								<label>Select Brand Name</label> 
									<select class="form-control" name="RName">
									<%
									try {
											PackageController em = new PackageController();
											String RName = null;															
											Vector<Vector<String>> Enquiry = em.getResNameDetails(RCat);
											for (Vector<String> Enq : Enquiry) 
											{
												RName = Enq.get(0);
									%>
										<option id="list2" value="<%=RName%>"><%=RName%></option>
									<%
											}
									}
									catch (Exception e) 
									{
										e.printStackTrace();
									}
									%>
									</select>
								</div>
								</div>
							</div>
								
								
							<div class="col-lg-3 text-center">
								<div class="panel-body">
								<div class="form-group">
								<label>Enter Quantity</label> 
								<input class="form-control" id="quantity" placeholder="Enter Quantity" name="Rquantity" onkeypress="return isNumberKey(event)" required="required">
								<p class="help-block">Example:- 2,10,15..</p>
								</div>
								</div>
							</div>
						</div>
						</div>
						</div>

							
						<div class="col-lg-6">
							<div class="form-group" name="type">
							<div class="form-group">
								<label>Description</label>
								<textarea class="form-control" rows="3" placeholder="Description" name="description" required="required"></textarea>
							</div>
							</div>
								<br /> <br />
						</div>
							
							
						<div class="col-lg-3 text-center">
						<div class="panel-body">
						<div class="form-group">
							<label>Enter Price Rs.</label> <input class="form-control" id="quantity" placeholder="Enter Price" name="tot" onkeypress="return isNumberKey(event)" required="required">
							<p class="help-block">Example:- 400, 1000...</p>
						</div>
						</div>
						</div>
						
						
						</div>
			</div>

				<button type="submit" class="btn btn-default">Submit</button>
				<button type="reset" class="btn btn-default">Reset</button>
				</br> </br> </br>
		</form>
	</div>
	<!-- /.row -->
</div>
</div>
<!-- /.container-fluid -->	

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

<%@page import="com.tbe.controller.ResourseController"%>
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

<title>Package EditForm</title>

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


<script language=Javascript>
      
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
      
</script>
<script type="text/javascript">
	function openPage(pageURL)
	{
	/* alert("Check"); */
	window.location.href = pageURL;
	}
</script>
</head>

<body>

<% 
	boolean isSuccess = false;
	if (request.getAttribute("isSuccess") != null)
	{
		isSuccess = Boolean.parseBoolean(request.getAttribute("isSuccess").toString()); 
	}
%>

<% 
	boolean isEmpty = false;
	if (request.getAttribute("isEmpty") != null)
	{
		isEmpty = Boolean.parseBoolean(request.getAttribute("isEmpty").toString()); 
	}
%>


<div id="wrapper" ng-app="TBE" ng-controller="PackagEdit">
<!-- ############################ -->
<!-- Navigation -->

<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
		
<!-- Page Content -->
<div id="page-wrapper">
<div class="container-fluid">

<!-- Page Heading -->
<div class="row">
<div class="col-lg-12">
<h1 class="page-header">Edit Packages</h1>
</div>
</div>
<!-- /.row -->

<div class="row">
 <%ResourseController em = new ResourseController(); %>
 <%String brand = em.getBrandsCat(); %>
 <div class="col-lg-6" ng-init="Brand=<%=brand%>">
	

	<form id="form1" method="post"	action="/TicketBookingEngine/updatePackage">

		<%@page import="java.util.*"%>
		<%@page import="java.lang.*"%>
		<%@page import="java.sql.*"%>
		<%@page import="com.tbe.controller.PackageController"%>
		<%@page import="com.tbe.model.Package"%>

		<%
			
			PackageController pc = new PackageController();

			String Pid = null;
			String name=null;
			String eventName=null;
			String description=null;
			String tot=null;
						
			String itemID = null;
			String itemCat = null;
			String itemBrand = null;
			String itemQty = null;
							
			Vector<Vector<String>> Enquiry = pc.getPackageDetails(request.getParameter("pid"));	
						
			for(Vector<String> Enq:Enquiry)
			{
											
				Pid = Enq.get(0);
				name = Enq.get(1);
				eventName = Enq.get(2);
				description = Enq.get(3);
				tot=Enq.get(4); 
											
				System.out.println(Pid);
				System.out.println(name);
				System.out.println(eventName);
				System.out.println(description);
				System.out.println(tot);
																			
			}		
									
			Vector<Vector<String>> EnquiryItems = pc.getPackageItemsDetails(request.getParameter("pid"), request.getParameter("pname"));	
						
			for(Vector<String> Enq2:EnquiryItems)
			{
											
				itemID = Enq2.get(0);
				itemCat = Enq2.get(1);
				itemBrand = Enq2.get(2);
				itemQty = Enq2.get(3);
									
				System.out.println(itemID);
				System.out.println(itemCat);
				System.out.println(itemBrand);
				System.out.println(itemQty);
																					
			}		
			%>

<div class="form-group" name="type">
			
<script>	
	var app = angular.module('TBE',[]);
	app.controller('PackagEdit',function($scope){
		 $scope.dd="<%=itemCat%>";
		 $scope.ee="<%=itemBrand%>";
		 
		 $scope.category='<%=itemCat%>';
		 $scope.pid='<%=Pid%>';
		 
		 $scope.ok = function() {
				swal("Good job!", "Successfully Updated!", "success")				
				};
					
			<% if (isSuccess) { %>
					$scope.ok();
			<% } if(isEmpty){%> 
					$scope.emptyCat();
			<%}%>
		 
			$scope.getBrands = function()
			 {
				 $scope.selectedBrand = [];
					for (i in $scope.Brand)
					{
						if ($scope.Brand[i].catID == $scope.Selectedcategory)
						{
							$scope.selectedBrand.push($scope.Brand[i]);
						}
					}
					console.log('Selected Brands', $scope.selectedBrand);	
					
					if ($scope.Selectedcategory == "3"){
						$scope.isTable = true;
					} else {
						$scope.isTable = false;
					}
			 };
	});
</script>


</div>
<input type=hidden id="thisField" name="pid" value="<%=request.getParameter("pid")%>">


	<div class="form-group">
	<label>Package Name</label> <input class="form-control" placeholder="Enter Package Name" name="name" value="<%=name%>" required="required">
	<p class="help-block"></p>
	</div>
	

	<div class="form-group">
	<label>Package Description</label>
	<textarea class="form-control" rows="3" name="description"	value="<%=request.getParameter("Desc")%>" required="required"><%=description%></textarea>
	<p class="help-block"></p>
	</div>


	<div class="form-group">
	<label>Total Price</label>
		<div class="form-group input-group">
		<span class="input-group-addon">Rs.</span> 
		<input type="text" class="form-control" name="tot" onkeypress="return isNumberKey(event)" value="<%=tot%>" required="required">
		<span class="input-group-addon">.00</span>
		</div>
	<p class="help-block">Example:- 800 , 2500 ..</p>
	</div>


					<%String cat = em.getCategory(); %>
					<%String lengthToBe = "0"; %>
					<%String widthToBe = "0"; %>
					
					<div class="form-group" ng-init="catergory=<%=cat%>">
						<label>Category</label>
                        <select class="form-control" name="RCat" >
									<%
									String RCat = null;
									String selectedItem = null;
									try {
											Vector<Vector<String>> EnquiryCat = pc.getResCatDetails();
											for (Vector<String> Enq : EnquiryCat) 
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
                       <p class="help-block">Example:- Table, Chair, Projector...</p>                        
                    </div>
                    
                    <div class="form-group" >
	                    <label>Brand Name</label>
	                    <select class="form-control" name="RName">
									<%
									try {
											String RName = null;															
											Vector<Vector<String>> EnquiryBrand = pc.getResNameDetails(RCat);
											for (Vector<String> Enq : EnquiryBrand) 
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
	                    <p class="help-block">Example:- Singer, Damro, Nilkamal..</p>
                    </div>        
							
		

		<div class="form-group">
		<label>Quantity</label> 
		<input class="form-control" placeholder="Enter Quantity" name="itemQty" value="<%=itemQty%>" required="required">
		<p class="help-block"></p>
		</div>

		<button type="submit" class="btn btn-default">Submit</button>
		<button type="reset" class="btn btn-default">Reset</button>
		<button type="button" class="btn btn-default" onclick=openPage("package-update.jsp")>Back	</button>

		</br> </br> </br>

		</form>
 
</div>
<!-- /.row -->

</div>
<!-- /.container-fluid -->
</div>
</div>

<!-- /.row -->
</div>
	

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

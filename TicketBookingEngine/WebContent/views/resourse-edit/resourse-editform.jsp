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

<title>Edit Items</title>

<!-- Angular JS -->
<script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"	rel="stylesheet">

<!-- Custom CSS -->
<link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Sweet  alert -->
<link href="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.css" rel="stylesheet" type="text/css">

<script src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js"></script>
	
<script type="text/javascript">
	function openPage(pageURL)
	{
	window.location.href = pageURL;
	}
</script>

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
	boolean empty = false;
	
	if (request.getAttribute("empty") != null)
	{
		empty = Boolean.parseBoolean(request.getAttribute("empty").toString()); 
	
	}
	
	if (request.getAttribute("isSuccess") != null)
	{
		isSuccess = Boolean.parseBoolean(request.getAttribute("isSuccess").toString()); 
	}
	
	
%>
<div id="wrapper" ng-app="TBE" ng-controller="ResourseEdit">
		<!-- ############################ -->
		<!-- Navigation -->
<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
<div id="page-wrapper">

<div class="container-fluid">

<!-- Page Heading -->
<div class="row">
<div class="col-lg-12">
	<h1 class="page-header">Edit Items</h1>
</div>
</div>
<!-- /.row -->

<div class="row">
 <%ResourseController em = new ResourseController(); %>
 <%String brand = em.getBrandsCat(); %>
<div class="col-lg-6" ng-init="Brand=<%=brand%>">
                      
<form id="form1" method="post" action="/TicketBookingEngine/updateResource">
                        
    <%@page import="java.util.*"%>
	<%@page import="java.lang.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.tbe.controller.ResourseController"%>
	<%@page import="com.tbe.model.Resourse"%>
		
	<%
		
		String itemID = null;
		String category=null;
		String name=null;
		String cost=null;
		String description=null;
					
		Vector<Vector<String>> Enquiry = em.getR(request.getParameter("itemID"));											
											
		for(Vector<String> Enq:Enquiry)
		{										
		 	itemID = Enq.get(0);
			category = Enq.get(1);
			name = Enq.get(2);
			cost = Enq.get(3);
			description=Enq.get(4); 
										
			System.out.println(itemID);
            System.out.println(category);
		    System.out.println(name);
		    System.out.println(cost);
		    System.out.println(description);
																				
		}	
							
	%>            
    <input type=hidden id="thisField" name="itemID" value="<%=request.getParameter("itemID")%>">
       
<script>	
	var app = angular.module('TBE',[]);
	app.controller('ResourseEdit',function($scope){
		
		$scope.ok = function() {
			swal("Good job!", "Successfully Added!", "success")				
			};
			
		$scope.emptyCat = function() {
			swal("Select a Category and Brand")				
			};
				
		<% if (isSuccess) { %>
				$scope.ok();
		<% } if(empty){%> 
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
		 };
		
		
		 $scope.itemID='<%=itemID%>';
			
		
	});
</script>
       
                      
					<%String cat = em.getCategory(); %>
					
					<div class="form-group" ng-init="catergory=<%=cat%>">
						<label>Category</label>
                        <select class="form-control" ng-model="Selectedcategory" ng-change="getBrands()" name="Maincategory">
							<option ng-repeat="i in catergory" value="{{i.cat_id}}">{{i.Category}}</option>
						</select>                                            
                                             
                    </div>
	


					<div class="form-group" >
	                    <label>Brand Name</label>
	                    <select class="form-control" ng-model="brand" name="MainBrand">
							<option ng-repeat="i in selectedBrand" value="{{i.BrandName}}">{{i.BrandName}}</option>
						</select> 
	                   
                    </div>   

                            
					<div class="form-group">
					     <label>Cost</label>
					     <div class="form-group input-group">
					         <span class="input-group-addon">Rs.</span>
					 	     <input type="text" class="form-control" name="cost" onkeypress="return isNumberKey(event)" value="<%=cost %>" required="required">
					         <span class="input-group-addon">.00</span>
					    </div>
					    <p class="help-block">Example:- 800 , 2500 ..</p>
					</div>

<div class="form-group">
    <label>Resource Description</label>
    <textarea class="form-control" rows="3"  name="description" value="<%=request.getParameter("Desc") %>" required="required"><%=description %></textarea>
             
    <p class="help-block">Example:- Rounded Edges, Square legs..</p>
</div>

                          
<button type="submit" class="btn btn-default">Submit </button>
<button type="reset" class="btn btn-default">Reset </button>
                           
<button type="button" class="btn btn-default" onclick=openPage("resourse-update.jsp")>Back </button>
                            
</br>
</br>
</br>
                                                 
</form>

</div>
                    
<!-- /.row -->

</div>
<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
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
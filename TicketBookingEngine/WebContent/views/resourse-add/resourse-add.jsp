<!-- Author : Sanju -->
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

<!-- Angular JS -->
<script src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>
    
<!-- Angular bootstrap -->
<script	src="/TicketBookingEngine/bower_components/angular-bootstrap/ui-bootstrap-tpls-0.13.0.min.js"></script>

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

<script src="/TicketBookingEngine/bower_components/jquery/1.11.1/jquery.min.js"></script>

<title> Add Items</title>

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
  	window.location.href = pageURL;
  	}
</script>
   
</head>
<body>

<% 
	boolean wrongCat = false;
	boolean wrongBrand = false;
	
	boolean isSuccess = false;
	boolean isEmpty = false;
	
	if (request.getAttribute("isEmpty") != null)
	{
		isEmpty = Boolean.parseBoolean(request.getAttribute("isEmpty").toString()); 	
	}
	
	if (request.getAttribute("isSuccess") != null)
	{
		isSuccess = Boolean.parseBoolean(request.getAttribute("isSuccess").toString()); 
	}
	
	if (request.getAttribute("wrongCat") != null)
	{
		wrongCat = Boolean.parseBoolean(request.getAttribute("wrongCat").toString()); 		
	}
	
	if (request.getAttribute("wrongBrand") != null)
	{
		wrongBrand = Boolean.parseBoolean(request.getAttribute("wrongBrand").toString()); 		
	}
%>	
		

   <div id="wrapper" ng-app="TBE" ng-controller="Resources">
		<!-- ############################ -->
		<!-- Navigation -->
		
	 <script type="text/ng-template" id="myModalContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Add New Category</h3>			
        </div>
		<form action="/TicketBookingEngine/addNewCategory" method="post">
        <div class="modal-body">
			<div class="form-group">
               <label>Category</label>
               <input class="form-control" id="Catergory" placeholder="Enter Category" name="Catergory" required="required">
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="submit">OK</button>
            <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
        </div>
		</form>
    </script>
    
    <script type="text/ng-template" id="myModalContentForTable.html">
        <div class="modal-header">
            <h3 class="modal-title">Add Length and Width</h3>			
        </div>
		<form action="/TicketBookingEngine/AddLenghWidth" method="post">
        <div class="modal-body">
			<div class="form-group">
               <label>Length</label>
               <input class="form-control" id="Length" placeholder="Enter Length in Feet" name="Length" required="required">
            </div>

			<div class="form-group">
               <label>Width</label>
               <input class="form-control" id="Width" placeholder="Enter Width in Feet" name="Width" required="required">
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="submit">OK</button>
            <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
        </div>
		</form>
    </script>
    
     <script type="text/ng-template" id="myModalContentBrand.html">
        <div class="modal-header">
            <h3 class="modal-title">Add New Brand</h3>			
        </div>
		<form action="/TicketBookingEngine/addNewBrand" method="post">
        <div class="modal-body">
			<div class="form-group">
               <label>Brand</label>
               <input class="form-control" id="Brand" placeholder="Enter Brand" name="Brand" required="required">
            </div>

			<div class="form-group">
				<label>Category</label>
				<%@page import="java.util.*"%>
				<%@page import="java.lang.*"%>
				<%@page import="java.sql.*"%>
				<%@page import="com.tbe.controller.ResourseController"%>
				<%@page import="com.tbe.model.Resourse"%>
                <select class="form-control" name="category">
                <%
                               
					try {
						ResourseController em = new ResourseController();
						Resourse rm = new Resourse();
						String category = null;

						Vector<Vector<String>> Enquiry = em.getCategoryDetails();
						for (Vector<String> Enq : Enquiry) 
						{
								category = Enq.get(0);
						%>
										
                        <option id="list2" value="<%=category%>"><%=category%></option>
                        <%
						}
						} catch (Exception e) 
                			{
								e.printStackTrace();
							}
					   %>
               </select>   

			</div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="submit">OK</button>
            <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
        </div>
		</form>
    </script>
    
		
		<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
		<div id="page-wrapper">
		
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add Items
                        </h1>
                       
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                <%ResourseController em = new ResourseController(); %>
                <%String brand = em.getBrandsCat(); %>
                <div class="col-lg-6" ng-init="Brand=<%=brand%>">
					                       
                <form id="form1" method="post" action="/TicketBookingEngine/Rfileupload">    
                      
                    <div class="form-group" class="row">
                            
                        <%@page import="java.util.*"%>
						<%@page import="java.lang.*"%>
						<%@page import="java.sql.*"%>
						<%@page import="com.tbe.controller.ResourseController"%>
						<%@page import="com.tbe.model.Resourse"%>
						<%String QString = null;
						
						String itemID = null;
						String category=null;
						String name=null;
						String cost=null;
						String description=null;
									
						Vector<Vector<String>> EnquiryMain = em.getResourseDetails();											
															
						for(Vector<String> Enq:EnquiryMain)
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
		
<script type="text/javascript">
	var app = angular.module('TBE',['ui.bootstrap']);
	app.controller('Resources',function($scope, $modal, $log){
		$scope.animationsEnabled = true;
		
		$scope.ok = function()
		{
			swal("Good job!", "Successfully Added!", "success")				
		};
		
		$scope.errorCat = function() {
			swal("Oops.. Duplicate Category Names")				
			};
			
		$scope.errorBrand = function() {
			swal("Oops.. Duplicate Brand Names")				
			};
			
		$scope.emptyCat = function() {
			swal("Select a Category and Brand")				
			};
				
		<% if (isSuccess) { %>
				$scope.ok();
		<% }if(wrongCat){%> 
				$scope.errorCat();
		<%}if(wrongBrand){%> 
				$scope.errorBrand();
		<%}if(isEmpty){%> 
			$scope.emptyCat();
		<%} %>
		
		$scope.isTable = false;
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
		 
				 
		$scope.openCat = function (size) 
		{

		    var modalInstance = $modal.open({
		      animation: $scope.animationsEnabled,
		      templateUrl: 'myModalContent.html',
		      controller: 'ModalInstanceCtrl',
		      size: size,
		      resolve: {
		        items: function () {
		          return $scope.items;
		        }
		      }
		    });
		   
		  };
		  
		  $scope.openTable = function (size)
		  {
			    var modalInstance = $modal.open({
			      animation: $scope.animationsEnabled,
			      templateUrl: 'myModalContentForTable.html',
			      controller: 'ModalInstanceCtrlTable',
			      size: size,
			      resolve: {
			        items: function () {
			          return $scope.items;
			        }
			      }
			    });
			   
			  };

		  $scope.openBrand = function (size)
		  {
			    var modalInstance = $modal.open({
			      animation: $scope.animationsEnabled,
			      templateUrl: 'myModalContentBrand.html',
			      controller: 'ModalInstanceCtrlBrand',
			      size: size,
			      resolve: {
			        items: function () {
			          return $scope.items;
			        }
			      }
			    });
			   
			  };
	});
	
	app.controller('ModalInstanceCtrl', function($scope, $modalInstance, $log) {

		  $scope.ok = function () {
		    $modalInstance.close($scope.selected.item);
		  };	  
	

		  $scope.cancel = function () {
		    $modalInstance.dismiss('cancel');
		  };
		});
	
	app.controller('ModalInstanceCtrlTable', function($scope, $modalInstance, $log) {

		  $scope.ok = function () {
		    $modalInstance.close($scope.selected.item);
		  };	  
	

		  $scope.cancel = function () {
		    $modalInstance.dismiss('cancel');
		  };
		});
	
	app.controller('ModalInstanceCtrlBrand', function($scope, $modalInstance, $log) {

		  $scope.ok = function () {
		    $modalInstance.close($scope.selected.item);
		  };

		  $scope.cancel = function () {
		    $modalInstance.dismiss('cancel');
		  };
		});
		
</script>
</div>
					<%String cat = em.getCategory(); %>
					<%String lengthToBe = "0"; %>
					<%String widthToBe = "0"; %>
					
					<div class="form-group" ng-init="catergory=<%=cat%>">
						<label>Category</label>
                        <select class="form-control" ng-model="Selectedcategory" ng-change="getBrands()" name="Maincategory">
							<option ng-repeat="i in catergory" value="{{i.cat_id}}">{{i.Category}}</option>
						</select>                                            
                        <span class="pull-right"> <button type="button" class="btn btn-default" ng-click="openCat()">+ </button></span>                         
                        <p class="help-block">Example:- Table, Chair, Projector...</p>                        
                    </div>
                    
                    <input type=hidden id="thisField" name="Width" value="<%=request.getParameter("widthToBe")%>">
                    
                    <div ng-show="isTable">
                    <label>Length : </label>
                    <div class="form-group input-group">
                    <input type="text" class="form-control" name="Length" onkeypress="return isNumberKey(event)" required="required" ng-model="Len">
                    <span class="input-group-addon">cm</span>
                    </div>
                    <p class="help-block">Example:- 500, 300...</p>  
                    </div>
                    <input type=hidden id="thisField" name="L-Length" value="{{Len}}">
                   
                    
                    <div ng-show="isTable">
                    <label>Width : </label>
                    <div class="form-group input-group">
                    <input type="text" class="form-control" name="Width" onkeypress="return isNumberKey(event)" required="required" ng-model="Wid">
                    <span class="input-group-addon">cm</span>
                    </div>
                    <p class="help-block">Example:- 500, 300...</p>  
                    </div>
                    <input type=hidden id="thisField2" name="W-Width" value="{{Wid}}">
                    
					
                    <div class="form-group" >
	                    <label>Brand Name</label>
	                    <select class="form-control" ng-model="brand" name="MainBrand">
							<option ng-repeat="i in selectedBrand" value="{{i.BrandName}}">{{i.BrandName}}</option>
						</select> 
	                    <span class="pull-right"> <button type="button" class="btn btn-default" ng-click="openBrand()">+ </button></span> 
	                          
	                    <p class="help-block">Example:- Singer, Damro, Nilkamal..</p>
                    </div>                            
                           
                 
                            
                    <div class="form-group">
                        <label>Cost</label>
                        <div class="form-group input-group">
                          <span class="input-group-addon">Rs.</span>
                          <input type="text" class="form-control" name="cost" onkeypress="return isNumberKey(event)" required="required">
                          <span class="input-group-addon">.00</span>
                        </div>
                        <p class="help-block">Example:- 800 , 2500 ..</p>
                    </div>
                    <%System.out.println("cost of textbox = "+request.getParameter("cost")); %>

                    <div class="form-group">
                        <label>Resource Description</label>
                        <textarea class="form-control" rows="3" placeholder="Describe how the resource looks like" name="description" required="required"></textarea>
                        <p class="help-block">Example:- Rounded Edges, Square legs..</p>
                    </div>
                            
                    <button type="submit" class="btn btn-default" >Submit </button>
                    <button type="reset" class="btn btn-default">Reset </button>
                            
                    <button type="button" class="btn btn-default" onclick=openPage("../dashboard/dashboard.html")>Back </button> 
                            
                            
                    </br>
                    </br>
                    </br>
                           
            	</form>

           		</div>
                    
                <!-- /.row -->
				</div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
        </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/TicketBookingEngine/bower_components/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/TicketBookingEngine/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


</body>
</html>
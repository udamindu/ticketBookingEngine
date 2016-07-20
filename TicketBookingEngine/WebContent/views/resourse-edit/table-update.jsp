<!-- Author : Sanju -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Tables</title>

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

<script src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js">
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
	boolean isSuccess = false;
	if (request.getAttribute("isSuccess") != null)
	{
		isSuccess = Boolean.parseBoolean(request.getAttribute("isSuccess").toString()); 
	}
%>

<script type="text/javascript">
	var app = angular.module('TBE',['ui.bootstrap']);
	app.controller('Resources_Update',function($scope, $modal, $log){
		$scope.animationsEnabled = true;
		
		$scope.ok = function()
		{
			swal("Good job!", "Successfully Updated!", "success")				
		};
				
		<% if (isSuccess) { %>
				$scope.ok();
		<% } %>
		
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
	});
	
	app.controller('ModalInstanceCtrl', function($scope, $modalInstance, $log) {

		  $scope.ok = function () {
		    $modalInstance.close($scope.selected.item);
		  };	  
	

		  $scope.cancel = function () {
		    $modalInstance.dismiss('cancel');
		  };
		});
		
	</script>

 <div id="wrapper" ng-app="TBE" ng-controller="Tables_Update">
 
	<script type="text/ng-template" id="myModalContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Quantity</h3>			
        </div>
		<form action="/TicketBookingEngine/EditQuantity" method="post">
        <div class="modal-body">
			<div class="form-group">
				<label>Item Id</label>
				<label>Category</label>
				<label>Brand</label>
				<label>Total Amount</label>
               	<label>Damage Amount</label>
				<label>Amount under Repair</label>
               	<input class="form-control" id="Catergory" placeholder="Enter Category" name="Catergory" required="required">
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
	
	<div class="row">
                   
    <div class="col-lg-10">
    <h2>Update Tables</h2>
   
        </br>    
    <div class="table-responsive">
                           
    <form id="mainform" action="/TicketBookingEngine/DeleteAllTables" method = "post">
                        
         <table class="table table-hover table-striped">
         <thead>
            <tr>
              	<th></th>
                <th>Category</th>
                <th>Brand</th> 
                <th>Price</th>
                <th>Description</th>
                <th>Length</th>
                <th>Width</th>
                <th>Options</th>
                                        
           </tr>
       </thead>
                                
       <tbody>
                                
       		<%@page import="java.util.*"%>
			<%@page import="java.lang.*"%>
			<%@page import="java.sql.*"%>
			<%@page import="com.tbe.controller.*"%>
			<%@page import="com.tbe.model.*"%>
			<%
				ResourseController em = new ResourseController();
				String itemID;
				String category;
				String name;
				String quantity;
				String costs;
				String description;
				String length;
				String width;
										
				Resourse rm;
				
				Vector<Vector<String>> Enquiry = em.getTablesDetails();						
				   									
				for(Vector<String> Enq:Enquiry)
				{									
					String QString = null;
					
					rm=new Resourse();
					rm.setItemID(Enq.get(0));
					rm.setCat(Enq.get(1));
					rm.setName(Enq.get(2));	
					rm.setCost(Enq.get(3));										
					rm.setDescription(Enq.get(4));	
					rm.setLength(Enq.get(5));
					rm.setWidth(Enq.get(6));
							
			%>                               
            <tr>
                <td><input type="checkbox" value="" name="cb_<%=rm.getItemID()%>"></td>
                <td><%=rm.getCat()%></td>
            	<td><%=rm.getName()%></td>
                <td><%=rm.getCost()%></td>
                <td><%=rm.getDescription()%></td>
                <td><%=rm.getLength()%></td>
                <td><%=rm.getWidth()%></td>
                                
				<%QString = "?itemID="+ rm.getItemID() ; %>
								
				<td><button type="button" name="btnEd" onclick=openPage("/TicketBookingEngine/views/resourse-edit/table-editform.jsp<%=QString %>") class="fa fa-pencil-square-o fa-2x"></button>
					<button type="submit" name="btnDel_<%=rm.getItemID()%>" class="fa fa-trash-o fa-2x"></button>
									
				</td>				
                                      
        	</tr>              
                                   
			<%						
				}
			%>
         </tbody>
                                
         </table>
         <button type="submit" name="btnDelAll" class="btn btn-danger">Delete Selected</button>
    </form>      
    </div>
    </div>
            
    </div>
    </div>
    </div>
	
</div>
	
	  <!-- jQuery -->
    <script src="/TicketBookingEngine/bower_components/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/TicketBookingEngine/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

</body>
</html>
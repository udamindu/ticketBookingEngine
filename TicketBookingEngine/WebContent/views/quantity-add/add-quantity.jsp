<!-- Author : Sanju -->
<%@page import="java.util.Vector"%>
<%@page import="com.tbe.controller.ResourseController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<script src="/TicketBookingEngine/bower_components/jquery/1.11.1/jquery.min.js"></script>
<!-- timeline related scripts -->
<link rel="stylesheet" href="../css/style.css">
<!-- Resource style -->
<script src="/TicketBookingEngine/bower_components/js/modernizr.js"></script>
<!-- Modernizr -->
	
<link type="text/css" href="/TicketBookingEngine/bower_components/css/inputElements.css" rel="stylesheet" />
<link type="text/css" href="/TicketBookingEngine/bower_components/dist/css/bootstrap-theme.css" rel="stylesheet" />
		

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
    
<!-- Angular bootstrap -->
<script	src="/TicketBookingEngine/bower_components/angular-bootstrap/ui-bootstrap-tpls-0.13.0.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
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

<script type="text/javascript">
		$(document).ready(function(e) {
			$('.owner').hide();
			$('#adminnav').hide();
			$('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#", "");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				$('.input-group #search_param').val(param);
			});
			$('#advance').click(function() {
				if ($('#adminnav').is(':visible')) {
					$('#advance').html('Advance Search');
					$('#adminnav').hide(500);
				} else {
					$('#advance').html('Quick Search');
					$('#adminnav').show(500);
				}
			});
		});
	
		function advanceSearch(param) {
			$.ajax({
				url : 'AdvancedSearch.jsp?name=' + param + 'txtsearch='
						+ $('#inp1').value,
				success : function(result) {
					$('#id-form').html(result);
				}
			});
		}
		function tableHide(para, input) {
			$(para).hide();
			$(input).show();
		}
		function tableShow(para, input) {
			$(para).show();
			$(input).hide();
		}
	
		setTimeout(function() {
			$('#success').fadeOut('slow');
		}, 5000);
	</script>
		
	<style type="text/css">
	body {
		margin-top: 20px;
	}
	</style>
	
<title>Add Quantity</title>
</head>

<body>

<% 
	boolean higherDmgAmt = false;
	
	if (request.getAttribute("higherDmgAmt") != null)
	{
		higherDmgAmt = Boolean.parseBoolean(request.getAttribute("higherDmgAmt").toString()); 
				
	} 
%>

<script type="text/javascript">
	var app = angular.module('TBE',[]);
	app.controller('Quantity',function($scope){
			
		$scope.errorTot = function() {
			swal("Oops.. Damage Amount should be less than Total Amount")				
			};
				
		<% if (higherDmgAmt) { %>
				$scope.errorTot();
		<% }%>
	
		
	});
</script>

<div id="wrapper" ng-app="TBE" ng-controller="Quantity">
		<!-- ############################ -->
		<!-- Navigation -->    
		
		<div ng-include="'/TicketBookingEngine/views/navigation/navigation.html'"></div>
		<div id="page-wrapper">
		
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add Quantity For Items
                        </h1>                       
                    </div>
                    
                </div>

			
				
                <div class="row">
                
                	<div class="col-lg-12 table-responsive">    
                	            	
<form name="form1" method="post" action="/TicketBookingEngine/SearchQuantity" autocomplete="on">
	<fieldset>
		<legend>Search And Edit Quantity</legend>
		<div class="row">
			<div class="col-lg-2"></div>
				<!-- search string -->
				<div class="col-lg-6" align="justify">
					<input type="text" class="form-control" name="txtsearch" placeholder="Search Category..." id="inp1" autofocus required <% if(null!=request.getAttribute("key")){ %> value="<%=request.getAttribute("key").toString() %>" <%}%>>
				</div>

				<!-- search button -->
				<div class="col-lg-2" align="left">
					<button class="btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>

			<div class="col-lg-2"></div>

		</div>
	</fieldset>
</form>

 <table class="table table-striped table-bordered" id="id-form" style="width: 100%">

	<%
			ResourseController ev = new ResourseController();
			Vector<Vector<String>> qSearch;
				
				if (null != request.getAttribute("key")) 
				{
					qSearch = ev.getQuantityDetails(request.getAttribute("key").toString()); // to search
				} 
				else
				{
					qSearch = ev.getQuantityDetails();
				}
				
				String itemId="";
				String category="";
				String brand="";
				String description="";
				String totalAmount="";
				String damageAmount="";										
				int i =0;%>
			
				<tr> <p style="color: #00CC66"><b> * You Can change Total Amount and Damage Amount only</b></p></tr>
				<tr>
					<th style="width: 10%;color: #5E98EF">ItemID</th>
					<th style="width: 10%;color: #5E98EF">Item Category</th>
					<th style="width: 10%;color: #5E98EF">Item Brand</th>
					<th style="width: 10%;color: #5E98EF">Description</th>
					<th style="width: 10%;color: #5E98EF">Total Amount</th>
					<th style="width: 10%;color: #5E98EF">Damage Amount</th>
				</tr>
				<% for(Vector<String> Enq:qSearch)
				{
					itemId = Enq.get(0);
					category = Enq.get(1);
					brand = Enq.get(2);
					description = Enq.get(3);
					totalAmount = Enq.get(4);
					damageAmount = Enq.get(5);
					i++;
				%>
									
				<tr>
																				
					<input type="hidden" name="id" value="<%=itemId%>">
											
					<td class="warning" style="width: 14%;color: #FF5050"><%=itemId%></td>
										
					<td class="warning" style="width: 14%;color: #FF5050"><%=category%></td>
											
					<td class="warning" style="width: 14%;color: #FF5050"><%=brand%></td>
											
					<td class="warning" style="width: 14%;color: #FF5050"><%=description%></td>
											
					<td style="width: 14%">
					
						<p id="pcell<%=i %>" onclick="tableHide('#pcell<%=i %>','#cell<%=i %>')"><%=totalAmount%></p>					
					
						<div class="owner" id="cell<%=i %>">
						
							<form method="post" action="/TicketBookingEngine/AddQuantity" id="<%=i %>">
								<input style="width: 100%" name="id1" type="text" onkeypress="return isNumberKey(event)">
								<input type="hidden" name="id" value="<%=itemId%>">
								<input type="submit" class="btn-default">
							</form>
							
							<button class="btn-default" onclick="tableShow('#pcell<%=i %>','#cell<%=i %>')">Cancel</button>
						</div>
					
					</td>
					
					<%i++; %>
					
					<td style="width: 14%">
					
						<p id="pcell<%=i %>" onclick="tableHide('#pcell<%=i %>','#cell<%=i %>')"><%=damageAmount%></p>
						<div class="owner" id="cell<%=i %>">
						
							<form method="post" action="/TicketBookingEngine/AddQuantity" id="<%=i %>">
								<input style="width: 100%" name="id2" type="text" onkeypress="return isNumberKey(event)" >
								<input type="hidden" name="id" value="<%=itemId%>">
								<input type="submit" class="btn-default">
							</form>
							
							<button class="btn-default" onclick="tableShow('#pcell<%=i %>','#cell<%=i %>')">Cancel</button>
						</div>
					</td>
									
				</tr>
								
				<%
				}
	%>

</table>			
					</div>
 <a href="/TicketBookingEngine/views/quantity-add/excelFile.jsp">Export to Excel</a>

                    
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
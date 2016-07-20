<%@page import="com.tbe.model.History"%>
<%@page import="com.tbe.controller.Utilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="shortcut icon" href="/TicketBookingEngine/data1/browserIcon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Activity Log</title>
<!-- Angular JS -->
<script
	src="/TicketBookingEngine/bower_components/Angular/angular.min.js"></script>

<!-- Bootstrap Core CSS -->
<link
	href="/TicketBookingEngine/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="/TicketBookingEngine/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="/TicketBookingEngine/bower_components/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/TicketBookingEngine/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Sweet Alert -->
<link
	href="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js"></script>
</head>
<body>
	<% 
		boolean isSuccess = false;
		if (request.getAttribute("isSuccess") != null){
			isSuccess = Boolean.parseBoolean(request.getAttribute("isSuccess").toString()); 
		}
	%>
	<script>
		var app = angular.module('TBE',[]);
		app.controller('history',function($scope){
			$scope.ok = function() {
				swal("Good job!", "Cleared Activity Log", "success")				
			};
			
			<% if (isSuccess) { %>
				$scope.ok();
			<% } %>

		});
	</script>
   <div id="wrapper" ng-app="TBE" ng-controller="history">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>
        
        <!-- Page Content -->
        <div id="page-wrapper">
                <!-- /.row -->
                <div class="row">
                <hr>
                    <div class="col-lg-6">
                        <h4>Activity Log</h4>
                    </div>
                    <div class="col-lg-6">
                        <form action="/TicketBookingEngine/ClearHistory" method="post">
                        	<button type="submit" class="btn btn-primary"> Clear Activity Log </button>
                        </form>
                    </div>
                </div>
                <%@page import="java.util.*" %>
                <% 
                	Utilities util = new Utilities(); 
                	History history;
                	Vector<Vector<String>> historyData = util.getHistory();
                %>
             
                
				<table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table" class="table table-hover">
				<tr>
					<th class="table-header-repeat line-left"><a href=""></a></th>
					<th class="table-header-repeat line-left"><a href="">Action</a>	</th>
					<th class="table-header-repeat line-left"><a href="">Date</a></th>
					<th class="table-header-repeat line-left"><a href="">Time</a></th>
					<th class="table-header-repeat line-left"><a href="">Time from now</a></th>
					<th class="table-header-repeat line-left"><a href="">Type</a></th>
				</tr>
				<%
					int count = 1;
					for (Vector<String> item : historyData){
						history = new History(item.get(1),item.get(2),item.get(3));
				%>
				<tr style="background-color:<% if(history.getAction()=="Add" ){ %> aliceblue <% }else if(history.getAction()=="Edit" ){%> darkseagreen <%} else if(history.getAction()=="Delete" ){ %> antiquewhite <%} %>">
					<td><%=count %></td>
					<td><%=history.getCaption() %></td>
					<td><%=history.getDateTime().split(" ")[0] %></td>
					<td><%=history.getDateTime().split(" ")[1] %></td>
					<td><%=history.getTimeFromNow() %></td>
					<td><%=history.getAction() %></td>
				</tr>
				<%
					count++;
				}
				%>
				</table>
			
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    <!-- /#wrapper -->

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
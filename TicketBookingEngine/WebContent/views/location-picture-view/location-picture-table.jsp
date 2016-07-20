<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="shortcut icon" href="/TicketBookingEngine/data1/browserIcon.ico">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Location Pictures</title>

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
	
	<!-- Font Awesome -->
	 <link href="/TicketBookingEngine/bower_components/font-awesome-default/font-awesome.min.css" rel="stylesheet" type="text/css">
	 <link href="/TicketBookingEngine/bower_components/font-awesome-default/font-awesome.css" rel="stylesheet" type="text/css">
	
	<!-- Sweet Alert -->
	<link href="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.css" rel="stylesheet" type="text/css">
	<script src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert-dev.js"></script>
	<script src="/TicketBookingEngine/bower_components/sweet-alert/sweetalert.min.js"></script>
	
	<!-- Dedicated Js -->
	<script type="text/javascript" src="/TicketBookingEngine/views/location-picture-view/location-pictures.js"></script>
	
	<!-- Open Window Script : Ashen -->    
	<script type="text/javascript">
 		function openPage(pageURL)
 		{
			window.location.href = pageURL;
 		}
	</script>

</head>

<body>
    <div id="wrapper" ng-app="TBE" ng-controller="locationpics">

        <div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <%@page import="com.tbe.controller.LocationPicturesController"%>
    			<%@page import="com.tbe.model.LocationPictures"%>    		
				<%@page import="java.util.*" %>
				<%LocationPicturesController lc = new LocationPicturesController();
				Vector<Vector<String>> Enquiry;
				if (null!=request.getAttribute("Loc")){
					if (null!=request.getAttribute("kw")){		
						Enquiry = lc.searchPictures(request.getAttribute("Loc").toString(), request.getAttribute("kw").toString());
					} else {
			   			Enquiry = lc.getPictures(request.getAttribute("Loc").toString());
					}
				} else {
					if (null!=request.getAttribute("kw")){		
						Enquiry = lc.searchPicturesNoLoc(request.getAttribute("kw").toString());
					} else {
			   			Enquiry = lc.getPicturesAll();
					}
				}%>
                <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">Location Pictures</h4>
                        
                   		<div class="form-group input-group">
                     		<form action="/TicketBookingEngine/SearchPictures" method="post" class="form-inline">
  								<div class="form-group">
  									<label>Location </label>
  								</div>
  								<div class="form-group">
                                <select name="Loc"  class="form-control">
                                	<option value="Any">Any</option>
                                	<%Vector<Vector<String>> Enquir = lc.getLocationList();
			   						String Location = null;
									String LocId = null;
			   						for (Vector<String> Enq:Enquir){
			   						Location = Enq.get(0); 
									LocId = Enq.get(1); %>
			   						<option value="<%=LocId%>"><%=Location %></option>			
									<%}%>
                                </select>
                                </div>
                                <div class="form-group">
                                <input type="text" name="search" placeholder="Search Keyword" class="form-control" <% if(null!=request.getAttribute("kw")){ %> value="<%=request.getAttribute("kw").toString() %>" <%}%>>
                                </div>
                                <div class="form-group">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            	</div>
                            	<div class="form-group">
                            	<input type="button" value="Grid View" class="btn btn-info" onClick=openPage("/TicketBookingEngine/views/location-picture-view/location-picture-matrix.jsp") >
                            	</div>
                            	<div class="form-group">
                            	<input type="button" value="Add New Pictures" class="btn btn-info" onClick=openPage("/TicketBookingEngine/views/location-picture-add/location-picture-upload.jsp") >
                            	</div>
                            </form>
                            </div>
                            <% String msg=null;
							   if (null!=request.getAttribute("message")){
							   		msg = request.getAttribute("message").toString();
							%>
                            <div class="alert alert-success">
                    			<strong>Well done!</strong> <%=msg %>
                			</div>
							<%}%>
                        <!--  start product-table ..................................................................................... -->
				<form id="mainform" action="/TicketBookingEngine/DeletePicturesServlet" method = "post">
				<table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table" class="table table-hover">
				<tr>
					<th class="table-header-repeat line-left"><a href=""></a></th>
					<th class="table-header-repeat line-left"><a href="">Picture</a>	</th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">Picture Id</a></th>
					<th class="table-header-repeat line-left"><a href="">Name</a></th>
					<th class="table-header-repeat line-left"><a href="">Location</a></th>
					<th class="table-header-repeat line-left"><a href="">Description</a></th>
					<th class="table-header-options line-left"><a href="">Options</a></th>
				</tr>
							
			   	<% LocationPictures lp;
			   	String Url = null;
			   	String QString = null;
			   	int count = 0;
			   	
			   	for (Vector<String> Enq:Enquiry){
				   lp = new LocationPictures();
				   lp.setPicid(Enq.get(0));
			   	   lp.setName(Enq.get(1)); 
			   	   lp.setUrl(Enq.get(2));
			   	   lp.setLocation(Enq.get(3));
			   	   lp.setDescription(Enq.get(4));
			   	   int index = lp.getUrl().indexOf("data1");
			   	   Url = "/TicketBookingEngine/" + lp.getUrl().substring(index);			   	   
			   	   %>
				<tr>
					<td><input type="checkbox" value="" name="cb_<%=lp.getPicId()%>"></td>
					<td><%=lp.getPicId() %></td>
					<td><img src="<%=Url %>" alt="Smiley face" height="100" width="100" class="img-rounded"></td>
					<td><%=lp.getName() %></td>
					<td><%=lp.getLocation() %></td>
					<td><%=lp.getDescription() %></td>
					<%//QString = "?Id="+ lp.getPicId() +"&Url="+ Url.replace(" ", "%20") + "&Name=" + lp.getName().replace(" ", "%20") + "&Desc=" + lp.getDescription().replace(" ", "%20");
					QString = "?Id="+ lp.getPicId() ;%>
					<td class="options-width">
						<button type="button" name="btnEd_<%=count%>" onclick=openPage("/TicketBookingEngine/views/location-picture-edit/location-picture-edit.jsp<%=QString %>") class="btn btn-default"><i class="icon-edit"></i></button>
						<button  type="submit" name="btnDel_<%=lp.getPicId()%>" class="btn btn-default"><i class="icon-trash"></i></button>
					</td>
				</tr>
				<%
				count++; 
				}
			   	 %>
				</table>
				<button type="submit" name="btnDelAll" class="btn btn-danger">Delete Selected</button>
				</form>
				<!--  end product-table................................... -->                         </div>
                    </div>     
                        
                    </div>
                    <!-- /.col-lg-12 -->
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

</body>

</html>

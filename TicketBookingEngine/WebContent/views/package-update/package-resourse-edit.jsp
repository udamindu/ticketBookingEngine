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

    <title>Package Resource EditForm</title>
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
<script type="text/javascript">
	var app = angular.module('TBE',[]);
	app.controller('Package',function($scope){
		
	});
	</script>
	
	 <div id="wrapper" ng-app="TBE" ng-controller="Package">
		<!-- ############################ -->
		<!-- Navigation -->
		
		<div ng-include="'/TicketBookingEngine/views/navigation/navigation.jsp'"></div>
        
        <!-- Page Content -->
        <div id="page-wrapper">
             <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Edit Packages
                        </h1>
                       
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6"  ng-app="SVGApp" ng-controller="SVGCtrl">

                       
                        <form id="form1" method="post" action="/TicketBookingEngine/updatePackRes">
                        
                        
                    <%@page import="java.util.*"%>
					<%@page import="java.lang.*"%>
					<%@page import="java.sql.*"%>
					<%@page import="com.tbe.controller.PackageController"%>
					<%@page import="com.tbe.model.Package"%>
					
					<%
					PackageController em = new PackageController();
						String itemID = null;
						String Rcatergory=null;
						String Rname=null;
						String Rquantity=null;
						
					
						
						Vector<Vector<String>> Enquiry = em.getPackageDetails(request.getParameter("PItemID"));	
						//Vector<Vector<String>> Enquiry = em.getResourseDetails();
						
						for(Vector<String> Enq:Enquiry){
										
									 	itemID = Enq.get(0);
									 	Rname = Enq.get(2);
									 	Rcatergory = Enq.get(1);
									 	Rquantity = Enq.get(3);
									 	
									 
										
											System.out.println(itemID);
								            System.out.println(Rname);
								            System.out.println(Rcatergory);
								            System.out.println(Rquantity);
								    	
									}	
							
					%>
					     
                        <div class="form-group" name="type">
                         <div class="form-group">
                                <label>Type</label>
                                <small><label value="<%=Rcatergory%>" > {{ aa }} </label></small> 
                                
                                 <div class="form-group">
                                            <label>Select Resource Catergory</label>

                                            <select class="form-control" name="Type" ng-model="aa" value="<%=Rcatergory%>">
                                             <%try{
                                            	 Vector<Vector<String>> Enquiry2 = em.getResCatDetails();
                         									for(Vector<String> Enq:Enquiry2){
                         										Rcatergory = Enq.get(0);
                             				 %>
                                                <option id="list2"  ><%=Rcatergory %></option>
                                                   <%
                                  }
                            	}catch(Exception e){
                            	  e.printStackTrace();
                                 }	
                              %>
                              
                                            </select>
                                        </div>
                                
                            </div>
                        <script>	
	var app = angular.module('SVGApp',[]);
	app.controller('SVGCtrl',function($scope){
		 $scope.aa="<%=Rcatergory %>";
		 $scope.bb="<%=Rname %>";
		 $scope.cc="<%=Rquantity %>";
		 
	});
</script>
               
                              
                            </div>     
                              <input type=hidden id="thisField" name="itemID" value="<%=request.getParameter("itemID") %>">
                      

                           <%--  <div class="form-group">
                                <label>Name</label>
                                <input class="form-control" placeholder="Enter Package Name" name="name" value="<%=name %>" required="required">
                                <p class="help-block"></p>
                            </div>
                             --%>
                         
                            

                            <div class="form-group">
                                <label>Name</label>
                                 <small><label> {{ bb }} </label></small>
                                 <select class="form-control" name="location" ng-model="bb" value="<%=Rname %>">
                                             <%try{
                                            	 Vector<Vector<String>> Enquiry2 = em.getPackageDetails();
                         									for(Vector<String> Enq:Enquiry2){
                         										Rname = Enq.get(0);
                             				 %>
                                                <option id="list2" value="<%=Rname%>" ><%=Rname %></option>
                                                   <%
                                  }
                            	}catch(Exception e){
                            	  e.printStackTrace();
                                 }	
                              %>
                              
                                           </select>
                               <%--   <input class="form-control" placeholder="Enter Location" name="location" value="<%=location %>" required="required">
                                 <p class="help-block"></p> --%>
                            </div>
                            
                      
               <div class="form-group">
                                <label>Quantity</label>
                                <input class="form-control" placeholder="Enter Package Name" name="name" value="<%=Rquantity %>" required="required">
                                <p class="help-block"></p>
                            </div>
                            
                           <%--  <div class="form-group">
                                <label>Quantity</label>
                                 <small><label> {{ cc }} </label></small>
                                 <select class="form-control" name="company" ng-model="cc" value="<%=Rquantity %>">
                                             <%try{
                                            	 Vector<Vector<String>> Enquiry2 = em.getLocComDetails();
                         									for(Vector<String> Enq:Enquiry2){
                         										Rquantity = Enq.get(0);
                             				 %>
                                                <option id="list2" value="<%=Rquantity%>" ><%=Rquantity %></option>
                                                   <%
                                  }
                            	}catch(Exception e){
                            	  e.printStackTrace();
                                 }	
                              %>
                              </select>
                                <input class="form-control" placeholder="Enter company" name="company" value="<%=company %>" required="required">
                                 <p class="help-block"></p>
                            </div> --%>

                         <%--    <div class="form-group">
                                <label>Package Description</label>
                                <textarea class="form-control" rows="3"  name="description" value="<%=request.getParameter("Desc") %>" required="required"><%=description %></textarea>
                              
                                 <p class="help-block"></p>
                            </div> --%>
                            
                         <%--    <div class="form-group">
                                <label>tot</label>
                                <div class="form-group input-group">
                                <span class="input-group-addon">Rs.</span>
                                <input type="text" class="form-control" name="tot" onkeypress="return isNumberKey(event)" value="<%=tot %>" required="required">
                                <span class="input-group-addon">.00</span>
                            </div>
                                <p class="help-block">Example:- 800 , 2500 ..</p>
                            </div> --%>

                             

                            <!-- <div class="form-group">
                                <label>Select Image</label>
                                <input type="file" class="file_1" name="image" placeholder="Select Image" required="required">
                            </div>
                             -->
                                                

                            
                            <button type="submit" class="btn btn-default">Submit </button>
                            <button type="reset" class="btn btn-default">Reset </button>
                            
                            <button type="button" class="btn btn-default" onclick=openPage("package-editform.jsp")>Back </button>
                            
                            </br>
                            </br>
                            </br>
                                                 
                        </form>
                         <div class="col-lg-12">
                            
                      </div>
                      
                      <div class="col-lg-12">
                      
                        </div>
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
  <title>No Title</title>
  
</head>
<body>
	
	<div class="container">
  <h2>Expand and Collapse with different icons</h2>
    <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#demo">
      <span class="glyphicon glyphicon-collapse-down"></span> Open
    </button>
  <div id="demo" class="collapse">
    Hi Uthpala
    My original Intention was to
    Test This Collapsible
    Panel
  </div>
</div>

<script>
$(document).ready(function(){
  $("#demo").on("hide.bs.collapse", function(){
    $(".btn").html('<span class="glyphicon glyphicon-collapse-down"></span> Open');
  });
  $("#demo").on("show.bs.collapse", function(){
    $(".btn").html('<span class="glyphicon glyphicon-collapse-up"></span> Close');
  });
});
</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script src="/TicketBookingEngine/bower_components/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $('#slct').change(function change() {
            var select = document.getElementById("slct");
            var divv = document.getElementById("container");
            var value = select.value;
            if (value == 1) {
                toAppend = "<input type='textbox' >"; divv.innerHTML=toAppend; return;
                }
                if (value == 2) {
                    toAppend = "<input type='textbox' >&nbsp;<input type='textbox' >";divv.innerHTML = toAppend;  return;
                }
                if (value = 3) {
                    toAppend = "<input type='textbox' >&nbsp;<input type='textbox' >&nbsp;<input type='textbox' >";divv.innerHTML = toAppend;  return;

                }
        });

    });
     </script>
     
</head>
<body>

<select id="slct" onchange="change();">
 <option value="1"> 1 </option>
 <option value="2"> 2 </option>
 <option value="3"> 3 </option>
</select>
  <div id="container"></div>
</body>
</html>
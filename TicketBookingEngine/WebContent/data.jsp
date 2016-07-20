<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <script type="text/javascript">
    function gotoExcel(elemId, frmFldId)
    {
        var obj = document.getElementById(elemId);
        var oFld = document.getElementById(frmFldId);
        oFld.value = obj.innerHTML;
 
    }
</script>

<div id="tableData">
  <table border="1"><tr>
  <th>SKU </th>
  <th>Highest total</th>
  <th>Second Highest total</th></tr>
  <tr><td>Data 1</td><td>Data 2</td><td>Data 3</td></tr>
  <tr><td>Data 121</td><td>Data 22</td><td>Data 33</td></tr>
  </table>
</div>
<% String  exportFileName = null;%>

<form action="excel.jsp">
    <input type="hidden" id="tableHTML" name="tableHTML" value="" />
    <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
    <input type="submit" onclick="gotoExcel('tableData', 'tableHTML');" value="Export these results" />
</form>

</body>
</html>
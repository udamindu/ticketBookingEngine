<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

			<form name="form1">
                  <table border="1">
                        <tr bgcolor="#336699">
                              <td onclick="ChangeCell(this)">AAAAA</td>
                              <td onclick="ChangeCell(this)">BBBBB</td>
                              <td onclick="ChangeCell(this)">CCCCC</td>
                              <td onclick="ChangeCell(this)">DDDDD</td>
                        </tr>
                  </table>
                  <input type="hidden" name="hdnText">
            </form>

</body>

 		<script language="javascript">
            var strText;
            var prevObject, prevHTML, bClickTrue;
            bClickTrue = false;
            
            function ChangeCell(obj)
            {
                  strText = "<input type='text' onchange='document.form1.hdnText.value=this.value;' value='" + obj.innerText + "' name='txtInput'>";
                  
                  //Assigning the original value for the previous TD
                  if (bClickTrue == true && obj.children.length == 0)
                  {
                      prevObject.innerHTML = prevHTML;
                      prevObject.innerText = document.form1.hdnText.value;
                  }
                  if (obj.children.length == 0)
                  {
                        prevObject = obj;
                        prevHTML = obj.innerHTML;
                        document.form1.hdnText.value = obj.innerText;
                        obj.innerHTML = strText;
                        obj.childNodes[0].focus();
                        bClickTrue = true;
                  }
                  
                        
            }
      </script>
</html>
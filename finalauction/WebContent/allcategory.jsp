
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@include file='head.jsp'%>
</head>
<body>


	<div class="container-fluid" style="width:500px; margin-top:50px;">
	<div class="row">
        <div class="col-md">

				<form class="form-group text-center" style="color: #757575;" method="post">
					


<table class="table">
<tr>
<td>
Choose Category
</td>
<td>

<%
String d1=l1.filldropdown("select * from tblcategory", "cmbcategory", "cname", "cid");
out.println(d1+"");
%>
</td>
</tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>
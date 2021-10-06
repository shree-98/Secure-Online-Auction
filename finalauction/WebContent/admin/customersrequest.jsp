<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Insert title here</title>
</head>
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;">
<%@include file="header.jsp" %>
<%
String btn=request.getParameter("btnsave");
if(btn!=null)
{
	l1.filllabel_multiple("select * from tbluser", "email", "50% OFF on all brands", "Come visit us online");
}


%>
<br><br><br><br><br>
    <div class="col-md-3">

				<form class="form-group text-center" style="color: #757575;" method="post">
					
</div>
<div class="col-md-6">

 <div class="jumbotron">


<table class="table">
<Tr>
<td class="w3-border-0"><h4><b>Click On The Below Button To send Request to visit The Site</b></h4>
</td></tr>
<tr><td class="w3-border-0" align=center>
<input type="submit" name="btnsave" value="Send" class="btn btn-primary">
</td>
</Tr>

</table>
</div>

</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
</body>
</html>
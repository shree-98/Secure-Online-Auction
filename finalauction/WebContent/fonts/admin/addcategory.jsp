<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%//@include file="menu.jsp" %>
<%

String btn=request.getParameter("btnsave");
if(btn!=null)
{
	String cname=request.getParameter("txtcname");
	l1.dml("insert into tblcategory(cname)values('"+cname+"')");
}

%>
<div class="col-md-6">
<form method="post">
<table>
<tr>
<td>
Add Category
</td>
<td>
<input type="text" name="txtcname">
</td>
</tr>
<tr>
<td>
<input type="submit" name="btnsave" value="Add Category">

</td>
</tr>
</table>
</form>
<%@include file="footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import='java.sql.*' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<%@include file="header.jsp" %>
<title>Delete form</title>

</head>
<body>
<%
String dltid=request.getParameter("upid");
%>
<script>
var retVal = confirm("Do you want to continue ?");

if( retVal == true )
{

<%

//l1.dml("delete from tblproduct where pid='"+dltid+"'");
	{
		%>
		alert("Product delete Successfull");
		window.location.href="showonly.jsp";
		<% 
	}
%>
}
else
{	
	window.location.href="detailsOfUproduct.jsp?did="dltid);
}
    </script>
</body>
</html>
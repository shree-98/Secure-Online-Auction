<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import='java.sql.*' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Add product form</title>
</head>
<body>

<%
String id=request.getParameter("id");
String fno=request.getParameter("fid");
String sno=request.getParameter("sid");
String bid=request.getParameter("bid");
String catid=request.getParameter("catid");

l1.dml("delete from tblproduct where pid='"+id+"'");
	{
		%>
		<script>
		alert("Product deleted Successfull");
		window.location.href="showproduct.jsp";
		</script>
		<% 
	}

	l1.dml("delete from tblcomplaint where fno='"+fno+"'");
	{
		%>
		<script>
		alert("complaint deleted Successfull");
		window.location.href="showcomplaint.jsp";
		</script>
		<% 
	}

	l1.dml("delete from tbluser where uid='"+sno+"'");
	{
		%>
		<script>
		alert("Record deleted Successfull");
		window.location.href="showsell.jsp";
		</script>
		<% 
	}
	l1.dml("delete from tblcomplaint where uid='"+bid+"'");
	{
		%>
		<script>
		alert("complaint deleted Successfull");
		window.location.href="showuser.jsp";
		</script>
		<% 
	}

	l1.dml("delete from tblcategory where uid='"+catid+"'");
	{
		%>
		<script>
		alert("category deleted Successfull");
		window.location.href="allcategory.jsp";
		</script>
		<% 
	}

%>

</body>
</html>
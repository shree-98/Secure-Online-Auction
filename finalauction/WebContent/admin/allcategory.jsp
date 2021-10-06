
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all categories</title>
<%@include file='head.jsp'%>
</head>
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;">
<%@include file='header.jsp'%>

<br>
<div class="row">
<div class="container-fluid" style="width:500px; margin-top:50px;">
<div class="col-md-12">
	<!-- Card -->
	<div class="jumbotron">
<div class="card">

  <!-- Card image -->
  
<table class="table">
<tr><td class="w3-border-0"><h3><b>Category Name</b></h3></td></tr>
<%
l1.conOpen();
l1.rs=l1.stmt.executeQuery("select * from tblcategory where cid!=0");
	while(l1.rs.next())
	{
		%>
<tr>
<Td class="w3-border-0"><h4><b>
	<% out.println(l1.rs.getString("cname"));%></b>
</h4></td>
<td class="w3-border-0">
<a href="deleteproduct.jsp?catid=<%out.println(request.getParameter("cid"));%>" class="white-text d-flex justify-content-end"><h4><font color="blue">DELETE</font></h4></a></td></tr>

<% 

}
l1.conClose();
%>
<tR>
</tR>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
<br><br><br><br><br>
<%@include file='footer.jsp'%>
</body>
</html>
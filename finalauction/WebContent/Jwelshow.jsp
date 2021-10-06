<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<%@include file='head.jsp'%>
</head>
<body>
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>


<div class="row">

<%
 String cid=request.getParameter("cid");

l1.conOpen();
l1.rs=l1.stmt.executeQuery("select * from tblproduct where cid="+cid);
while(l1.rs.next())
{
	%>
	<div class="col-md-6">
	<!-- Card -->
<div class="card">

  <!-- Card image -->
<table class="table">
<Tr>
<Td>
Product Name
</Td>
<Td>
	<% out.println(l1.rs.getString("pname"));%>
</td>
</tr>
<tr>
<Td>
Product NO.
</Td>
<Td>
	<% out.println(l1.rs.getString("pno"));%>
</td>
</tr>
<Tr>
<td>
Product Minimum Price
</td>
<Td>
	<% out.println(l1.rs.getString("pmprice"));%>
</td>
</Tr>
<Tr>
<td>
Product Date
</td>
<Td>
	<% out.println(l1.rs.getString("pdate"));%>
</td>
</Tr>
<Tr>
<td>
Product Time
</td>
<Td>
	<% out.println(l1.rs.getString("ptime"));%>
</td>
</Tr>
<Tr>
<td>
Product Image 
</td>
<Td>
	<% out.println(l1.rs.getString("pimage"));%>
</td>
</Tr>

<tr>
<td>
<a href="showdetails.jsp?id=<%out.println(l1.rs.getString("pid"));%>">View Details</a>
</td>
</tr>
</table>
</div>
</div>
<% 
}
l1.conClose();
%>
</div>

<%@include file='footer.jsp'%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<%@include file='head.jsp'%>
</head>
<body style="background-image: url('images/my7.jpg'); no-repeat; background-size:cover; opacity:;">
<div style="background-image: url('images/my7.jpg');">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>
<br><br>
<div class="row">

<%
try
{
l1.conOpen();
l1.rs=l1.stmt.executeQuery("select * from tblproduct");
while(l1.rs.next())
{
	%>
	
	<div class="col-md-4">
	<div class="container" style="width: 400px;">
<div class="card">
<div class="jumbotron">
	
	
 <div class="item g1">
						
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=400px>
<div class="agile-dish-caption">
								
<table class="table">
<tr>
<Td class="w3-border-0">
<h4><font color="red"><% out.println(l1.rs.getString("pname"));%></font></h4>	
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<font color="white"><b>Product No.:</b></font>
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pno"));%>
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<b>Product Minimum Bid Amount:</b>
</Td>
<Td class="w3-border-0">
	₹<% out.println(l1.rs.getString("pmprice"));%>
</td>
</tr>

<tr>
<Td class="w3-border-0">
<b>Ending Date:</b> 
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pdate"));%>
</td>
</tr>
<Tr>
<td class="w3-border-0">
<b>Ending Time:</b>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("ptime"));%>
</td>
</Tr>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
<% 
}
l1.conClose();
}
catch(Exception e)
{}
%>
</div>
</div>
<br><br>
<% //response.sendRedirect("viewcart.jsp"); %>
<%@include file='footer.jsp'%>
</body>
</html>





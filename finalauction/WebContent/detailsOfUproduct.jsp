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
<div style="background-image: url('images/my7.jpg');">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>
<br>
<div class="row">
<%
l1.conOpen();
String btn=request.getParameter("btnsave");
String did=request.getParameter("did");


if(btn!=null)
{
	String uid=session.getAttribute("uid")+"";
	String cmb=request.getParameter("txtubid");
	if(l1.dml("insert into tblcart1(pid,qty,uid)values('"+did+"','"+cmb+"','"+uid+"')"))
	{
		out.println("success");
	}
	else
	{
		out.println("error");
	}
}
		
	

l1.rs=l1.stmt.executeQuery("select * from tblproduct where pid="+did);
if(l1.rs.next())
{
	%>
	<div class="col-md-1"></div>
	<div class="col-md-10">
<div class="card">
	<div class="w3-container w3-white w3-cell">
	
  <!-- Card image -->
  <form method="post">
  <div class="w3-container w3-center w3-animate-zoom">
  
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height="400" width="400">
</div>
</div>
<div class="w3-container w3-white w3-cell">

<table class="table">
<tr>
<Td class="w3-border-0">
<h2><font color="red"><% out.println(l1.rs.getString("pname"));%></font></h2>
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<b>Product No.</b>
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pno"));%>
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<b>Product Minimum Bid Amount</b>
</Td>
<Td class="w3-border-0">
	₹<% out.println(l1.rs.getString("pmprice"));%>
</td>
</tr>

<tr>
<Td class="w3-border-0">
<b>Ending Date</b>
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pdate"));%>
</td>
</tr>
<Tr>
<td class="w3-border-0">
<b>Ending Time</b>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("ptime"));%>
</td>
</Tr>
<Tr>
<td class="w3-border-0">
<b>Product Description</b>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pdesc"));%>
</td>
</Tr>

<Tr>
<td class="w3-border-0">
<b>Current maximum price</b>
</td>
<td class="w3-border-0"><h3><b>
	₹<% l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+did);
		if(l1.rs.next())
		{
		out.println(l1.rs.getString("abc"));
		}	
	%>
	</b></h3>
</td>
</Tr>
<tr><td class="w3-border-0">
<a href="updateproduct.jsp?upid=<%out.println(request.getParameter("did"));%>" class="w3-button w3-blue"><h4>EDIT</h4></a>
</td>

<td class="w3-border-0"><a href="delete.jsp?upid=<%out.println(request.getParameter("did"));%>" class="w3-button w3-blue"><h4>DELETE</h4></a></td>
</tr>
</table>
</form>
</div>
</div>
</div>
<% 
}
l1.conClose();
%>
</div>
</div>
<br><br>
<%@include file='footer.jsp'%>
</body>
</html>
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
<div style="background-image: url('images/poster3.jpg'); background-size: 100%;">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>


<div class="row">
<div class="container-fluid" style="width:500px; margin-top:50px;">
<div class="col-md-12">
	<!-- Card -->
	<div class="jumbotron">
<div class="card">

  <!-- Card image -->
  <%
//  String uid=session.getAttribute("uid")+"";
 // if(l1.exists("select * from tblcart1 where uid!="+uid))
	//  {
	  //out.println("<center><h1>Cart is Empty</h1></center>");
	  //}
  //else
  //{
	  %>
<table class="table">
<%

l1.conOpen();
String uid=session.getAttribute("uid")+"";
String cartid=request.getParameter("cartid");
l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+cartid);
if(l1.rs.next())
{
    String x=l1.rs.getString("abc");
	l1.rs=l1.stmt.executeQuery("select * from tblproduct,tbluser,tblcart1 where tbluser.uid=tblcart1.uid and tblcart1.pid=tblproduct.pid and tblcart1.status=0 and tblcart1.pid='"+cartid+"' and tblcart1.qty="+x);
	while(l1.rs.next())
	{
		%>
<tr>
<td><b>Product Name:</b></td>
<Td>
	<% out.println(l1.rs.getString("pname"));%>
</td></tr>
<tr>
<td><b>Product Minimum Price:</b></td>
<Td>
	<% out.println(l1.rs.getString("pmprice"));%>
</td>
</tr>
<tr>
<td><b>Your Bid Amount:</b></td>
<Td>
	<% out.println(l1.rs.getString("qty"));%>

</Td>
</tr>
<tr>
<td><b>Buyer Name:</b></td>
<Td>
	<% out.println(l1.rs.getString("uname"));%>

</Td>
</Tr>
<tr><td>

	<a href="bill.jsp?cartid=<%out.println(request.getParameter("cartid"));%>" class="white-text d-flex justify-content-end"><h4><i>View Bill >><i></i></h4></a></td></tr>

<% 
	}
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
<%@include file='footer.jsp'%>
</body>
</html>
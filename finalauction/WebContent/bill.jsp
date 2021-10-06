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
<%
l1.conOpen();
String btn=request.getParameter("btnpay");
String uid=session.getAttribute("uid")+"";

if(btn!=null)
{
	String cartid=request.getParameter("cartid");
	l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+cartid);
	if(l1.rs.next())
	{
		String max=l1.rs.getString("abc");
		
		String quantity1=l1.filllabel("select * from tblcart1 where pid='"+cartid+"' and qty="+max, "quantity");
		
		String pstock=l1.filllabel("select * from tblproduct where pid="+cartid, "pstock");
		
		int pstock1=Integer.parseInt(pstock);
		int quantity2=Integer.parseInt(quantity1);
		int calc=pstock1-quantity2;
		
	l1.dml("update tblproduct set pstock='"+calc+"'  where pid="+cartid);
	l1.dml("update tblcart1 set status=1  where pid="+cartid);
	}
}
%>

<div class="row">
<div class="container-fluid" style="width:500px; margin-top:50px;">
<div class="col-md-12">
	<!-- Card -->
		<div class="jumbotron">
	
<div class="card">

  <!-- Card image -->
  <form method="post">
<table class="table">
<%
int d=0;
l1.conOpen();
String cartid=request.getParameter("cartid");
l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+cartid);
while(l1.rs.next())
{
	String x=l1.rs.getString("abc");
	l1.rs=l1.stmt.executeQuery("select * from tblproduct,tbluser,tblcart1 where tbluser.uid=tblcart1.uid and tblcart1.pid=tblproduct.pid and tblcart1.status=0 and tblcart1.pid='"+cartid+"' and tblcart1.qty="+x);
	while(l1.rs.next())
	{
	%>
	<tr>
	<td><b>Buyer Name:</b></td>
<Td>
	<% out.println(l1.rs.getString("uname"));%>
</td>
</tr>
<tr>
<td><b>Email:</b></td>
<Td>
	<% out.println(l1.rs.getString("email"));%>
</td></tr>
<tr>
<td><b>Address:</b></td>
<Td>
	<% out.println(l1.rs.getString("addr"));%>

</Td></tr>
	
	<tr>
	<td><b>Product Name:</b></td>
<Td>
	<% out.println(l1.rs.getString("pname"));%>
</td>
</tr>
<tr>
<td><b>Product quantity:</b></td>
<Td>
	<% out.println(l1.rs.getString("quantity"));%>

</Td></tr>
<tr>
<td><b>Product Maximum Bid:</b></td>
<Td>
	<%
	out.println(x);
	%>
	
</td></tr>

<tr><td><b>Total:</b></td>
<Td>
	<% int a=Integer.parseInt(l1.rs.getString("quantity"));
	int b=Integer.parseInt(l1.rs.getString("qty"));

int c=a*b;
d=d+c;
out.println(c);
		
	%>
</Td>
</Tr>
<tr>
<Td>
<input type="submit" name="btnpay" value="Pay Now" class="btn btn-success">

</Td>
</tr>

<% 
	}
}
l1.conClose();
%>
</table>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file='footer.jsp'%>
</body>
</html>
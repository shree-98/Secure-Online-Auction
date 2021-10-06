<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file='head.jsp'%>
</head>
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;">
<%@include file='header.jsp'%>

<div class="row">
<%
l1.conOpen();
String did=request.getParameter("id");
l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+did);
if(l1.rs.next())
{
	String max=l1.rs.getString("abc");
	

l1.rs=l1.stmt.executeQuery("select tbluser.uid,tbluser.uname,tbluser.email,tbluser.upass,tbluser.addr,tbluser.phone,tbluser.state,tbluser.city,tbluser.zcode,tbluser.panno from tblproduct,tbluser,tblcart1 where tbluser.uid=tblcart1.uid and tblcart1.pid=tblproduct.pid and tblcart1.qty='"+max+"' and tblcart1.pid="+did);
	%>
	
	
	<h2 class="card-header info-color white-text text-center py-4">
    <strong><font color="white">Manage User</font></strong>
  </h2>
	<div class="container-fluid" style="width:500px; margin-top:50px;">
	<div class="row">
	<div class="col-md-12">
	<!-- Card -->
<div class="card">
<div class="jumbotron">
  <!-- Card image -->
 <table   class="table">
<% 

while(l1.rs.next())
{
%>
	<tr>
	<Tr>
<Td>
<b>User Name:</b>
</Td>
	<Td>
	<% out.println(l1.rs.getString("uname"));%>
	</td>
</Tr>
<tr>
<Td>
<b>Email:</b>
</Td>
	<Td>
	<% out.println(l1.rs.getString("email"));%>
	</td>
	</tr>
	<tr>
	<td>
	<b>Password:</b>
	</td>
<Td>
	<% out.println(l1.rs.getString("upass"));%>
	</td>
	</tr>
	<tr>
	<Td>
<b>Address:</b>
</Td>
		<Td>
	<% out.println(l1.rs.getString("addr"));%>
	</td>
	</tr>
	<tr>
	<Td>
<b>Mobile No:</b>
</Td>
	
	<Td>
	<% out.println(l1.rs.getString("phone"));%>
	</td>
	<tr>
<Td>
<b>State:</b>
</Td>
		<Td>
	<% out.println(l1.rs.getString("state"));%>
	</td>
	</tr>
	<tr>
	<td>
	<b>City:</b>
	</td>
	<Td>
	<% out.println(l1.rs.getString("city"));%>
	</td>
	</tr>
	<tr>
	<td>
	<b>Zcode:</b>
	</td>
	<Td>
	<% out.println(l1.rs.getString("zcode"));%>
	</td>
	</tr>
	<tr>
	<td>
	<b>Pan card No. :</b>
	</td>
	<Td>
	<% out.println(l1.rs.getString("panno"));%>
	</td>
	</tr>
	<tr>
<td colspan=2 align=center>
<a href="sendmail2.jsp?id=<%out.println(l1.rs.getString("uid"));%>&id2=<%out.println(request.getParameter("id"));%>" class="w3-button w3-red"><h3>Send Mail</h3></a></td></tr>

	<% 
}
}
%>


	</table>
  </div>
  </div>
  </div>
</div>

<!-- Card -->
	
	</div>
	
</div>

<%@include file='footer.jsp'%>
</body>
</html>
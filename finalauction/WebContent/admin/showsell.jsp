<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ page import="java.util.Date" %>
      <!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<title>seller</title>
<link href="css/style11.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src='js/script.js'></script>
<%@include file='head.jsp'%>
</head>
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;"> 
<%@include file='header.jsp'%>


<br><br><br>
<div class="row">



<h2 class="card-header info-color white-text text-center py-4">
    <strong>All Sellers</strong></h2>
<br><br>


	<div class="col-md">
	<!-- Card -->
<div class="card">
<div class="w3-panel w3-white">
  <!-- Card image -->
<table class="table">
<tr>
<Td class="w3-border-0"><b>
User Name</b>
</td>
<Td class="w3-border-0"><b>
User Email</b>
</Td>
<Td class="w3-border-0"><b>
User Password</b>
</td>
<td class="w3-border-0"><b>
Address</b>
</td>
<td class="w3-border-0">
<b>Phone No.</b>
</td>
<td class="w3-border-0">
<b>State</b>
</td>

<td class="w3-border-0">
<b>City</b>
</td>
<td class="w3-border-0"><b>Zcode</b></td>
<td class="w3-border-0"><b>pan card no.</b></td>
</tr>
<%
l1.conOpen();

l1.rs=l1.stmt.executeQuery("select distinct tblproduct.uid,uname,email,upass,addr,phone,state,city,zcode,panno from tbluser,tblproduct where tbluser.uid=tblproduct.uid");
while(l1.rs.next())
{
%>
<tr>
<Td class="w3-border-0">
<% out.println(l1.rs.getString("uname"));%>
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("email"));%>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("upass"));%>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("addr"));%>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("phone"));%>
</td>
<td class="w3-border-0">
	<% out.println(l1.rs.getString("State"));%>
</td>

<td class="w3-border-0">

<%out.println(l1.rs.getString("city"));%>

</td>
<td class="w3-border-0">

<%out.println(l1.rs.getString("zcode"));%>

</td>
<td class="w3-border-0">

<%out.println(l1.rs.getString("panno"));%>

</td>
<td class="w3-border-0">
<a href="test.jsp?bid=<%out.println(l1.rs.getString("uid"));%>" class="w3-input w3-border w3-hover-blue"><font color=red>SHOW PRODUCT</font></a>
</td>

<td class="w3-border-0">
<a href="deleteproduct.jsp?sid=<%out.println(l1.rs.getString("uid"));%>" class="w3-input w3-border w3-hover-blue"><font color=red>REMOVE</font></a>

</td>
<td class="w3-border-0">
<a href="updateuser.jsp?bid=<%out.println(l1.rs.getString("uid"));%>" class="w3-input w3-border w3-hover-blue"><font color=red>EDIT</font></a>
</td>
</tr>
<%

}

l1.conClose();
%>
</table>
</div>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file='footer.jsp'%>
</body>
</html>
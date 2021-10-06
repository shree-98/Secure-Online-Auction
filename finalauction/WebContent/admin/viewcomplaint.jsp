<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ page import="java.util.Date" %>
      <!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<title>Complaints</title>
<link href="css/style11.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src='js/script.js'></script>
<%@include file='head.jsp'%>
</head>
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;"> 

<%@include file='header.jsp'%>
<br><br><br>
<%// <div style="background-image: url('images/22.jpg');">%>



<h2 class="card-header info-color white-text text-center py-4">
    <strong>Complaints</strong></h2>
<br><br>
<div class="row">
	<div class="col-md-12">
	<!-- Card -->
<div class="card">
<div class="jumbotron">
  <!-- Card image -->
<table class="table">
<tr>
<td>
Complaint Date
</td>
<Td> 
Complainants Name
</Td>
<Td>
Complainants Email
</td>
<td>
The complaint is Regarding
</td>
<td>
Product no. againsed which complaint is filled
</td>
<td>
The specific details of complaints
</td>

</tr>
<%
l1.conOpen();

String uid=session.getAttribute("uid")+"";
l1.conOpen();
String pattern = "yyyy-MM-dd";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

String date = simpleDateFormat.format(new Date());


l1.rs=l1.stmt.executeQuery("select * from tblcomplaint");
while(l1.rs.next())
{
%>
<tr>
<Td>
<% out.println(l1.rs.getString("fdate"));%>
</Td>
<Td>
	<% out.println(l1.rs.getString("fname"));%>
</td>
<Td>
	<% out.println(l1.rs.getString("femail"));%>
</td>
<Td>
	<% out.println(l1.rs.getString("fdesc"));%>
</td>
<Td>
	<% out.println(l1.rs.getString("prno"));%>
</td>
<td>
	<% out.println(l1.rs.getString("pdesc"));%>
</td>
<td>
<a href="deleteproduct.jsp?fid=<%out.println(l1.rs.getString("fno"));%>"><font color="blue">REMOVE</font></a>
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
</div>
<br><br><br><br><br><br><br><br><br><br><br>
<%@include file='footer.jsp'%>
</body>
</html>
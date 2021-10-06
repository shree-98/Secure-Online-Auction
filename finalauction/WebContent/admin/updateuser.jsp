<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import='java.sql.*' %>
    <%@include file="head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image: url('images/my7.jpg'); no-repeat; background-size:cover; opacity:;">
    <%@include file="header.jsp" %>
    <br><br><br>
<div class="row">
<%
l1.conOpen();
String bid=request.getParameter("bid");
out.println(bid);
String btn=request.getParameter("btnsave");
if(btn!=null)
{
try
{
String name=request.getParameter("txtname");
String email=request.getParameter("txtemail");
String pass=request.getParameter("txtpass");
String addr=request.getParameter("txtaddr");
String phone=request.getParameter("txtphone");
String state=request.getParameter("txtstate");
String city=request.getParameter("txtcity");
String zcode=request.getParameter("txtzcode");
String panno=request.getParameter("txtpanno");


if(l1.dml("update tbluser set uname='"+name+"',email='"+email+"',upass='"+pass+"',addr='"+addr+"',phone='"+phone+"',country='"+state+"',state='"+city+"',zcode='"+zcode+"',panno='"+panno+"' where uid="+bid))
{
	out.println("success");	
	response.sendRedirect("showuser.jsp");
}else{out.println("error");}
}
catch(Exception ex)
{
	
}
}
try
{

String id=request.getParameter("id");
l1.rs=l1.stmt.executeQuery("select * from tbluser where uid='"+bid+"'");
while(l1.rs.next())
{
%>

<h2 class="card-header info-color white-text text-center py-4">
    <strong><font color="white">Update Users</font></strong></h2>

	<div class="container-fluid" style="width:500px; margin-top:50px;">

	<div class="col-md-12">
	<!-- Card -->
<div class="card">
<div class="jumbotron">


<form method="post">
<table class="table">
<tr>
<td>
<b>Name</b>
</td>
<td>
 <input type="text" name="txtname" value="<%out.println(l1.rs.getString("uname"));%>">
</td>
</tr>
<tr>
<td>
<b>Email</b>
</td>
<td>
<input type="text" name="txtemail" value="<%out.println(l1.rs.getString("email"));%>">
</td>
</tr>
<tr>
<td>
<b>Password</b>
</td>
<td>
<input type="password" name="txtpass" value="<%out.println(l1.rs.getString("upass"));%>">
</td>
</tr>
<tr>
<td>
<b>Address</b>
</td>
<td>
<textarea name="txtaddr"><%out.println(l1.rs.getString("addr"));%></textarea>
</td>
</tr>
<tr>
<td>
<b>Phone</b>
</td>
<td>
<input type="text" name="txtphone" value="<%out.println(l1.rs.getString("phone"));%>">
</td>
</tr>
<tr>
<td>
<b>State</b>
</td>
<td>
<select id="bt" name="txtstate">
			<option value="">Select State</option>
         <option value = "1">Maharashtra</option>
             <option value = "2">Tamil Nadu</option>
             <option value = "3">Kerala</option>
             <option value = "4">Karnataka</option>
             <option value = "5">punjab</option>
             <option value = "6">Jammu And Kashmir</option>
             <option value = "7">Rajasthan</option>
             <option value = "8">Utter Pradesh</option>
             <option value = "9">Bihar</option>
             <option value = "10">Gujrat</option>
             <option value = "11">Telangana</option>
             <option value = "12">West Bangal</option>
             <option value = "13">Odisha</option>
             <option value = "14">Goa</option>
             <option value = "15"></option>
 
</td>
</tr>
<tr><td><b>City</b></td>
<td>
<select id="bt" name="txtcity">
			<option value="">Select City</option>
              <option value = "1">Nashik</option>
               <option value = "2">Mumbai</option>
               <option value = "3">Chennai</option>
               <option value = "4">Jaypur</option>
               <option value = "5">Pune</option>
               <option value = "6">Kolkata</option>
               <option value = "7">Hydrabad</option>
              <option value = "8">Lucknow</option>
             <option value = "9">New Delhi</option>
             <option value = "10">Chandigarh</option>
             <option value = "11">Bhopal</option>
             <option value = "12">Nagpur</option>
             <option value = "13">Aurangabad</option>
             <option value = "14">Shimla</option> 
                 </select>
</td></tr>
<tr>
<td><b>
zcode</b>
</td>
<td>
<input type="text" name="txtzcode" value="<%out.println(l1.rs.getString("zcode"));%>">
</td>
</tr>
<tr>
<td>
<b>Pan Card No.</b>
</td>
<td>
<input type="text" name="txtpanno" value="<%out.println(l1.rs.getString("panno"));%>">
</td>
</tr>

<tr>
<td colspan=2 align=center>
<input type="submit" name="btnsave" value="Update"  class="btn btn-primary"></td></tr>


</table>
</form>
</div>
</div>
</div>
</div>
</div>
<%
}
l1.conClose();
}
catch(Exception ex)
{
	
}
%>

</body>
</html>
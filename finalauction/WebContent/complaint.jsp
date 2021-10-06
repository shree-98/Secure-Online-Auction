<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Complaint Filling Form</title>
</head>
  <body style="background-image: url('images/poster.jpg'); no-repeat; background-size:cover; opacity:;">
  
<% //<div style="background-image: url('images/last.jpg');">%>

<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>

<div class="row">
<% 
String btn1=request.getParameter("btnsave");


if(btn1!=null)
{
	String date=request.getParameter("txtdate");
String name=request.getParameter("txtname");
String email=request.getParameter("txtemail");
String desc=request.getParameter("txtdesc");
String prno=request.getParameter("txtprno");
String cdesc=request.getParameter("txtcdesc");
String uid=session.getAttribute("uid")+"";


if(l1.dml("insert into tblcomplaint(fdate,fname,femail,fdesc,prno,pdesc,uid)values('"+date+"','"+name+"','"+email+"','"+desc+"','"+prno+"','"+cdesc+"','"+uid+"')"))
{
	%>
	<script>
	alert("Your complaint is send");
	</script>
	<%
	l1.dml("update tblproduct set count=count+1 where pno="+prno);
	
	
}
else
{
	
	%>
	<script>
	alert("Error");
	</script>
	<%
}

}

%>  

	<div class="container-fluid" style="width: 800px; margin-top: 50px;">

<div class="col-md-12">
	<!-- Card -->
<div class="card">

	  <h2><center>
    <strong>We Are Here To Assist You</strong></center>
  </h2><h3><center>please complete the form below for your complaints</center></h3>
<br>

				<div class="w3-panel w3-card-4 w3-grey">
   
<form method="post">

<table class="table">
<tr><td colspan=2 class="w3-border-0">
<b>Date of filling the form:</b>
</td><td class="w3-border-0"><b>Complainants Name:</b></td></tr>
<tr><td colspan=2 class="w3-border-0"><input type="date" name="txtdate"  placeholder="Enter Date yyyy-mm-dd">
</td>
<td class="w3-border-0">
<input type="text" name="txtname"  placeholder="Enter-your-Name"></td></tr>
<tr><td colspan=2 class="w3-border-0">
<b>Enter Email:</b></td><td class="w3-border-0"><b>product number:</b>
</td></tr>
<tr><td colspan=2 class="w3-border-0"><input type="text" name="txtemail"  placeholder="Enter-your-Email"></td>

<td class="w3-border-0"><input type="text" name="txtprno" placeholder="Enter-Product-No."></td></tr>
<tr><td colspan=2 class="w3-border-0">
<b>The complaint is Regarding:</b></td><td class="w3-border-0">
<textarea name="txtdesc" ></textarea>
</td></tr>
<tr><td rowspan=2 colspan=2 class="w3-border-0">
<b>The specific details of the complaint:</b></td><td class="w3-border-0">
<textarea name="txtcdesc" ></textarea></td></tr>
<tr><td class="w3-border-0">
<input type="submit" name="btnsave" class="btn btn-primary" value="Send">
</td></tr>
</table>
</form>
</div>
</div>
</div>
</div>
</div>
<br><br>
<%@include file="footer.jsp" %>
</body>

</html>

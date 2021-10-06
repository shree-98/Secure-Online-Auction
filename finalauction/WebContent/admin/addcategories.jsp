
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file='head.jsp'%>
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/log.css" type="text/css">
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;"> 
    <%@include file='header.jsp'%>
     <%//@include file='menu.jsp'%>     
<br><br><br><br>
     <%

String btn=request.getParameter("btnsave");
if(btn!=null)
{
	String cname=request.getParameter("txtcname");
	if(l1.dml("insert into tblcategory(cname)values('"+cname+"')"))
	{
		%>
		<script> alert("Record Inserted Successfully");</script>
		<% 
	}
	else
	{
		out.println("error");
	}
}

%>

<div class="row">
<div class="container-fluid" style="width:500px; margin-top:50px;">
<div class="col-md-13">
	<!-- Card -->
	<div class="jumbotron">
<div class="card">

  <!-- Card image -->
  
<table class="table">
<tr colspan=2><td class="w3-border-0"><h4><b>Add Category</b></h4></td>
<Td class="w3-border-0"> <input type="text" id="button" name="txtcname">
</td></tr>
<tr>
<td class="w3-border-0"  colspan=2 rowspan=2 align=center>
<input type="submit" name="btnsave" value="Add Category" class="btn btn-primary">
</td>
</tr>
</table>
</div>
</div>
</div>
</div>
</div>



<br><br><br><br><br><br><br>
 <%@include file='footer.jsp'%>
</body>
</html>





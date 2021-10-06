<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Add product form</title>
</head>
<link rel="stylesheet" href="css/log.css" type="text/css">
<body>
<div style="background-image: url('images/last.jpg');">

<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>
<div class="register-form">
<%

String btn=request.getParameter("btnsave");
if(btn!=null)
{
	
	String name=request.getParameter("txtname");
	String pno=request.getParameter("txtpno");
	String pmprice=request.getParameter("txtmprice");
	String stock=request.getParameter("txtstock");
	String date=request.getParameter("txtdate");
	String time=request.getParameter("txttime");
	String desc=request.getParameter("txtdesc");
	String image=request.getParameter("txtfiles");
	String cid=request.getParameter("cmbcategory");
	String uid=session.getAttribute("uid")+"";
	if(l1.dml("insert into tblproduct(pname,pno,pmprice,pstock,pdate,ptime,pdesc,pimage,cid,uid)values('"+name+"','"+pno+"','"+pmprice+"','"+stock+"','"+date+"','"+time+"','"+desc+"','"+image+"','"+cid+"','"+uid+"')"))
	{
		%>
		<script>
		alert("Product added Successfull");
		window.location.href="login.jsp";
		</script>
		<% 
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
	  <h2 class="card-header info-color white-text text-center py-4">
    <strong>Add Your Product</strong>
  </h2>
<form method="post" id="product">
<table width="400px" height="8px"><tr>
<td><font color="white">
choose category</font>
</td>
<td>
<%
String d1=l1.filldropdown("select * from tblcategory", "cmbcategory", "cname", "cid");
out.println(d1+"");
%></td></tr></table>
<br><br>
<input type="text" name="txtname" id="button" placeholder="Enter-product-Name">
<br><br>
<input type="text" name="txtpno" id="button" placeholder="Enter-product-number">
<br><br>
<input type="text" name="txtmprice" id="button" placeholder="Enter-bid-price"><br><br>
<input type="text" name="txtstock" id="button" placeholder="Enter stock" required">
<br><br>
<input type="text" name="txtdate" id="button" placeholder="Enter date: yyyy-mm-dd">
<br><br>
<input type="text" name="txttime" id="button" placeholder="Enter Time: 00:00:00">
<br><br>
<textarea name="txtdesc" id="button" placeholder="Enter-product-Description"></textarea>
<br><br> 
<input type="file" name="txtfile" id="fbtn">
<br><br><br>
<input type="submit" name="btnsave" id="btn" value="Add Product">
</div>
</div>
		</form>
		<br><br>
	
	<%@include file='footer.jsp'%>
</body>
</html>
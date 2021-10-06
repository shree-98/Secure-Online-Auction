<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
   <%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Add product form</title>
</head>
<link rel="stylesheet" href="css/log.css" type="text/css">
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;">

<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>
<div class="register-form">

	  <h2 class="card-header info-color white-text text-center py-4">
    <strong>Add Your Product</strong>
  </h2>
  
  
  
<form method="post" id="product" name="frm1" action="upload.jsp" enctype="multipart/form-data">
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
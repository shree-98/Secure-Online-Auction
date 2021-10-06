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
<body style="background-image: url('images/my1.jpg'); no-repeat; background-size:cover; opacity:;">

<%@include file="header.jsp" %>
<div class="register-form">

	  <h2 class="card-header info-color white-text text-center py-4">
    <strong>Add Your Product</strong>
  </h2>
  
  
  
<form method="post" id="product" name="frm1" action="edit.jsp?id=<%=request.getParameter("id")%>" enctype="multipart/form-data">
<table width="400px" height="8px"><tr>
<td><font color="white">
choose category</font>
</td>
<td>
<%
String d1=l1.filldropdown("select * from tblcategory", "cmbcategory", "cname", "cid");
out.println(d1+"");

%>
</td></tr>
</table>
<%
l1.conOpen();

try
{

	String id=request.getParameter("pid");
	out.println(id);
	l1.rs=l1.stmt.executeQuery("select * from tblproduct where pid="+id);
	if(l1.rs.next())
	{
		out.println("hii");
%>
<br><br>
<input type="text" name="txtname" id="button" value="<%out.println(l1.rs.getString("pname"));%>">
<br><br>
<input type="text" name="txtpno" id="button" value="<%out.println(l1.rs.getString("pno"));%>">
<br><br>
<input type="text" name="txtmprice" id="button" value="<%out.println(l1.rs.getString("pmprice"));%>"><br><br>
<input type="text" name="txtstock" id="button" value="<%out.println(l1.rs.getString("pstock"));%>" required">
<br><br>
<input type="text" name="txtdate" id="button" value="<%out.println(l1.rs.getString("pdate"));%>">
<br><br>
<input type="text" name="txttime" id="button" value="<%out.println(l1.rs.getString("ptime"));%>">
<br><br>
<textarea name="txtdesc" id="button"><%out.println(l1.rs.getString("pdesc"));%></textarea>
<br><br> 
<input type="file" name="txtfile" id="fbtn">
<br><br><br>
<input type="submit" name="btnsave" id="btn" value="Update Product">
<%
	}
}catch(Exception e){}
%>
</div>
</div>
		</form>
		<br><br>
	
	<%@include file='footer.jsp'%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet" href="css/log.css" type="text/css"> 
<%@include file='head.jsp'%>
</head>
<body>
<div style="background-image: url('images/buy.jpeg'); background-size: 100%;">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>

<div class="simple-form">
<%
String btn=request.getParameter("btnlogin");

if(btn!=null)
{
	
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	if(l1.exists("select * from tbluser where email='"+email+"' and upass='"+pass+"'"))
	{
			String name=l1.filllabel("select * from tbluser where email='"+email+"'", "uname");
			String uid=l1.filllabel("select * from tbluser where email='"+email+"'", "uid");
			
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("uid", uid);
			
			response.sendRedirect("test.jsp");
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
<h2>
    <strong>Sign in</strong>
  </h2>
<br>   

<form method="post" id="loggin">
<input type="email" name="txtemail" patten="^[a-z]+[0-9]*@[a-z]+[0-9]*\.[a-z]{2,3}$" placeholder="Email" id="button" required">
<br>
<br>
<input type="password" name="txtpass" placeholder="Password"  id="button" required">
<br>
<br>
<input type="checkbox" class="form-check-input" id="materialLoginFormRemember"><font color="white"> remember me</font>
<br><br>           
<input type="submit" name="btnlogin" id="btn" value="Login">
<br>
<br><p><font color="white">Not a member?</font>
        <a href="register.jsp">Register</a>
      </p>

</form>
</div>
</div>
<%@include file='footer.jsp'%>
</div>
</body>
</html>
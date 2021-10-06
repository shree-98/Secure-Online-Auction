<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%
int a=Integer.parseInt(request.getParameter("id"));
String email=l1.filllabel("select * from tbluser where uid="+a, "email");
out.println(email);
l1.sendmail(email, "Congratulations you won the auction", "to buy product click on below link http://localhost:8080/finalauction/login.jsp");

%>

</body>
</html>



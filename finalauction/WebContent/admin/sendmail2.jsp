<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="head.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%
int a=Integer.parseInt(request.getParameter("id"));
String email=l1.filllabel("select * from tbluser where uid="+a, "email");

int b=Integer.parseInt(request.getParameter("id2"));

l1.sendmail(email, "Congratulations You Won The Auction", "To Buy Product Click On Below Link http://localhost:8080/finalauction/login.jsp");
l1.dml("update tblproduct set status=1 where pid="+b);
response.sendRedirect("maxuser.jsp");

%>

</body>
</html>


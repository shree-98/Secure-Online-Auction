<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file='head.jsp'%>

</head>
<body>
 <div style="background-image: url('images/poster3.jpg');">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>
  <h2 class="card-header info-color white-text text-center py-4">
    <strong>My Products</strong>
  </h2>

<div id="getdata">
</div>

<script type="text/javascript">


function btnstart()
{
	var b=<%out.println(session.getAttribute("uid"));%>;
	var xmlhttp=new XMLHttpRequest();
	xmlhttp.open("GET","showsellproduct.jsp?id="+b,false);
	xmlhttp.send(null);
	document.getElementById("getdata").innerHTML=xmlhttp.responseText;
}

btnstart();

setInterval(btnstart,1000);

</script>
</div>
</body>
</html>

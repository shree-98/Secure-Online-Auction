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
<%@include file='header.jsp'%>



<div id="getdata">
</div>

<script type="text/javascript">
//var baseUrl = (window.location).href;

//var Id = baseUrl.substring(baseUrl.lastIndexOf('=') + 1);


function btnstart()
{
	//if(console.log(baseUrl.includes("Id")))
	//if(Id!=null)
	if(<%out.println(request.getParameter("bid"));%>!=null)
	{
		var xmlhttp=new XMLHttpRequest();
		xmlhttp.open("GET","dumy.jsp?q="+<%out.println(request.getParameter("bid"));%>,false);
		xmlhttp.send(null);
		document.getElementById("getdata").innerHTML=xmlhttp.responseText;
	}
	else
	{
		
		var xmlhttp=new XMLHttpRequest();
		xmlhttp.open("GET","dumy.jsp",false);
		xmlhttp.send(null);
		document.getElementById("getdata").innerHTML=xmlhttp.responseText;
	}

}
btnstart();

setInterval(btnstart,1000);

</script>
<%@include file='footer.jsp'%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file='head.jsp'%>

</head>
<body style="background-image: url('images/poste3.jpg'); no-repeat; background-size:cover; opacity:;">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>


<div id="getdata">
</div>

<script type="text/javascript">
var baseUrl = (window.location).href;

var Id = baseUrl.substring(baseUrl.lastIndexOf('=') + 1);


function btnstart()
{
	//alert(Id);
	//if(console.log(baseUrl.includes("Id")))
	//if(Id!=null)
	if(baseUrl!=Id)
	{
		var xmlhttp=new XMLHttpRequest();
		xmlhttp.open("GET","showonly.jsp?q="+Id,false);
		xmlhttp.send(null);
		document.getElementById("getdata").innerHTML=xmlhttp.responseText;
	}
	else
	{
		
		var xmlhttp=new XMLHttpRequest();
		xmlhttp.open("GET","showonly.jsp",false);
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

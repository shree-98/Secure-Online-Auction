<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 <%@include file="head.jsp" %>
<%@include file="../mylib2.jsp" %>

<%
mylib2 l2=new mylib2(); 
%>
<%@include file="header.jsp" %>
<br><br><br><br>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
try
{
l1.conOpen();
l1.rs=l1.stmt.executeQuery("select distinct cid from tblproduct order by cid");
int a,b;
while(l1.rs.next())
{
 		
	 a=l1.rs.getInt("cid");
	
b=l2.countlabel("select count(*) as abc from tblproduct where cid="+a,"abc");

String pname=l2.filllabel("select cname from tblcategory where cid="+a, "cname");

map = new HashMap<Object,Object>(); map.put("label", pname+""); map.put("y", b); list.add(map);

 }
l1.conClose();
}
catch(Exception ex)
{
	
} 
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "Top Product Categories"
	},
	axisX: {
		title: "Category Name"
	},
	axisY: {
		title: "Total No of Products of category"
	},
	data: [{
		type: "line",
		yValueFormatString: "#,##0 products",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
 <br><br><br><br><br><br>
 <%@include file="footer.jsp" %>
</body>
</html>       
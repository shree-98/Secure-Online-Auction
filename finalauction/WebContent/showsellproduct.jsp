<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.SimpleDateFormat" %>    
<%@ page import="java.util.Date" %>
 <%@include file='mylib.jsp'%>
<%
mylib l1=new mylib();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seller Products</title>
<%@include file='head.jsp'%>
</head>
<script type="text/javascript" src='js/script.js'></script>
<link rel="stylesheet" href="css/log.css" type="text/css">

<body>

<%//@include file='menu.jsp'%>


<div class="row">
	
<%
l1.conOpen();
String uid=session.getAttribute("uid")+"";
l1.rs=l1.stmt.executeQuery("select * from tblproduct where uid="+uid);
while(l1.rs.next())
{
%>
<div class="col-md-4">
	<!-- Card -->
<div class="card">
<div class="w3-panel w3-card-4 w3-white">
  <!-- Card image -->
<table class="table">


<Tr>

<Td colspan=2>
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=200px>
</td>
</tr>
<tr>
<td class="w3-border-0">
product Name
</td>
<Td class="w3-border-0">
	<h3><% out.println(l1.rs.getString("pname"));%></h3>
</Td></tr>
<tr>
<Td class="w3-border-0">
product Minimum price
</td>
<td class="w3-border-0">
	₹<% out.println(l1.rs.getString("pmprice"));%>
</td></tr>
<tr>
<td class="w3-border-0">
Quantity Available
</Td><td class="w3-border-0">
	<% out.println(l1.rs.getString("pstock"));%>
</td></tr>
<tr>
<td class="w3-border-0">
Product ends in
</td>

<td class="w3-border-0">
<font color="white">
<%
//response.setIntHeader("Refresh", 60);
String b1=l1.rs.getString("pdate");
String[] b=b1.split("-");
String m=b[1];
String d=b[2];
String y=b[0];

String a1=l1.rs.getString("ptime");
String[] a=a1.split(":");

String hours=a[0]; 
String minutes =a[1];
String seconds =a[2];


String z1=""+y+"-"+m+"-"+d+" "+hours+":"+minutes+":"+seconds+"";
//out.println(z1);
Date date1=new Date();
date1.getDate();
SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String x1=format2.format(date1);
//out.println(x1);
Date d1=null;
Date d2=null;
try{
d1=format2.parse(x1);
d2=format2.parse(z1);

long diff = d2.getTime() - d1.getTime();
//out.println(diff);
long diffSeconds = diff / 1000 % 60;
long diffMinutes = diff / (60 * 1000) % 60;
long diffHours = diff / (60 * 60 * 1000) % 24;
long diffDays = diff / (24 * 60 * 60 * 1000);
//out.print(diffDays + " days, ");
//out.print(diffHours + " hours, ");
//out.print(diffMinutes + " minutes, ");
//out.print(diffSeconds + " seconds.");



//int num = x1.compareTo(a1);

//out.println(x1);
//if(num > 0)
//{
	//out.println("current time is after database");
	//}else{
		//out.println("current value is before database");
		//}



String clock =diffHours+":"+diffMinutes+":"+diffSeconds;

%>
</font>
<div align='center' ></div>
<div class='content' align='center'>


    <div class="top" align='center'>

  
  <div class="top_con" align='center' id='hmm'>
    <ul class="top_con_ul_pos1" align='center'>
    <li><% out.println(diffDays);%>Days, <% out.println(diffHours);%> : <% out.println(diffMinutes);%> : <% out.println(diffSeconds);%></li>
    
    </ul>

    
  </div>
      	
  </div>
	
    <div style="font-size: 10px;color: #dadada;" id="dumdiv">
<a href="http://www.hscripts.com" id="dum" style="text-decoration:none;color: #dadada;">&copy;H</a></div> 
  </div>
  
<div id='hms' style='display:none;'><% out.println(""+clock+"");%></div>

<script>
 count();
</script>


</td>
</tr>
<tr>
<td class="w3-border-0">
<a href="detailsOfUproduct.jsp?did=<%out.println(l1.rs.getString("pid"));%>" class="w3-button w3-blue">
      <h5>View Details >></h5>
    </a>

</td></tr>
<tr>
<td class="w3-border-0">
<a href="maxuser.jsp?did=<%out.println(l1.rs.getString("pid"));%>" class="w3-button w3-blue">
      <h6>Maximum Bidder >></h6>
</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<%
}catch(Exception e){}
}
l1.conClose();
%>

</div>
<%@include file='footer.jsp'%>
</body>
</html>
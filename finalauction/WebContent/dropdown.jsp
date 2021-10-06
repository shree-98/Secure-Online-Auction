<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.SimpleDateFormat" %>    
<%@ page import="java.util.Date" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link href="css/style11.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src='js/script.js'></script>

<%@include file='head.jsp'%>
</head>
<body>
<%@include file='header.jsp'%>
<%@include file='mymenu.jsp'%>
<%// <div style="background-image: url('images/22.jpg');">%>


<div class="row">
	<div class="col-md-12">
	<!-- Card -->
<div class="card">

  <!-- Card image -->
<table class="table">
<tr>
<Td rowspan=2 colspan=2>
product Image
</td></tr>
<Tr>
<Td>
Product Name
</Td>
<Td>
Product NO.
</td>
<td>
Product Minimum Price
</td>
<td>
Product Date
</td>
<td>
Product Time
</td>
<td>Time remaining for bid</td>
</tr>
<%
l1.conOpen();
String btn1=request.getParameter("btnsearch");
String btn2=request.getParameter("btnsearch1");

if(btn1!=null)
{
	l1.rs=l1.stmt.executeQuery("select * from tblproduct where cid="+request.getParameter("cmbcat"));
	
}
else if(btn2!=null)
{
l1.rs=l1.stmt.executeQuery("select * from tblproduct where pname like '%"+request.getParameter("txtsearch")+"%'");
	
}
else
{
l1.rs=l1.stmt.executeQuery("select * from tblproduct order by pid desc");
}
while(l1.rs.next())
{
%>
<tr>
<Td colspan=2>
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=200px>
</td>
<Td>
<% out.println(l1.rs.getString("pname"));%>
</Td>
<Td>
	<% out.println(l1.rs.getString("pno"));%>
</td>
<Td>
	<% out.println(l1.rs.getString("pmprice"));%>
</td>
<Td>
	<% out.println(l1.rs.getString("pdate"));%>
</td>
<Td>
	<% out.println(l1.rs.getString("ptime"));%>

</Td>
<td>
<%
response.setIntHeader("Refresh", 5);
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

<div align='center' ></div>
<div class='content' align='center'>


    <div class="top" align='center'>

  
  <div class="top_con" align='center'>
    <ul class="top_con_ul_pos1" align='center'>
    <li><% out.println(diffDays); %>Days,<% out.println(diffHours); %>:<% out.println(diffMinutes);%>:<% out.println(diffSeconds);%></li>
    
    </ul>

    
  </div>
      	
  </div>
	
    <div style="font-size: 10px;color: #dadada;" id="dumdiv">
<a href="http://www.hscripts.com" id="dum" style="text-decoration:none;color: #dadada;">&copy;H</a></div> 
  </div>
  
<div id='hms' style='display:none;'><% out.println(""+clock+""); %></div>

<script>
 count();
</script>


</td>



<td>
<a href="showdetails.jsp?id=<%out.println(l1.rs.getString("pid"));%>">View Details</a>
</td>
</tr>
<%
}catch(Exception e){e.printStackTrace();}

}
l1.conClose();
%>
</table>
</div>
</div>
</div>




<%@include file='footer.jsp'%>
</body>
</html>
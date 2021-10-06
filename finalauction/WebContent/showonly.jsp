
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
<title>Products</title>
<%//@include file='head.jsp'%>
</head>
<link rel="stylesheet" href="css/log.css" type="text/css">
<script type="text/javascript" src='js/script.js'></script>
<body style="background-image: url('images/poste2.jpg'); no-repeat; background-size:cover; opacity:;">
 <div style="background-image: url('images/poster3.jpg'); no-repeat; background-size:cover; opacity:;">
<%//@include file='header.jsp'%>
<%//@include file='menu.jsp'%>
<table class="table">
<Tr>
<Td>
<%  //  <a href="test2.jsp?uid=<%out.println(session.getAttribute("uid"));%><% //"><h3><b>My Product</b></h3></a> %>
</Td>
</tr>
</table>
<br>
<div class="row">
<%
l1.conOpen();
String s=request.getParameter("q");
//out.println(s);

//l1.rs=l1.stmt.executeQuery("select * from tblproduct where cid="+s);


String uid=session.getAttribute("uid")+"";

String pattern = "yyyy-MM-dd";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
String date = simpleDateFormat.format(new Date());

String pattern2 = "HH:mm:ss";
SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);
String time = simpleDateFormat2.format(new Date());

if(request.getParameter("q")==null)
{
	l1.rs=l1.stmt.executeQuery("select * from tblproduct where pdate >= '"+date+"' and  status=0 and count< 5 and uid!="+uid);	
}

if(request.getParameter("q")!=null)
{
	l1.rs=l1.stmt.executeQuery("select * from tblproduct where pdate >= '"+date+"'  and status=0 and count< 5 and uid!='"+uid+"' and cid='"+s+"'");
}
while(l1.rs.next())
{
	%>

	<div class="col-md-4">
	<!-- Card -->
		<div class="container" style="width: 400px;">
<div class="card">
 <div class="w3-panel w3-card-4 w3-white">
  <!-- Card image -->
 
<table class="table">
<Tr>

<Td colspan=2>
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=200px>
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<h3><font color="red"><% out.println(l1.rs.getString("pname"));%></font> </h3>
</td>
</tr>
<tr>
<Td class="w3-border-0">
Price
</Td>
<Td class="w3-border-0">
	₹<% out.println(l1.rs.getString("pmprice"));%>
</td>
</tr>
<tr>
<td class="w3-border-0">
Quantity Available 
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pstock"));%>
</td></tr>
<tr>
<td class="w3-border-0">
Auction ends in:
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
    <li><button class="w3-btn w3-red">
    <% out.println(diffDays);%>Days, <% out.println(diffHours);%> : <% out.println(diffMinutes);%> : <% out.println(diffSeconds);%></li>
    </button>
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
    <a href="showdetails.jsp?pid=<%out.println(l1.rs.getString("pid"));%>" class="white-text d-flex justify-content-end">
      <h4><font color="blue">View Details </font></h4>
    </a>

</td>
</tr>
</table>
</div>
</div>
</div>
</div>
<% 
}catch(Exception e){e.printStackTrace();}
}
l1.conClose();
%>
</div>
</div>
<%//@include file='footer.jsp'%>
</body>
</html>

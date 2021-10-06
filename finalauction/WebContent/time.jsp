<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.Month" %>
        <%@ page import="java.text.DateFormatSymbols" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file='head.jsp'%>
</head>
<body>

<%
try{
l1.conOpen();
String uid=session.getAttribute("uid")+"";
l1.rs=l1.stmt.executeQuery("select * from tblproduct");
while(l1.rs.next())
{
String b1=l1.rs.getString("pdate");
String[] b=b1.split("-");
String a1=l1.rs.getString("ptime");
String[] a=a1.split(":");
String m=b[1]; int x=Integer.parseInt(m);
String mstring=new DateFormatSymbols().getMonths()[x-1];
//out.println(mstring);
String d=b[2];
String y=b[0];
String h=a[0]; //change hours
String min =a[1];//change minutes
String s =a[2];//change Seconds
String clock = h+":"+min+":"+s;

%>
<p id="demo"></p>
<script>
var m1=<%=mstring%>;
var d1=<%=d%>;
var y1=<%=y%>;
var min1=<%=min%>;
var s1=<%=s%>;
var h1=<%=h%>;
// Set the date we're counting down to
var countDownDate = new Date(m1,d1,y1,h1,min1,s1).getTime();;

document.getElementById("demo").innerHTML =countDownDate;

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
  
  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);
</script>

<%
}
}
catch(Exception e)
{out.println(""+e); }
%>

</body>
</html>


<p id="demo"></p>
<script>
// Set the date we're counting down to
var countDownDate = new Date('x d1, y1 h1:min1:s1').getTime();;

//document.getElementById("demo").innerHTML =countDownDate;

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















<html>
<head>
<title>JSP Countdown Timer Script</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src='js/script.js'></script>
<body>
<%
String hours = "00"; //change hours
String minutes = "05";//change minutes
String seconds = "50";//change Seconds
String clock = hours+":"+minutes+":"+seconds;
%>
<div align='center' ><h1>JSP Countdown Timer</h1></div>
<div class='content' align='center'>


    <div class="top" align='center'>

  
  <div class="top_con" align='center'>
    <ul class="top_con_ul_pos1" align='center'>
    <li><span id="hrs"><% out.println(hours); %></span>:<span id="mts"><% out.println(minutes); %></span>:<span id="sec"><% out.println(seconds); %></span></li>
    
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
</body></html>


<%
/*<p id="demo"></p>
<script>
// Set the date we're counting down to
var countDownDate = new Date("Apr 10, 2020 20:00:00").getTime();

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

</td>*/
%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file='head.jsp'%>
</head>
<body>
<%@include file='header.jsp'%>




<div class="row">
<%

l1.conOpen();
l1.rs=l1.stmt.executeQuery("select * from tbluser");
	%>
	
	
	<h2 class="card-header info-color white-text text-center py-4">
    <strong>Manage User</strong>
  </h2>
	<div class="container-fluid" style="width:500px; margin-top:50px;">
	<div class="row">
	<div class="col-md-6">
	<!-- Card -->
<div class="card">

  <!-- Card image -->
 <table   border=3px>
	<Tr>
<Td>
User Name
</Td>
<Td>
Email
</Td>
<td>
Password
</td>
<Td>
Address
</Td>
<Td>
Mobile No
</Td>
<Td>
Country
</Td>
<Td>
State
</Td>
<Td>
Zip code
</Td>
</Tr>

<% 

while(l1.rs.next())
{
%>
	<tr>
	<Td>
	<% out.println(l1.rs.getString("uname"));%>
	</td>
	
<Td>
	<% out.println(l1.rs.getString("email"));%>
	</td>
	
<Td>
	<% out.println(l1.rs.getString("upass"));%>
	</td>
	
	<Td>
	<% out.println(l1.rs.getString("addr"));%>
	</td>
	
	<Td>
	<% out.println(l1.rs.getString("phone"));%>
	</td>
	
	<Td>
	<% out.println(l1.rs.getString("country"));%>
	</td>
	
	<Td>
	<% out.println(l1.rs.getString("state"));%>
	</td>
	
	<Td>
	<% out.println(l1.rs.getString("zcode"));%>
	</td>
	
	</tr>
	<% 
}
%>


	</table>
  </div>
  </div>
  </div>


<!-- Card -->
	
	</div>
	
</div>


</body>
</html>
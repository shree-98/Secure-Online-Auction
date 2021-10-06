
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file='head.jsp'%>
</head>
<link rel="stylesheet" href="css/log.css" type="text/css">
<body>
<div style="background-image: url('images/my1.jpg');">

<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>
<div class="register-form">
<%
String btn=request.getParameter("btnreg");

if(btn!=null)
{
	String name=request.getParameter("txtname");
	String email=request.getParameter("txtemail");
	String pass=request.getParameter("txtpass");
	String addr=request.getParameter("txtaddr");
	String phone=request.getParameter("txtphone");
	String state=request.getParameter("txtstate");
	String city=request.getParameter("txtcity");
	String zcode=request.getParameter("txtzcode");
	String panno=request.getParameter("txtpan");
	//out.println(state);
	if(l1.dml("insert into tbluser(uname,email,upass,addr,phone,state,city,zcode,panno)values('"+name+"','"+email+"','"+pass+"','"+addr+"','"+phone+"','"+state+"','"+city+"','"+zcode+"','"+panno+"')"))
	{
		
	

		%>
		<script>
		alert("Registeration Successfull");
		window.location.href="login.jsp";
		</script>
		<% 
		l1.sendmail(email, "Welcome to A&SBid", "Thanking you for connecting with us");
	}
	else
	{
		%>
		<script>
		alert("Error");
		</script>
		<% 
	}
}
%>
<h2><strong><font color=:white">Register For Your eBid Account</font></strong> </h2>
  <form method="post" id="registration">
<input type="text" name="txtname" id="button" placeholder="Enter-Name" pattern="^[a-zA-Z ]+" required>
<br><br>
<input type="email" name="txtemail" id="button" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Enter email" required>
<br><br>							
<input type="password" name="txtpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}" id="button" placeholder="Enter-password" required>
<br><br>
<textarea  name="txtaddr" id="button" placeholder="Enter-Address" required></textarea>
<br><br>
<input type="text" name="txtphone" id="button" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" placeholder="Enter-Mobile-no" >
<br><br>
<select id="bt" name="txtstate" required>
			<option value="">Select State</option>
             <option>Maharashtra</option>
             <option>Tamil Nadu</option>
             <option>Kerala</option>
             <option>Karnataka</option>
             <option>punjab</option>
             <option>Jammu And Kashmir</option>
             <option>Rajasthan</option>
             <option>Utter Pradesh</option>
             <option>Bihar</option>
             <option>Gujrat</option>
             <option>Telangana</option>
             <option>West Bangal</option>
             <option>Odisha</option>
             <option>Goa</option>
             <option>Kanyakumari</option>
             </select>
<br><br>
<select  id="bt" name="txtcity" required>
				<option value="">Select city</option>
               <option>Nashik</option>
               <option>Mumbai</option>
               <option>Chennai</option>
               <option>Jaypur</option>
               <option>Pune</option>
               <option>Kolkata</option>
               <option>Hydrabad</option>
              <option>Lucknow</option>
             <option>New Delhi</option>
             <option>Chandigarh</option>
             <option>Bhopal</option>
             <option>Nagpur</option>
             <option>Aurangabad</option>
             <option>Shimla</option> 
             </select>
<br><br>
<input type="text" name="txtzcode" id="button" pattern="[0-9]{6}|[0-9]{3}\s[0-9]{3})" placeholder="Enter-pin-Code" >
<br><br>
<input type="text" name="txtpan" id="button" pattern="^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$"placeholder="Enter-your-Pan-Card_NO." >
<br><br>
<input type="submit"  name="btnreg" id="btn" value="Register">
					
				</div>
	</div>	</form>
	<%@include file='footer.jsp'%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
</head>
<body>
<div style="background-image: url('images/buy.jpeg'); background-size: 100%;">
	<%@include file="header.jsp"%>
		<%@include file="menu.jsp"%>
	<%
	
	String btn=request.getParameter("btnlogin");

	if(btn!=null)
	{
		
		String pass=request.getParameter("txtpass");
		String email=request.getParameter("txtemail");
		if(l1.exists("select * from tbluser where email='"+email+"' and upass='"+pass+"'"))
		{
				String name=l1.filllabel("select * from tbluser where email='"+email+"'", "uname");
				String uid=l1.filllabel("select * from tbluser where email='"+email+"'", "uid");
				
				session.setAttribute("email", email);
				session.setAttribute("name", name);
				session.setAttribute("uid", uid);
				
				response.sendRedirect("test.jsp");
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
	
	<div class="container" style="width: 400px; margin-top:60px;">
		
		
		<div class="card">
		
<div class="w3-panel w3-card-4 w3-dark-grey">
			<img class="img-thumbnail" src="images/logback.jpg"  />
  			<center><h1><b>SIGN IN</b></h1></center>

			<div class="card bg-light text-dark">
				<form class="form-group text-center" style="color: #757575;"
					method="post">


					<table class="table">

						<tr>
							<td class="w3-border-0"><h4><b><div class="w3-text-sand">Email:</div></b></h4></td>
							<td class="w3-border-0"><input type="text" class="w3-input w3-border w3-hover-blue" name="txtemail"
								  placeholder="Enter-Email"required"></td>
						</tr>

						<tr>
							<td class="w3-border-0"><h4><b><div class="w3-text-sand">Password:</div><b></h4></td>
							<td class="w3-border-0"><input type="password"  class="w3-input w3-border w3-hover-red" 
								name="txtpass" placeholder="Enter-password"required"></td>
						</tr>


						<td colspan=3 align=center class="w3-border-0"><input type="submit" 
							class="w3-button w3-black w3-round-large" name="btnlogin" value="LOGIN">
						</tr>
					</table>
				</form>
</div>
			</div>
		</div>
	</div>
	</div>
	

	<%@include file='footer.jsp'%>
</body>
</html>

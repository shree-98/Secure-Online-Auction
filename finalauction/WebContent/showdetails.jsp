<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show Products</title>
<%@include file='head.jsp'%>
</head>
<body style="background-image: url('images/my7.jpg'); no-repeat; background-size:cover; opacity:;">
<div style="background-image: url('images/my7.jpg');">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>
<br><br>
<div class="row">

<%
try
{
l1.conOpen();
String btn=request.getParameter("btnsave");
String pid=request.getParameter("pid");


if(btn!=null)
{
	String uid=session.getAttribute("uid")+"";
	String cmb=request.getParameter("txtubid");
	l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+pid);
	if(l1.rs.next())
	{
	 	String quantity=request.getParameter("txtqty");
	 	int c=Integer.parseInt(cmb);
		int b=Integer.parseInt(l1.rs.getString("abc"));

		if(c > b)
		{
			//String i=Integer.toString(c);
				//l1.dml("update tblproduct set pstock='"+calc+"' where pid="+pid);	

				if(l1.dml("insert into tblcart1(pid,qty,uid,status)values('"+pid+"','"+cmb+"','"+uid+"',0)"))
				{
					%>
					<script>
					alert("Amount Added Successfully");
					window.location.href="showdetails,jsp?pid=";
					</script>
					<% 

				}
				else if(session.getAttribute("uid")==null)
				{
					%>
					<script>
					alert("YOU NEED TO LOGIN FIRST");
					window.location.href="login.jsp";
					</script>
					<%
				}
				else
				{
					%>
					<script>
					alert("ERROR");
					</script>
					<%
				}
				
			
		}
		else
		{
		%>  	
	 		<script>
			alert("INVALID BID AMOUNT");
			</script>   
		<%
			   
		}
	}
}
l1.rs=l1.stmt.executeQuery("select * from tblproduct where pid="+pid);
if(l1.rs.next())
{
	%>
	<div class="col-md-1"></div>
	<div class="col-md-10">
<div class="card">
	<div class="w3-container w3-white w3-cell">
	
	
	<!-- Card -->


  <!-- Card image -->
  
  <form method="post">
<div class="w3-container w3-center w3-animate-zoom">
 <div class="item g1">
						
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=400px width=600px>
<div class="agile-dish-caption">
								<h4>Bid To Buy Me</h4>
								
							</div>
</div>
</div>
</div>
<div class="w3-container w3-white w3-cell">

<table class="table">
<tr>
<Td class="w3-border-0">
<h2><font color="red"><% out.println(l1.rs.getString("pname"));%></font></h2>	
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<b>Product No.:</b>
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pno"));%>
</td>
</tr>
<Tr>
<Td class="w3-border-0">
<b>Product Minimum Bid Amount:</b>
</Td>
<Td class="w3-border-0">
	₹<% out.println(l1.rs.getString("pmprice"));%>
</td>
</tr>

<tr>
<Td class="w3-border-0">
<b>Ending Date:</b> 
</Td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pdate"));%>
</td>
</tr>
<Tr>
<td class="w3-border-0">
<b>Ending Time:</b>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("ptime"));%>
</td>
</Tr>
<Tr>
<td class="w3-border-0">
<b>Product Description:</b>
</td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("pdesc"));%>
</td>
</Tr>

<Tr>
<td class="w3-border-0">
<b>current maximum price:</b>
</td>
<td class="w3-border-0">
	<h3><b>₹<% l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+pid);
		if(l1.rs.next())
		{
		out.println(l1.rs.getString("abc"));
		}
		
	%>
	</b></h3>
</td>
</Tr>
<tr>
<td class="w3-border-0">
<b>Enter Your Bid Amount:</b>
</td>
<td class="w3-border-0">
<input type="number" name="txtubid" class="w3-input w3-border w3-hover-blue" placeholder="Enter-your-bid-amount" required">
</td>
</tr>
<tr>
<td colspan=2 align=center class="w3-border-0">
<input type="submit" name="btnsave" value="Add Amount"  class="btn btn-primary" width=1000px height=800px>
</td></tr>
<tr>
<td class="w3-border-0">
<%//<a href="viewcart.jsp?cartid=<%out.println(request.getParameter("pid"));%> <% //">ViewCart</a> %>
</td></tr>
</table>
</form>
</div>
</div>
</div>
<% 
}
l1.conClose();
}
catch(Exception e)
{}
%>
</div>
</div>
<br><br>
<% //response.sendRedirect("viewcart.jsp"); %>
<%@include file='footer.jsp'%>
</body>
</html>





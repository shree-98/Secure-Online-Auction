<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDeals</title>
<%@include file='head.jsp'%>
</head>
<body>
<div style="background-image: url('images/poster3.jpg'); background-size: 100%;">
<%@include file='header.jsp'%>
<%@include file='menu.jsp'%>
  <h2 class="card-header info-color white-text text-center py-4">
    <strong>My Deals</strong>
  </h2>
<div class="row">
<div class="container-fluid" style="width:500px; margin-top:50px;">
<div class="col-md-12">
	<!-- Card -->

<div class="card">
<div class="w3-panel w3-card-4 w3-blue-grey">
  <!-- Card image -->
  <%
//  String uid=session.getAttribute("uid")+"";
 // if(l1.exists("select * from tblcart1 where uid!="+uid))
	//  {
	  //out.println("<center><h1>Cart is Empty</h1></center>");
	  //}
  //else
  //{
	  %>
<table class="table">
<%

l1.conOpen();
String uid=session.getAttribute("uid")+"";

l1.rs=l1.stmt.executeQuery("select * from tblcart1 where uid="+uid);
while(l1.rs.next())
{
	
   	String currpid=l1.rs.getString("pid");
   	
    l1.rs=l1.stmt.executeQuery("select Max(qty) as abc from tblcart1 where pid="+currpid);
    while(l1.rs.next())
    {
    	
    	
    	String currqty=l1.rs.getString("abc");
    	l1.rs=l1.stmt.executeQuery("select uid from tblcart1 where qty="+currqty);
    	while(l1.rs.next())
    	{
    		
    		int cuid=Integer.parseInt(uid);
    		String curruid=l1.rs.getString("uid");
    		int ccuid=Integer.parseInt(curruid);
    		if(cuid==ccuid)
    		{
    		
    			l1.rs=l1.stmt.executeQuery("select * from tblproduct,tblcart1,tbluser where tblproduct.pid=tblcart1.pid and tbluser.uid=tblcart1.uid and tblproduct.pid='"+currpid+"' and tblcart1.qty="+currqty);
    			
				while(l1.rs.next())
				{
		%>
		
 <tr>
<Td colspan=2>
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=200px>
</td>
</tr>
		
<tr>
<Td class="w3-border-0">
	<h2><b><font color="red"><% out.println(l1.rs.getString("pname"));%></font></b></h2>
</td></tr>
<tr>
<td class="w3-border-0"><b>Product Minimum Price:</b></td>
<Td class="w3-border-0">
	₹<% out.println(l1.rs.getString("pmprice"));%>
</td class="w3-border-0">
</tr>
<tr>
<td class="w3-border-0"><b>Your Bid Amount:</b></td>
<Td class="w3-border-0">
	₹<% out.println(l1.rs.getString("qty"));%>

</Td>
</tr>
<tr>
<td class="w3-border-0"><b>Buyer Name:</b></td>
<Td class="w3-border-0">
	<% out.println(l1.rs.getString("uname"));%>

</Td>
</Tr>

<tr><td  align=center class="w3-border-0">

	<a href="pay.jsp" class="w3-button w3-blue"><h6>Pay Bill online</h6></a></td>
<td class="w3-border-0"><a href="offpay.jsp" class="w3-button w3-blue"><h6>Cash On Delivery</h6></a></td></tr>
<% 
				}
    		}
    	}
    	
	}
}
l1.conClose();
%>
<tR>
</tR>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file='footer.jsp'%>
</body>
</html>
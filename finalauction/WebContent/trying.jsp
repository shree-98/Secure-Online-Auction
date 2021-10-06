



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<%@include file='head.jsp'%>
</head>
<body>
<%@include file='header.jsp'%>
s<%@include file='menu.jsp'%>
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
			int quantity1=Integer.parseInt(quantity);
			String pstock=l1.filllabel("select * from tblproduct where pid="+pid, "pstock");
			int pstock1=Integer.parseInt(pstock);
			int calc=pstock1-quantity1;
			if(calc<0)
			{
				out.println("<script>alert('OUT Of STOCK');</script>");
				
			}
			else
			{	
				//l1.dml("update tblproduct set pstock='"+calc+"' where pid="+pid);	

				if(l1.dml("insert into tblcart1(pid,qty,uid,quantity,status)values('"+pid+"','"+cmb+"','"+uid+"','"+quantity+"',0)"))
				{
					%>
					<script>
					alert("Registeration Successfull");
					window.location.href="viewcart.jsp";
					</script>
					<% 

				}else
				{ out.println("error");  }
			}
		}
		else
		{
		%>  	
	 		<script>
			alert("Invalid Bid Amount");
			</script>   
		<%
			   
		}
	}
}
l1.rs=l1.stmt.executeQuery("select * from tblproduct where pid="+pid);
if(l1.rs.next())
{
	%>
	<div class="col-md-12">
	<!-- Card -->
<div class="card">
<div class="jumbotron">
  <!-- Card image -->
  
  <form method="post">
<table class="table">
<Tr>
<Td colspan=6>
<img src="images/<% out.println(l1.rs.getString("pimage"));%>" height=300px>
</td></tr>
<tr>
<Td>
<h3><b><% out.println(l1.rs.getString("pname"));%></b></h3>	
</td>
</tr>
<Tr>
<Td>
Product No.
</Td>
<Td>
	<% out.println(l1.rs.getString("pno"));%>
</td>
</tr>
<Tr>
<Td>
Product Minimum Bid Amount
</Td>
<Td>
	<% out.println(l1.rs.getString("pmprice"));%>
</td>
</tr>

<tr>
<Td>
Ending Date 
</Td>
<Td>
	<% out.println(l1.rs.getString("pdate"));%>
</td>
</tr>
<Tr>
<td>
Enter Time
</td>
<Td>
	<% out.println(l1.rs.getString("ptime"));%>
</td>
</Tr>
<Tr>
<td>
Product Description
</td>
<Td>
	<% out.println(l1.rs.getString("pdesc"));%>
</td>
</Tr>

<Tr>
<td>
current maximum price
</td>
<td>
	<% l1.rs=l1.stmt.executeQuery("select max(qty) as abc from tblcart1 where pid="+pid);
		if(l1.rs.next())
		{
		out.println(l1.rs.getString("abc"));
		}
		
	%>
</td>
</Tr>
<tr>
<td>
Enter Your Bid Amount
</td>
<td>
<input type="text" name="txtubid" class="form-control form=control-lg" placeholder="Enter-your-bid-amount" required">
</td>
</tr>
<tr>
<td>
Enter Quantity
</td>
<td>
<input type="text" name="txtqty" class="form-control form=control-lg" placeholder="Enter-Quantity" required">
</td>
</tr>

<tr>
<td colspan=2 align=center>
<input type="submit" name="btnsave" value="Add Amount"  class="btn btn-success">
</td></tr>
<tr>
<td>
<a href="viewcart.jsp?cartid=<%out.println(request.getParameter("pid"));%>">ViewCart</a>
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
<% //response.sendRedirect("viewcart.jsp"); %>
<%@include file='footer.jsp'%>
</body>
</html>



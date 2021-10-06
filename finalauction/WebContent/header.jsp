<%@include file='mylib.jsp'%>
<%
mylib l1=new mylib();
%>
<html lang="en">
<meta charset="utf-8">

<header>
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><i><a href="index.html">A&SBid Shopping</a></i></h1>
				
			</div>
		<!--//logo-->
		<div class="w3layouts-right">
		<br><br>
			<ul>
			 
			<li> <div class="row">
<div class="col-md-6">

<form method="post">
<table>
<tr>
<td>
<script>
function showHint() {

	var str=document.getElementsByName("cmbcat")[0].value;
//	alert(str);
	window.location.href="test.jsp?e="+str;
	}
</script>
<%
String x1=l1.filldropdown("select * from tblcategory", "cmbcat", "cname", "cid");
out.println(x1);
String id=request.getParameter("cmbcat");
//out.println(id);
%>
</td>
<td>
<body>
<button type="button"   class="btn btn-primary"  onclick="showHint()" >Search</button>
</body>
</td>
</tr>
</table>
</form>
</div>
</div>
</li>
<% 
/*<li>
<div class="row">
<div class="col-md-6">
<form method="post">

<table>
<tr><td>
<input type="text" name="txtsearch" class="form-control"></td><td>
<input type="submit" name="btnsearch1" value="Search" class="btn btn-primary"></td></tr></table>
</form>
</div>

</div>

                    </li>"WebContent/header.jsp"
                   */
	            %>		
	            <%
				try
				{

					if(session.getAttribute("uid")!=null)
					{
					%>
	            <li><a href="mydeals.jsp">My Deals</a></li>
				<li><a href="addproduct.jsp">Add Product</a></li>
				<li><a href="test2.jsp">My Product</a></li>									
				<li><a  href="logout.jsp">Logout</a></li>
				<%
					}}catch(Exception e){}
					%>
				
			</ul>
		</div>
		<div class="clearfix"></div>
    
    </div>
</header>
</html>
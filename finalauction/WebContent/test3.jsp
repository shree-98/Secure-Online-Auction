<%@include file='mylib.jsp'%>
<%
mylib l1=new mylib();
%>

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
	var str=document.getElementByName("cmbcat")[0].value;
	alert("hii");
//var str=document.getElementsByName("txtname")[0].value;
var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
if (this.readyState == 4 && this.status == 200) {
document.getElementById("txtHint").innerHTML = this.responseText;
}
};
xmlhttp.open("GET", "b.jsp?q=" + str, true);
xmlhttp.send();
}
</script>

<%
String c1=l1.filldropdown("select * from tblcategory", "cmbcat", "cname", "cid");
out.println(c1);
String id=request.getParameter("cmbcat");
out.println(id);

%>
<script>
var s="<%=request.getParameter("cmbcat")%>";
alert(s);
</script>
</td>
<td>


<input type="submit" name="btnsearch" value="Search" class="btn btn-primary" onclick="document.forms[0].action = 'test.jsp'; return true;" />
</td>
</tr>
</table>
</form>
</div>
</div>
</li>
<li>
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




                    </li>
                   
			
				<li><a href="addproduct.jsp">Add Product</a></li>			
				
				<li><a class="scroll" href="#contact">GET IN TOUCH</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
    
    </div>
</header>

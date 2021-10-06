<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@include file="head.jsp" %>
<%@include file="header.jsp" %> 
<%  
try
{
MultipartRequest m = new MultipartRequest(request, "/home/dell/eclipse-workspace/finalauction/WebContent/images/");
String name=m.getParameter("txtname");
String pno=m.getParameter("txtpno");
String pmprice=m.getParameter("txtmprice");
String stock=m.getParameter("txtstock");
String date=m.getParameter("txtdate");
String time=m.getParameter("txttime");
String desc=m.getParameter("txtdesc");
String image=m.getOriginalFileName("txtfile");
String cid=m.getParameter("cmbcategory");
String uid=session.getAttribute("uid")+"";		
if(l1.dml("insert into tblproduct(pname,pno,pmprice,pstock,pdate,ptime,pdesc,pimage,cid,uid,count,status)values('"+name+"','"+pno+"','"+pmprice+"','"+stock+"','"+date+"','"+time+"','"+desc+"','"+image+"','"+cid+"','"+uid+"',0,0)"))
{
	//out.println("Success");
	%>
	<script>
	alert("Registeration Successfull");
	window.location.href="register.jsp";
	</script>
	<% 
}
else
{
	out.println("Error");
}

}
catch(Exception ex)
{
	out.println(""+ex.toString());
}

%>  
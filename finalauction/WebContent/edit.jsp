<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@include file="head.jsp" %>
<%@include file="header.jsp" %> 
<%  
try
{
MultipartRequest m = new MultipartRequest(request, "/home/dell/eclipse-workspace/finalauction/WebContent/images/");
String eid=request.getParameter("eid");
out.println(eid);
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
if(l1.dml("update tblproduct set pname='"+name+"',pno='"+pno+"',pmprice='"+pmprice+"',pstock='"+stock+"',pdate='"+date+"',ptime='"+time+"',pdesc='"+desc+"',pimage='"+image+"',cid='"+cid+"',uid='"+uid+"',count=0 where pid='"+eid+"'"))
{
	out.println("Success");
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
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import='java.sql.*' %>
 <%@page import='java.util.*' %>
 <%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%

 class mylib2 
{
	
	Connection con1=null;
	Statement stmt1=null;
	ResultSet rs1=null;
	
	public void conOpen()
	{
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbprojectjsp","root","");
		stmt1=con1.createStatement();
		
		}
		catch(Exception ex)
		{
			
		}
		
	}
	public void conClose()
	{
		try
		{
			con1.close();	
		}
		catch(Exception ex)
		{
			
		}
		
	}
	public boolean exists(String qry)
	{
		try
		{
			
			conOpen();
			rs1=stmt1.executeQuery(qry);
			if(rs1.next())
			{
				stmt1.close();
				conClose();
				return true;
			}
			else
			{
				stmt1.close();
				conClose();
				return false;
			}
			
		}
		catch(Exception ex)
		{
			
			return false;
		}
		
	}
	
	public String filllabel(String qry,String svalue)
	{
		String b="";
		try
		{
			
				conOpen();
				rs1=stmt1.executeQuery(qry);
				String s="";
				if(rs1.next())
				{
					b=rs1.getString(svalue);
					s=b;
					
				}
				
			
					stmt1.close();
			conClose();
			return s;
		}
		catch(Exception ex)
		{
			
			return "";
		}
		
	}
	public int countlabel(String qry,String svalue)
	{
		int b=0;
		try
		{
			
				conOpen();
				rs1=stmt1.executeQuery(qry);
				int s;
				if(rs1.next())
				{
					 b=rs1.getInt(svalue);
					s=b;
					
				}
				
			
					stmt1.close();
			conClose();
			return b;
		}
		catch(Exception ex)
		{
			
			return 0;
		}
		
	}

	
}
%>
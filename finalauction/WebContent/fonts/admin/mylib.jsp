<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import='java.sql.*' %>
 <%@page import='java.util.*' %>
<%

 class mylib
{
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	public void conOpen()
	{
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbprojectjsp","root","");
		stmt=con.createStatement();
		
		}
		catch(Exception ex)
		{
			
		}
		
	}
	public void conClose()
	{
		try
		{
			con.close();	
		}
		catch(Exception ex)
		{
			
		}
		
	}
	public boolean dml(String qry)
	{
		try
		{
			conOpen();
			stmt.executeUpdate(qry);
			stmt.close();
			conClose();
			return true;
		}
		catch(Exception ex)
		{
			
			return false;
		}
		
	}
	public boolean exists(String qry)
	{
		try
		{
			
			conOpen();
			rs=stmt.executeQuery(qry);
			if(rs.next())
			{
				stmt.close();
				conClose();
				return true;
			}
			else
			{
				stmt.close();
				conClose();
				return false;
			}
			
		}
		catch(Exception ex)
		{
			
			return false;
		}
		
	}
	public String filldropdown(String qry,String ddlname,String svalue,String dvalue)
	{
		try
		{
			conOpen();
			rs=stmt.executeQuery(qry);
			
				String s="<select name="+ddlname+"  class='form-control'>";
				while(rs.next())
				{
					int a=Integer.parseInt(rs.getString(dvalue));
					String b=rs.getString(svalue);
					s+="<option value="+a+">"+b+"</option>";
					
				}
				s+="</select>";
			stmt.close();
			conClose();
			return s;
		}
		catch(Exception ex)
		{
			return "0";
			
		}
		
	}
	public String filltextbox(String qry,String txtname,String svalue)
	{
		try
		{
			
			conOpen();
			rs=stmt.executeQuery(qry);
			
			String s="";
			if(rs.next())
				{
					String b=rs.getString(svalue);
					s+="<input type='text' name="+txtname+" value="+b+">";
					
				}
					stmt.close();
			conClose();
			return s;
		}
		catch(Exception ex)
		{
			return "";
			
		}
		
	}
	public String filllabel(String qry,String svalue)
	{
		String b="";
		try
		{
			
			conOpen();
				rs=stmt.executeQuery(qry);
				String s="";
				if(rs.next())
				{
					b=rs.getString(svalue);
					s=b;
					
				}
				
			
					stmt.close();
			conClose();
			return s;
		}
		catch(Exception ex)
		{
			
			return "";
		}
		
	}
	
}
%>
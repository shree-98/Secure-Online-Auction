<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import='java.sql.*' %>
<%@page import='java.util.*' %>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
 
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
	public String filllabel_multiple(String qry,String svalue,String sub,String body)
	{
		String b="";
		try
		{
			
				conOpen();
				rs=stmt.executeQuery(qry);
				String s="";
				while(rs.next())
				{
					b=rs.getString(svalue);
					sendmail(b, sub, body);
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
	public void sendmail(String to1,String sub,String body)
	{
		   //Creating a result for getting status that messsage is delivered or not!
	    String result;
	    // Get recipient's email-ID, message & subject-line from index.html page
	    final String to = to1;
	    final String subject = sub;
	    final String messg = body;
	 
	    // Sender's email ID and password needs to be mentioned
	    final String from = "ashwinidhikale56@gmail.com";
	    final String pass = "ashwini@123";
	 
	 
	    // Defining the gmail host
	    String host = "smtp.gmail.com";
	 
	    // Creating Properties object
	    Properties props = new Properties();
	 
	    // Defining properties
	    props.put("mail.smtp.host", host);
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.user", from);
	    props.put("mail.password", pass);
	    props.put("mail.port", "465");
	 
	    // Authorized the Session object.
	    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(from, pass);
	        }
	    });
	 
	    try {
	        // Create a default MimeMessage object.
	        MimeMessage message = new MimeMessage(mailSession);
	        // Set From: header field of the header.
	        message.setFrom(new InternetAddress(from));
	        // Set To: header field of the header.
	        message.addRecipient(Message.RecipientType.TO,
	                new InternetAddress(to));
	        // Set Subject: header field
	        message.setSubject(subject);
	        // Now set the actual message
	        message.setText(messg);
	        // Send message
	        Transport.send(message);
	        result = "mail sent successfully from W3Adda.com....";
	    } catch (MessagingException mex) {
	        mex.printStackTrace();
	        result = "Error: unable to send mail....";
	    }
	}
	
	
}
%>
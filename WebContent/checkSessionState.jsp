<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*,java.util.*"%>
<%
try
{
	AdminUser i=((AdminUser)session.getAttribute("adminLogin"));
	if(i.getStatus()<=0)
	{
		response.sendRedirect("login.jsp");
	}
	else if(i.isLockedStatus())
	{
		response.sendRedirect("lockedUser.jsp");
		
	}
}
catch(Exception e)
{
	session.setAttribute("errorLogin", "<center><font color='red'>Please Re-login</font></center>");
	response.sendRedirect("login.jsp");
}
%>
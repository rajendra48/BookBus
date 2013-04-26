<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*"%>
<%

String username=request.getParameter("user");
String password=request.getParameter("pass");
DatabaseLayer db=new DatabaseLayer();
AdminUser i=db.getStatus(username, password);
if(i.getStatus()<-1)
{
	
}
else if(i.getStatus()<=0)
{
	session.setAttribute("errorLogin", "<center><font color='red'>Invalid Username or Password</font></center>");
	response.sendRedirect("login.jsp");
}
else
{
	session.setAttribute("adminLogin", i);
	response.sendRedirect("index.jsp");
}

%>
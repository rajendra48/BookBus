<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*" %>
<%
try
{
String password=request.getParameter("pass");
AdminUser user=(AdminUser)session.getAttribute("adminLogin");
if(user.getPassword().equals(password))
{
	user.setLockedStatus(false);
	session.setAttribute("adminLogin",user);
	response.sendRedirect("index.jsp");
}
else
{
	response.sendRedirect("lockedUser.jsp");
}
}catch(Exception e)
{
	response.sendRedirect("lockedUser.jsp");
}
%>
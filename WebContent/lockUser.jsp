<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bookbus.com.*" %>
<%@ page import="com.bookbus.com.*" %>
<%
try
{

AdminUser user=(AdminUser)session.getAttribute("adminLogin");
	user.setLockedStatus(true);
	session.setAttribute("adminLogin",user);
	response.sendRedirect("lockedUser.jsp");

}catch(Exception e)
{
	response.sendRedirect("lockedUser.jsp");
}
%>
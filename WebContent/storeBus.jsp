<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.bookbus.com.*" %>
<%
try
{
String bus_name=request.getParameter("bus_name");
String vendor_id=request.getParameter("vendor_id");
String minFare=request.getParameter("minimum_fare");
String busType=request.getParameter("bus_type");
String capacity=request.getParameter("bus_capacity");

DatabaseLayer obj=new DatabaseLayer();

int i=obj.insertBus(bus_name, vendor_id, minFare, busType, capacity);

if(i==1)
	session.setAttribute("errorBus", "<b><center><font color='green'>Bus Added Succesfully</font></center></b>");

else if(i==-1)
	session.setAttribute("errorBus", "<b><center><font color='red'>Error While adding Bus</font></center></b>");
else if(i==-2)
	session.setAttribute("errorBus", "<b><center><font color='red'>Bus Details Already Exist</font></center></b>");
else
	session.setAttribute("errorBus","<b><center><font color='red'>Error While adding Bus</font></center></b>");

}
catch(Exception e)
{
	session.setAttribute("errorBus",e.toString());
}
response.sendRedirect("addBus.jsp");
%>
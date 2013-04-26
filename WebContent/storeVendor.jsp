<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bookbus.com.*" %>
<%
try
{
String vendor_username=request.getParameter("vendor_username");
String vendor_password=request.getParameter("vendor_password");
String vendor_name=request.getParameter("vendor_name");
String vendor_tag=request.getParameter("vendor_tag_name");
String vendor_shortname=request.getParameter("vendor_short_name");
String vendor_email=request.getParameter("vendor_email");
String vendor_phone=request.getParameter("vendor_phone");
String vendor_url=request.getParameter("vendor_logo");
String vendor_description=request.getParameter("vendor_description");
String vendor_website=request.getParameter("vendor_website");
DatabaseLayer obj=new DatabaseLayer();

int i=obj.insertVendor(vendor_username,vendor_password,vendor_name,vendor_tag,vendor_description,vendor_website,vendor_shortname,vendor_email,vendor_phone,vendor_url);

if(i==1)
	session.setAttribute("errorVendor", "<b><center><font color='green'>Vendor Added Succesfully</font></center></b>");

else if(i==-1)
	session.setAttribute("errorVendor", "<b><center><font color='red'>Error While adding Vendor</font></center></b>");
else if(i==-2)
	session.setAttribute("errorVendor", "<b><center><font color='red'>Vendor with Vendor Name already Exist</font></center></b>");
else
	session.setAttribute("errorVendor","<b><center><font color='red'>Error While adding Vendor</font></center></b>");

}
catch(Exception e)
{
	session.setAttribute("errorVendor",e.toString());
}
response.sendRedirect("addVendor.jsp");
%>
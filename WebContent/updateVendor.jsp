<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="checkSessionState.jsp"%>
<%
String pageNo="";
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
String vendor_id=request.getParameter("vendor_id");
pageNo=request.getParameter("vendor_page_count");
DatabaseLayer obj=new DatabaseLayer();

int i=obj.updateVendor(vendor_id,vendor_username,vendor_password,vendor_name,vendor_tag,vendor_description,vendor_website,vendor_shortname,vendor_email,vendor_phone,vendor_url);

if(i>=1)
	session.setAttribute("errorViewVendor", "<b><center><font color='green'>Vendor Updated Succesfully</font></center></b>");
else
	session.setAttribute("errorViewVendor", "<b><center><font color='red'>Error While Updating Vendor</font></center></b>");


}
catch(Exception e)
{
	session.setAttribute("errorVendor",e.toString());
}

response.sendRedirect("viewVendors.jsp?vendor_page_count="+pageNo);

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="checkSessionState.jsp"%>
<%

DatabaseLayer db=new DatabaseLayer();
session.setAttribute("errorViewVendor","");
String page_no="";
try
{
	page_no=request.getParameter("vendor_page_count");
	String id=request.getParameter("vendor_id");
	int status=db.deleteVendor(id);
	if(status>0)
		session.setAttribute("errorViewVendor","<b><center><font color='green'>Vendor Deleted Succesfully</font></center></b>");
	else
		session.setAttribute("errorViewVendor","<b><center><font color='red'>Error While Deleting Vendor</font></center></b>");
}
catch(Exception e)
{
	
}
response.sendRedirect("viewVendors.jsp?vendor_page_count="+page_no);
%>
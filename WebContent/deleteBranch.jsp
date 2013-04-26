<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="checkSessionState.jsp"%>
<%

DatabaseLayer db=new DatabaseLayer();
session.setAttribute("errorViewBranch","");
String page_no="";
try
{
	page_no=request.getParameter("vendorBranch_pageCount");
	String id=request.getParameter("branch_id");
	int status=db.deleteBranch(id);
	if(status>0)
		session.setAttribute("errorViewBranch","<b><center><font color='green'>Vendor Deleted Succesfully</font></center></b>");
	else
		session.setAttribute("errorViewBranch","<b><center><font color='red'>Error While Deleting Vendor</font></center></b>");
}
catch(Exception e)
{
	
}
response.sendRedirect("viewVendorBranch.jsp?vendorBranch_pageCount="+page_no);
%>
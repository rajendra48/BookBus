<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="checkSessionState.jsp"%>
<%
String pageNo="";
try
{
	String branch_name=request.getParameter("branch_name");
	String vendor_id=request.getParameter("vendor_id");
	String address=request.getParameter("location");
	String description=request.getParameter("description");
	String branch_phone=request.getParameter("branch_phone");
	String branch_type=request.getParameter("branch_type");
	String busses_capacity=request.getParameter("busses_capacity");
	String branch_id=request.getParameter("branch_id");
	pageNo=request.getParameter("vendorBranch_pageCount");
DatabaseLayer obj=new DatabaseLayer();

int i=obj.updateBranch(branch_id, branch_name, vendor_id, address, description, branch_phone, branch_type, busses_capacity);

if(i>=1)
	session.setAttribute("errorViewBranch", "<b><center><font color='green'>Branch Updated Succesfully</font></center></b>");
else
	session.setAttribute("errorViewBranch", "<b><center><font color='red'>Error While Updating Branch</font></center></b>");


}
catch(Exception e)
{
	session.setAttribute("errorViewBranch",e.toString());
}

response.sendRedirect("viewVendorBranch.jsp?vendorBranch_pageCount="+pageNo);

%>
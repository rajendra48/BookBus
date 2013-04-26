<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bookbus.com.*" %>
<%
try
{
String branch_name=request.getParameter("branch_name");
String vendor_id=request.getParameter("vendor_id");
String address=request.getParameter("location");
String description=request.getParameter("description");
String branch_phone=request.getParameter("branch_phone");
String branch_type=request.getParameter("branch_type");
String busses_capacity=request.getParameter("busses_capacity");

DatabaseLayer obj=new DatabaseLayer();

int i=obj.insertBranch(branch_name, vendor_id, address, description, branch_phone, branch_type, busses_capacity);

if(i==1)
	session.setAttribute("errorBranchVendor", "<b><center><font color='green'>Vendor Branch Added Succesfully</font></center></b>");

else if(i==-1)
	session.setAttribute("errorBranchVendor", "<b><center><font color='red'>Error While adding Vendor Branch</font></center></b>");
else if(i==-2)
	session.setAttribute("errorBranchVendor", "<b><center><font color='red'>Branch with Branch Name already Exist</font></center></b>");
else
	session.setAttribute("errorBranchVendor","<b><center><font color='red'>Error While adding Branch</font></center></b>");

}
catch(Exception e)
{
	session.setAttribute("errorBranchVendor",e.toString());
}
response.sendRedirect("addVendorBranch.jsp");
%>
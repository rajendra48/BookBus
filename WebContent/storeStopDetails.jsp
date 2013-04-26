<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*"%>
<%
	try {
		String stop_type = request.getParameter("stop_type");
		String location = request.getParameter("location");
		String contact = request.getParameter("contact");
		String other_details = request.getParameter("other_details");

		DatabaseLayer obj = new DatabaseLayer();

		int i = obj.insertStopDetails(stop_type, location, contact,
				other_details);

		if (i == 1)
			session.setAttribute("errorBusStop",
					"<b><center><font color='green'>Bus Stop Added Succesfully</font></center></b>");

		else if (i == -1)
			session.setAttribute("errorBusStop",
					"<b><center><font color='red'>Error While adding Bus Stop</font></center></b>");

		else
			session.setAttribute("errorBusStop",
					"<b><center><font color='red'>Error While adding Bus Stop</font></center></b>");

	} catch (Exception e) {
		session.setAttribute("errorBusStop", e.toString());
	}
	response.sendRedirect("addStopDetails.jsp");
%>
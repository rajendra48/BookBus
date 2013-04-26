<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*"%>
<%
	try {
		String bus_id = request.getParameter("bus_id");
		String from_location = request.getParameter("from_location");
		String from_date = request.getParameter("from_date");
		String from_time = request.getParameter("from_time");
		String to_location = request.getParameter("to_location");
		String to_date = request.getParameter("to_date");
		String to_time = request.getParameter("to_time");
		
		DatabaseLayer obj = new DatabaseLayer();

		int i = obj.insertNewSchedule(bus_id, from_location, from_date, from_time, to_location, to_date, to_time);

		if (i == 1)
			session.setAttribute("errorNewScheduleStop",
					"<b><center><font color='green'>New Schedule Added Succesfully</font></center></b>");

		else if (i == -1)
			session.setAttribute("errorNewScheduleStop",
					"<b><center><font color='red'>Error While adding New Schedule</font></center></b>");

		else
			session.setAttribute("errorNewScheduleStop",
					"<b><center><font color='red'>Error While adding New Schedule</font></center></b>");

	} catch (Exception e) {
		session.setAttribute("errorNewScheduleStop", e.toString());
	}
	response.sendRedirect("addNewSchedule.jsp");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*" %>
<%
AdminUser user=(AdminUser)session.getAttribute("adminLogin");
%>
<ul class='main-nav'>
	<li class='active'><a href="index.jsp"> <i class="icon-home"></i>
			<span>Dashboard</span>
	</a></li>
	<li><a href="#" data-toggle="dropdown" class='dropdown-toggle'>
			<i class="icon-edit"></i> <span>Vendors</span> <span class="caret"></span>
	</a>
		<ul class="dropdown-menu">
			<li><a href="addVendor.jsp">Add Vendor</a></li>
			<li><a href="viewVendors.jsp">View Vendors</a></li>
			<li><a href="#">Search Vendors</a></li>
			<li><a href="addVendorBranch.jsp">Add Vendors Branches</a></li>
			<li><a href="viewVendorBranch.jsp">View Vendor Branches</a></li>
		</ul></li>
	<li><a href="#" data-toggle="dropdown" class='dropdown-toggle'>
			<i class="icon-th-large"></i> <span>Busses</span> <span class="caret"></span>
	</a>
		<ul class="dropdown-menu">
			<li><a href="addBus.jsp">Add Bus</a></li>
			<li><a href="#">View Busses</a></li>
			<li><a href="#">Search Busses</a></li>
			<li><a href="addStopDetails.jsp">Add Stop Details</a></li>
			<li><a href="#">View Stop Details</a></li>
		</ul></li>
	
	<li><a href="#" data-toggle="dropdown" class='dropdown-toggle'>
			<i class="icon-table"></i> <span>Schedules</span> <span class="caret"></span>
	</a>
		<ul class="dropdown-menu">
			<li><a href="addNewSchedule.jsp">Add New Schedule</a></li>
			<li><a href="#">View Schedules</a></li>
			
		</ul></li>
		
		

<li><a href="#" data-toggle="dropdown" class='dropdown-toggle'>
			<i class="icon-table"></i> <span>Users</span> <span class="caret"></span>
	</a>
		<ul class="dropdown-menu">
			<li><a href="#">Add New User</a></li>
			<li><a href="#">Search User</a></li>
			<li><a href="#">View User Stats</a></li>
		</ul></li>

</ul>

<div class="user">
	<ul class="icon-nav">
		<li class="dropdown sett"><a href="#" class='dropdown-toggle'
			data-toggle="dropdown"><i class="icon-cog"></i></a>
			<ul class="dropdown-menu pull-right theme-settings">
				<li><span>Layout-width</span>
					<div class="version-toggle">
						<a href="#" class='set-fixed'>Fixed</a> <a href="#"
							class="active set-fluid">Fluid</a>
					</div></li>
				<li><span>Topbar</span>
					<div class="topbar-toggle">
						<a href="#" class='set-topbar-fixed'>Fixed</a> <a href="#"
							class="active set-topbar-default">Default</a>
					</div></li>
				<li><span>Sidebar</span>
					<div class="sidebar-toggle">
						<a href="#" class='set-sidebar-fixed'>Fixed</a> <a href="#"
							class="active set-sidebar-default">Default</a>
					</div></li>
			</ul></li>
		<li class='dropdown colo'><a href="#" class='dropdown-toggle'
			data-toggle="dropdown"><i class="icon-tint"></i></a>
			<ul class="dropdown-menu pull-right theme-colors">
				<li class="subtitle">Predefined colors</li>
				<li><span class='red'></span> <span class='orange'></span> <span
					class='green'></span> <span class="brown"></span> <span
					class="blue"></span> <span class='lime'></span> <span class="teal"></span>
					<span class="purple"></span> <span class="pink"></span> <span
					class="magenta"></span> <span class="grey"></span> <span
					class="darkblue"></span> <span class="lightred"></span> <span
					class="lightgrey"></span> <span class="satblue"></span> <span
					class="satgreen"></span></li>
			</ul></li>
		<li><a href="lockUser.jsp" class='lock-screen' rel='tooltip'
			title="Lock screen" data-placement="bottom"><i class="icon-lock"></i></a></li>
	</ul>
	<div class="dropdown">
		<a href="#" class='dropdown-toggle' data-toggle="dropdown">
		<%
		try
		{
		%>
		
		<%=user.getName() %><img src="<%=user.getUser_Image() %>" alt="">
		
		<%
		}
		catch(Exception e)
		{
			
		}
		%>
		</a>
		<ul class="dropdown-menu pull-right">
			<li><a href="more-userprofile.html">Edit profile</a></li>
			<li><a href="#">Account settings</a></li>
			<li><a href="logout.jsp">Sign out</a></li>
		</ul>
	</div>
</div>
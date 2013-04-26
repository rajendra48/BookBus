<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="checkSessionState.jsp"%>
<%
DatabaseLayer db=new DatabaseLayer();%>
<!doctype html>
<html>
<head>
<meta charset="utf8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="bookbus" content="yes" />
<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap responsive -->
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<!-- jQuery UI -->
<link rel="stylesheet"
	href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
<!-- PageGuide -->
<link rel="stylesheet" href="css/plugins/pageguide/pageguide.css">
<!-- Fullcalendar -->
<link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.css">
<link rel="stylesheet"
	href="css/plugins/fullcalendar/fullcalendar.print.css" media="print">
<!-- Theme CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Color CSS -->
<link rel="stylesheet" href="css/themes.css">


<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery UI -->
<script src="js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
<script src="js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
<script src="js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
<script src="js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
<script src="js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
<!-- Touch enable for jquery UI -->
<script src="js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
<!-- slimScroll -->
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- vmap -->
<script src="js/plugins/vmap/jquery.vmap.min.js"></script>
<script src="js/plugins/vmap/jquery.vmap.world.js"></script>
<script src="js/plugins/vmap/jquery.vmap.sampledata.js"></script>
<!-- Bootbox -->
<script src="js/plugins/bootbox/jquery.bootbox.js"></script>
<!-- Flot -->
<script src="js/plugins/flot/jquery.flot.min.js"></script>
<script src="js/plugins/flot/jquery.flot.bar.order.min.js"></script>
<script src="js/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="js/plugins/flot/jquery.flot.resize.min.js"></script>
<!-- imagesLoaded -->
<script src="js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
<!-- PageGuide -->
<script src="js/plugins/pageguide/jquery.pageguide.js"></script>
<!-- FullCalendar -->
<script src="js/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="js/plugins/validation/jquery.validate.min.js"></script>
<script src="js/plugins/validation/additional-methods.min.js"></script>
<link rel="stylesheet" href="css/plugins/timepicker/bootstrap-timepicker.min.css">
<link rel="stylesheet" href="css/plugins/datepicker/datepicker.css">

<script src="js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script src="js/plugins/datepicker/bootstrap-datepicker.js"></script>

<!-- Theme framework -->
<script src="js/eakroko.min.js"></script>
<!-- Theme scripts -->

<script src="js/application.min.js"></script>
<!-- Just for demonstration -->
<script src="js/demonstration.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon" href="img/favicon.ico" />
<!-- Apple devices Homescreen icon -->
<link rel="apple-touch-icon-precomposed"
	href="img/apple-touch-icon-precomposed.png" />


</head>

<body>
	<div id="navigation">
		<div class="container-fluid">
			<a href="#" id="brand">BookBus.COM</a> <a href="#" class="toggle-nav"
				rel="tooltip" data-placement="bottom" title="Toggle navigation"><i
				class="icon-reorder"></i></a>

			<%@include file="topMenu.jsp"%>

			<a href="#" class='toggle-mobile'><i class="icon-reorder"></i></a>
		</div>
	</div>
	<div class="container-fluid" id="content">

		<%@include file="leftMenu.jsp"%>


		<div id="main">


			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1>Add New Vendor</h1>
					</div>
					<div class="pull-right">
						<ul class="minitiles">
							<li class='teal'><a href="#"><i class="icon-inbox"></i></a>
							</li>
							<li class='red'><a href="#"><i class="icon-cogs"></i></a></li>
							<li class='lime'><a href="#"><i class="icon-globe"></i></a>
							</li>
						</ul>
						<ul class="stats">
							<li class='blue'><i class="icon-shopping-cart"></i>
								<div class="details">
									<span class="big">175</span> <span>New orders</span>
								</div></li>
							<li class='green'><i class="icon-money"></i>
								<div class="details">
									<span class="big">$324,12</span> <span>Balance</span>
								</div></li>
							<li class='orange'><i class="icon-calendar"></i>
								<div class="details">
									<span class="big">February 22, 2013</span> <span>Wednesday,
										13:56</span>
								</div></li>
						</ul>
					</div>
				</div>


				<div class="breadcrumbs">
					<ul>
						<li><a href="index.jsp">Home</a> <i class="icon-angle-right"></i></li>
						<li><a href="#">Add Vendors</a></li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>
				<!--  SITE BODY STARTS HERE -->

				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-ok"></i>Please Enter Bus Details
								</h3>
							</div>
							<div class="box-content">
								<form action="storeNewSchedule.jsp" method="POST"
									class='form-horizontal form-validate' id="bb">
									<div class="control-group">
										<label for="emailfield" class="control-label">Select Bus </label>
										<div class="controls">
											<%
											ArrayList<Bus> vendors=db.getBusVendorList();
												
											%>
											<select name='bus_id'>

												<%
											for(Bus v:vendors)
											{
												%><option value="<%=v.getId() %>"><%=v.getName()+"("+db.getVendor(v.getVendor_id()).getName()+")" %></option>
												<%} 
											%>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">From </label>
										<div class="controls">
											<%
											ArrayList<BusStop> stops=db.getBusStop();
												
											%>
											<select name='from_location'>

												<%
											for(BusStop v:stops)
											{
												%><option value="<%=v.getBusStop_id() %>"><%=v.getLocation() %></option>
												<%} 
											%>
											</select>
										</div>
									</div>
									
									
									<div class="control-group">
										<label for="textfield" class="control-label">Start Date : </label>
										<div class="controls">											
											<input type="text" name="from_date" id="textfield" class="input-medium datepick" data-rule-required="true" >
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Start Time : </label>
										<div class="controls">											
											<div class="bootstrap-timepicker">
												<input type="text" name="from_time" id="timepicker" class="input-small timepick" data-rule-required="true" >
												<span class="help-block"></span>
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">To </label>
										<div class="controls">
											
											<select name='to_location'>

												<%
											for(BusStop v:stops)
											{
												%><option value="<%=v.getBusStop_id() %>"><%=v.getLocation() %></option>
												<%} 
											%>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">End Date : </label>
										<div class="controls">											
											<input type="text" name="to_date" id="textfield" class="input-medium datepick" data-rule-required="true" >
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">End Time : </label>
										<div class="controls">					
											<div class="bootstrap-timepicker">
												<input type="text" name="to_time" id="timepicker" class="input-small timepick" data-rule-required="true" >
												<span class="help-block"></span>
										</div>
									</div>
									
									
									
							</div>
							<div class="form-actions">
								<input type="submit" class="btn btn-primary" value="Submit">
								<button type="button" class="btn">Cancel</button>
							</div>
							</form>
							<div>
								<%
										try {
											String vendorerror = (String) session
													.getAttribute("errorNewScheduleStop");

											if (vendorerror != null || !vendorerror.equals("")) {
												out.println(vendorerror);
											}
										} catch (Exception e) {

										}
										session.setAttribute("errorNewScheduleStop", "");
									%>
							</div>
						</div>
					</div>
				</div>


			</div>


			<!-- SITE BODY ENDS HERE -->
		</div>
	</div>
	</div>

</body>

</html>

    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="checkSessionState.jsp"%>
<%
DatabaseLayer db=new DatabaseLayer();

String branch_id=request.getParameter("branch_id");
String pageNo=request.getParameter("vendorBranch_pageCount");
Branch b=new Branch();
try
{
	if(branch_id.equals("")||branch_id.equals(null))		
		response.sendRedirect("viewVendorBranch.jsp?vendor_page_count="+pageNo);
	b=db.getBranch(branch_id);
	if(b.getStatus()<=0)
	{
		session.setAttribute("errorViewBranch","<b><center><font color='red'>Vendor Not Found</font></center></b>");
		response.sendRedirect("viewVendorBranch.jsp?vendor_page_count="+pageNo);
	}
}
catch(Exception e)
{
	response.sendRedirect("viewVendorBranch.jsp?vendor_page_count="+pageNo);
}




%>
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
						<h1>Edit Branch</h1>
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
						<li><a href="viewVendorBranch.jsp">View Branchs</a></li>
						<li><a href="#">Edit Branchs</a></li>
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
									<i class="icon-ok"></i>Please Enter Vendor Details
								</h3>
							</div>
							<div class="box-content">
								<form action="updateBranch.jsp" method="POST"
									class='form-horizontal form-validate' id="bb">
									<div class="control-group">
										<label for="textfield" class="control-label">Branch
											Name</label>
										<div class="controls">
											<input type="text" name="branch_name" id="textfield"
												class="input-xlarge" data-rule-required="true" value="<%=b.getName() %>"
												data-rule-minlength="5">
												<input type="hidden" name="branch_id" value="<%=b.getBranch_id() %>">
												<input type="hidden" name="vendorBranch_pageCount" value="<%=pageNo %>">
										</div>
									</div>

									<div class="control-group">
										<label for="textfield" class="control-label">Vendor
											Name</label>
										<div class="controls">
											
											<%
											ArrayList<Vendors> vendors=db.getVendor();
												
											%>
											<select name='vendor_id'>

												<%
											for(Vendors v:vendors)
											{
												if(v.getId()==b.getVendori_id()){
												%><option value="<%=v.getId() %>" SELECTED><%=v.getName() %></option>
												<%}
												else	{
													%><option value="<%=v.getId() %>" ><%=v.getName() %></option>
													<%}
											} %>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Address</label>
										<div class="controls">
											<TEXTAREA type="text" name="location" id="textfield"
												class="input-xlarge" data-rule-required="true"
												><%=b.getLocation() %></TEXTAREA>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Description</label>
										<div class="controls">
											<TEXTAREA type="text" name="description" id="textfield"
												class="input-xlarge" data-rule-required="true"
												><%=b.getDescription() %></TEXTAREA>
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">Phone</label>
										<div class="controls">
											<input type="text" name="branch_phone" class="input-xlarge" value="<%=b.getPhno() %>"
												data-rule-required="true">
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">Type of Branch
										</label>
										<div class="controls">
											<select name='branch_type'>
											
											<option value='Station'>Bus Station</option>
											<option value='Smallstop'>Small Stop</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">Busses Capacity</label>
										<div class="controls">
											<input type="text" name="busses_capacity" id="busses_capacity"
												class="input-xlarge" data-rule-number="true"  value="<%=b.getCapacity() %>"
												data-rule-required="true">
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
													.getAttribute("errorBranchVendor");

											if (vendorerror != null || !vendorerror.equals("")) {
												out.println(vendorerror);
											}
										} catch (Exception e) {

										}
										session.setAttribute("errorBranchVendor", "");
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


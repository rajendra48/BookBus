<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.bookbus.com.*"%>
<%@ include file="checkSessionState.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<meta name="bookbus" content="yes" />

<meta names="bookbus" content="black-translucent" />
<!-- FullCalendar -->
<script src="js/plugins/fullcalendar/fullcalendar.min.js"></script>


<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap responsive -->
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<!-- jQuery UI -->
<!-- FullCalendar -->
<script src="js/plugins/fullcalendar/fullcalendar.min.js"></script>

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

<link rel="stylesheet" href="css/plugins/datatable/TableTools.css">
<script src="js/plugins/datatable/jquery.dataTables.min.js"></script>
<script src="js/plugins/datatable/TableTools.min.js"></script>
<script src="js/plugins/datatable/ColReorder.min.js"></script>
<script src="js/plugins/datatable/ColVis.min.js"></script>
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
						<h1>Vendors List</h1>
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
						<li><a href="#">View Vendors</a></li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>

				<!--  SITE BODY STARTS HERE -->
				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-table"></i> Vendors List
								</h3>
							</div>
							<div class="box-content nopadding">
								<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper"
									role="grid">
									<div id="DataTables_Table_0_length" class="dataTables_length">

									</div>
									<div class="dataTables_filter" id="DataTables_Table_0_filter">
										<label><span>Search:</span> <input type="text"
											aria-controls="DataTables_Table_0"
											placeholder="Search here..."></label>
									</div>





									<table class="table table-nomargin dataTable table-bordered"
										id="DataTables_Table_0"
										aria-describedby="DataTables_Table_0_info">

										<%
										DatabaseLayer db=new DatabaseLayer();
										int totalCount=db.getVendorCount();
										
										int current=1;
										try
										{
											String s=request.getParameter("vendor_page_count");
											if(s.equals("")||s.equals(null))
											{
												current=1;
											}
											else
											{
												current=Integer.parseInt(s);
											}
											
										}
										catch(Exception e)
										{
											
										}
										ArrayList<Vendors> vendors=db.getVendor(current);
										%>

										<thead>

											<tr role="row">
												<th class="sorting_asc" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													style="width: 271px;" aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending">Vendor
													Name<%=current %></th>

												<th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													style="width: 237px;"
													aria-label="Browser: activate to sort column ascending">Website</th>
												<th class="hidden-350 sorting" role="columnheader"
													tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
													colspan="1" style="width: 218px;"
													aria-label="Platform(s): activate to sort column ascending">Email</th>
												<th class="hidden-1024 sorting" role="columnheader"
													tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
													colspan="1" style="width: 236px;"
													aria-label="Engine version: activate to sort column ascending">Phone
													No</th>
												<th class="hidden-480 sorting" role="columnheader"
													tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
													colspan="1" style="width: 173px;"
													aria-label="CSS grade: activate to sort column ascending"></th>
											</tr>

										</thead>

										<tbody role="alert" aria-live="polite" aria-relevant="all">
											<%
										if(vendors.size()>0)
										for(Vendors v: vendors)
										{
											%>
											<tr class="odd">
												<td class="  sorting_1"><%=v.getName() %></td>
												<td class=" "><%=v.getWebsite() %></td>
												<td class="hidden-350 "><%=v.getEmail() %></td>
												<td class="hidden-1024 "><%=v.getPhone_no() %></td>
												<td class="hidden-480 ">
													<table>
														<tr>
															<td>
																<form action="editVendor.jsp" method='post'>
																	<input type='hidden' name='vendor_id'
																		value='<%=v.getId() %>' /> <input type='submit'
																		value='View and Edit' /> <input type='hidden'
																		name='vendor_page_count' value='<%=current %>' />
																</form>
															</td>
															<td>
																<form action='deleteVendor.jsp' method='post'>
																	<input type='hidden' name='vendor_page_count'
																		value='<%=current %>' /> <input type='hidden'
																		name='vendor_id' value='<%=v.getId() %>' /> <input
																		type='submit' value='Delete' />
																</form>

															</td>
														</tr>
													</table>
												</td>
											</tr>
											<%
										}
										else
										{
											%>
											<tr>
												<td colspan='5'><center>No Data Available</center></td>
											</tr>
											<%
										}
										
										%>




										</tbody>
									</table>

									<div class="dataTables_info" id="DataTables_Table_0_info">
										Showing <span> <%
										if(current==1&&totalCount<0)
										{
											out.println(1+"");
										}
										else if(current>0&&(current*10+1)<totalCount)
											out.println((current*10+1)+"");
										else if(current>1&&(current*10+1)>=totalCount)
										{
											current=totalCount/10;
											out.println((current*10+1)+"");
										}
										else
											out.println(current);
										%>

										</span> to <span> <%
										if(current==1&&totalCount<10)
										{
											out.println(totalCount+"");
										}
										
										else if(current>0&&((current+1)*10<totalCount))
											out.println((current+1)*10+"");
										else if(current>0&&((current+1)*10>=totalCount))
											out.println(totalCount+"");
										else
											out.println(current);
										%>


										</span> of <span> <%
										out.println(totalCount+"");
										%>

										</span> entries
									</div>
									<div class="dataTables_paginate paging_full_numbers"
										id="DataTables_Table_0_paginate">
										<%
										if(totalCount<10)
										{
										%>
										<a tabindex="0"
											class="first paginate_button paginate_button_disabled"
											id="DataTables_Table_0_first" style='background: #368ee0;'>First</a><a
											tabindex="0"
											class="previous paginate_button paginate_button_disabled"
											id="DataTables_Table_0_previous" style='background: #368ee0;'>Previous</a><span><a
											tabindex="0" class="paginate_active">1</a> <a tabindex="0"
											class="next paginate_button" id="DataTables_Table_0_next"
											style='background: #368ee0;'>Next</a><a tabindex="0"
											class="last paginate_button" id="DataTables_Table_0_last"
											style='background: #368ee0;'>Last</a> <%
										}
										else if((((current+1)*10)<((totalCount/10)*10))&&current==1)
										{
											%> <a tabindex="0"
											class="first paginate_button paginate_button_disabled"
											id="DataTables_Table_0_first" style='background: #368ee0;'>First</a><a
											tabindex="0"
											class="previous paginate_button paginate_button_disabled"
											id="DataTables_Table_0_previous" style='background: #368ee0;'>Previous</a><span><a
												tabindex="0" class="paginate_active">1</a> <a tabindex="0"
												href="viewVendors.jsp?vendor_page_count=<%=current+1 %>"
												class="paginate_button"><%=current+1 %></a></span> <a tabindex="0"
											class="next paginate_button" id="DataTables_Table_0_next">Next</a><a
											tabindex="0" class="last paginate_button"
											id="DataTables_Table_0_last">Last</a> <%
											
											
											
										}
										else if((((current+1)*10)<((totalCount/10)*10))&&current>1)
										{
											%> <a tabindex="0"
											class="first paginate_button paginate_button_disabled"
											id="DataTables_Table_0_first">First</a><a tabindex="0"
											class="previous paginate_button paginate_button_disabled"
											id="DataTables_Table_0_previous">Previous</a><span><a
												tabindex="0" class="paginate_active"><%=current %></a> <a
												tabindex="0"
												href="viewVendors.jsp?vendor_page_count=<%=current+1 %>"
												class="paginate_button"><%=current+1 %></a></span> <a tabindex="0"
											class="next paginate_button" id="DataTables_Table_0_next">Next</a><a
											tabindex="0" class="last paginate_button"
											id="DataTables_Table_0_last">Last</a> <%
											
											
											
										}
										else{
											%> <a tabindex="0"
											class="first paginate_button paginate_button_disabled"
											id="DataTables_Table_0_first">First</a><a tabindex="0"
											class="previous paginate_button paginate_button_disabled"
											id="DataTables_Table_0_previous">Previous</a><span><a
												tabindex="0" class="paginate_active"
												href="viewVendors.jsp?vendor_page_count=<%=current-1 %>"><%=current-1 %></a>
												<a tabindex="0" class="paginate_button"><%=current %></a></span> <a
											tabindex="0" class="next paginate_button"
											id="DataTables_Table_0_next">Next</a><a tabindex="0"
											class="last paginate_button" id="DataTables_Table_0_last">Last</a>
											<%
										}%>
									</div>
								</div>
							</div>
							<div>
								<center>
									<%
										try {
											String vendorerror = (String) session
													.getAttribute("errorViewVendor");

											if (vendorerror != null || !vendorerror.equals("")) {
												out.println(vendorerror);
											}
										} catch (Exception e) {

										}
										session.setAttribute("errorViewVendor", "");
									%>
								</center>
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


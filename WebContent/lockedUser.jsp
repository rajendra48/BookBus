<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*" %>
<%
AdminUser user=(AdminUser)session.getAttribute("adminLogin");
 %>
<!doctype html>
<html>
<head>
	<meta charset="utf8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->

	

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">


	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/eakroko.js"></script>

	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

</head>

<body class='locked'>
	<div class="wrapper">
		<div class="pull-left">
		<%
		try
		{
		%>
		<img src="<%=user.getUser_Image() %>" alt="" width="200" height="200">
		
		<%
		}
		catch(Exception e)
		{}%>
		
			
			<a href="logout.jsp">Not <%
		try
		{
		%>
		<%=user.getName() %>
		
		<%
		}
		catch(Exception e)
		{}%></a>
		
		</div>
		<div class="right">
			<div class="upper">
			
			<%
		try
		{
		%>
		<h2><%=user.getName() %></h2>
				<span>Locked</span>
		
		
		<%
		}
		catch(Exception e)
		{
			
		}
		%>
				
			</div>
			<form action="unLockUser.jsp" method='post'>
				<input type="password" name='pass' placeholder="Password">
				<div>
					<input type="submit" value="Unlock" class='btn btn-inverse'>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-38620714-4']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>

</html>

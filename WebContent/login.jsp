<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookbus.com.*"%>
<%
try
{
	AdminUser i=((AdminUser)session.getAttribute("adminLogin"));
	if(i.getStatus()>0)
	{
		response.sendRedirect("index.jsp");
	}
}
catch(Exception e)
{
	
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
<link rel="BookBus.com" href="img/BookBuscom.png.png" />

</head>

<body class='login'>
	<div class="wrapper">
		<h1>
			<a href="index.html">BookBus.com</a>
		</h1>
		<div class="login-body">
			<h2>SIGN IN</h2>
			<form action="doLogin.jsp" method='post'>
				<div class="email">
					<input type="text" name='user' placeholder="Email address"
						class='input-block-level'>
				</div>
				<div class="pw">
					<input type="password" name="pass" placeholder="Password"
						class='input-block-level'>
				</div>
				<div class="submit">
					<input type="submit" value="Sign me in" class='btn btn-primary'>
				</div>
			</form>
			<div class="forget">
				<a href="#"><span>Forgot password?</span></a>
			</div>
			<div>
				<%
					try {
						String s = (String) session.getAttribute("errorLogin");
						if(!s.equals("")||!s.equals(null))
							out.println("<b>" + s + "</b>");
					} catch (Exception e) {

					}
				session.setAttribute("errorLogin", "");
				session.invalidate();
				%>
			</div>
		</div>
	</div>

</body>

</html>

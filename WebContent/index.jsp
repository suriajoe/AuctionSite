<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auction Site</title>
</head>
<body>

	
<div style="color:#1a1a1a; 
			text-align:center; 
			margin: 15px;
			margin-top: 15%;
			font-size:50px;
			">
			<p style="font-family:Sans-serif;"><b>Auction Site</b></p>
</div>

<div id="search-bar" style="text-align:center; margin-top: 5%; margin-bottom:5%;">

	<!-- WE'RE GOING TO NEED A SEARCH.JSP -->

	<form action="search.jsp">
		<input type="text" name="search-bar" placeholder="Search Here">
		<input type="submit" value="Search!">
	</form>
</div>

<div id="buttons" style="text-align:center;">
	<a href="loginpage.jsp" style="text-decoration:none;">
		<button style="padding:10px; name:LogIn;">Log In</button>
	</a>
	<a href="registration.jsp" style="text-decoration:none;">
		<button style="padding:10px; name:CAcct;">Create Account</button>
	</a>
</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site | Logged On</title>
</head>
<body>

	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String email = (String)session.getAttribute("email");
		String name = (String)session.getAttribute("first_name");
	
	
	%>
	<div style="color:#1a1a1a; 
			text-align:center; 
			margin: 15px;
			margin-top: 15%;
			">
			<p style="font-family:Sans-serif; font-size:50px"><b>Auction Site</b></p>
			<p style="font-family:Sans-serif; font-size:30px"><b>Welcome, <%= name %>!</b></p>
	</div>

	<div id="search-bar" style="text-align:center; margin-top: 5%; margin-bottom:5%;">
		<form action="search.jsp">
			<input type="text" name="search-bar" placeholder="Search Here">
			<input type="submit" value="Search!">
		</form>
	</div>

	<div id="buttons" style="text-align:center;">
		<a href="loggingout.jsp" style="text-decoration:none;">
			<button style="padding:10px; name:LogIn;">Log Out</button>
		</a>
		<a href="ListItem.jsp" style="text-decoration:none;">
			<button style="padding:10px; name:listitems;">List An Item</button>
		</a>
		<a href="viewItems.jsp" style="text-decoration:none;">
			<button style="padding:10px; name:viewitems;">View Your Items</button>
		</a>
		<a href="sell.jsp" style="text-decoration:none;">
			<button style="padding:10px; name:viewitems;">Sell An Item</button>
		</a>
		<a href= "viewQuestions.jsp" style ="text-decoration:none;">
			<button style="padding:10px; name:viewQuestions;">View Questions/Answers</button>
		</a>		
	</div>
</body>
</html>
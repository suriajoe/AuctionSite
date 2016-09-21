<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String admin = (String)session.getAttribute("admin?");
	String rep = (String)session.getAttribute("rep?");
	
	if(admin != null || rep != null){
	if(admin.equals("yes")){
		%>
		<div style="text-align:center;">
			<h1 style="font-family:Sans-serif;text-size:40px;">Item Added!</h1>
			<h2 style="font-family:Sans-serif;">Click below to go back home</h2>
			<a href="indexAdmin.jsp" style="text-decoration:none;">
				<button style="margin:5px;">Home</button>
			</a>
		</div>
		<%
	}
	
	else if(rep.equals("yes")){
		%>
		<div style="text-align:center;">
			<h1 style="font-family:Sans-serif;text-size:40px;">Item Added!</h1>
			<h2 style="font-family:Sans-serif;">Click below to go back home</h2>
			<a href="indexRep.jsp" style="text-decoration:none;">
				<button style="margin:5px;">Home</button>
			</a>
		</div>
		<%
	}
	else {
		%>
		<div style="text-align:center;">
			<h1 style="font-family:Sans-serif;text-size:40px;">Item Added!</h1>
			<h2 style="font-family:Sans-serif;">Click below to go back home</h2>
			<a href="indexLoggedOn.jsp" style="text-decoration:none;">
				<button style="margin:5px;">Home</button>
			</a>
		</div>
		<%
	}
	}
	
%>
</body>
</html>
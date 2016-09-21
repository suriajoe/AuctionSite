<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Enter the email of the new customer representative:</h1>
		<form action="justemailrep.jsp" method = "post">
		<table align="center" style="margin-top:5%; text-align:left;">
			<tr>
				<td>
					Email:
				</td>
				<td>
					<input type="text" name="repemail" />
				</td>
			</tr>
			
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" />		
		</div>
		</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Email not found. Create a new Customer Rep Account:</h1>
	<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">New Customer Representative Details:</h1>
	<form action="insertPerson.jsp" method = "post">
		<table align="center" style="margin-top:5%; text-align:left;">
			<tr>
				<td>
					First name:
				</td>
				<td>
					<input type="text" name="fname" />
				</td>
			</tr>
			<tr>
				<td>
					Last name:
				</td>
				<td>
					<input type="text" name="lname" />
				</td>
			</tr>
			<tr>
				<td>
					Email:
				</td>
				<td>
					<input type="text" name="email" />
				</td>
			</tr>
			<tr>
				<td>
					Create Password:
				</td>
				<td>
					<input type="text" name="pass" />
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" />		
		</div>
	</form>
</body>
</html>
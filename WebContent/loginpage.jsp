<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Enter your details to log in:</h1>
	<form action="LoginCheck.jsp" method = "get">
		<table align="center" style="margin-top:5%; text-align:left;">
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
					Password:
				</td>
				<td>
					<input type="password" name="pass" />
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%;">
			<input type = "submit" />		
		</div>
	</form>
	</br>
	<div style="text-align:center;">
		<a href="index.jsp" style="text-decoration:none"> 
			<button>Home</button>
		</a>
	</div>
</body>
</html>
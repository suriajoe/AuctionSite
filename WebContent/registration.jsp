<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auction Site</title>


</head>
<body>
	<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Please enter your new user details:</h1>
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
			<tr>
				<td>
					Admin:
				</td>
				<td>
					<input type="checkbox" name="admin" value="yes" />
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%">
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
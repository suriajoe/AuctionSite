<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auction Site</title>
</head>
<body>
	<h1>Please enter the new person's details:</h1>
	<form action="insertAdmin.jsp" method = "post">
		<table>
			<tr>
				<td>
					Account ID:
				</td>
				<td>
					<input type="text" name="accid" />
				</td>
			</tr>
		</table>		
		<input type = "submit" />		
	</form>
	</br>
	<a href="home.html" style="text-decoration:none"> 
		<button>Home</button>
	</a>
</body>
</html>
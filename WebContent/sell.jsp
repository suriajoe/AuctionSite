<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>


	<h1 style="text-align:center; 
			margin-top: 15%;
			font-size:50px;">
			Enter the name of the item you want to sell (Make sure you listed the item first):		
	</h1>
	<form action="setupauction.jsp" method = "post">
		<table align="center" style="margin-top:5%; text-align:left;">
			<tr>
				<td>
					Item:
				</td>
				<td>
					<input type="text" name="sellitem" />
				</td>
			</tr>
			
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" />		
		</div>
		</form>
	
	

</body>
</html>
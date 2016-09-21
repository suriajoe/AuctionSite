<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
	<h1>Enter details about your Playstation game:</h1>
		<form action="ps_search_result.jsp" method = "post">
		<table align="center" style="margin-top:5%; text-align:left;">
			<tr>
				<td>
					Title:
				</td>
				<td>
					<input type="text" name="title" />
				</td>
			</tr>
			<tr>
				<td>
					Condition:
				</td>
				<td>
					<p><input type="radio" name="condition" value="Brand New" /> Brand new</p>
					<p><input type="radio" name="condition" value="Like New" /> Like new</p>
					<p><input type="radio" name="condition" value="Used" /> Used</p>
                    <br>
				</td>
			</tr>
			<tr>
				<td>
					Playstation Version:
				</td>
				<td>
					<p><input type="radio" name="version" value="Playstation 1" /> Playstation 1</p>
					<p><input type="radio" name="version" value="Playstation 2" /> Playstation 2</p>
					<p><input type="radio" name="version" value="Playstation 3" /> Playstation 3</p>
                    <p><input type="radio" name="version" value="Playstation 4" /> Playstation 4</p>
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" />		
		</div>
		</form>
</body>
</html>
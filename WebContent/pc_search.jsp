<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
	<h1>Enter details about your PC game:</h1>
		<form action="pc_search_result.jsp" method = "post">
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
				</td>
			</tr>
			<tr>
				<td>
					Minimum CPU:
				</td>
				<td>
					<input type="text" name="cpureq" />
				</td>
			</tr>
			<tr>
				<td>
					Ram Requirement:
				</td>
				<td>
					<input type="textarea" name="ramreq" /> GB
				</td>
			</tr>
			<tr>
				<td>
					HDD Space Requirement:
				</td>
				<td>
					<input type="textarea" name="hddreq" /> GB
				</td>
			</tr>
			<!--<tr>
				<td>
					Minimum Graphics:
				</td>
				<td>
					<input type="textarea" name="gfxreq" />
				</td>
			</tr>!-->
			<tr>
				<td>
					Operating System:
				</td>
				<td>
					<p><input type="radio" name="os" value="Windows" /> Windows</p>
					<p><input type="radio" name="os" value="Mac" /> Mac</p>
					<p><input type="radio" name="os" value="Linux" /> Linux</p>
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" />		
		</div>
		</form>
</body>
</html>
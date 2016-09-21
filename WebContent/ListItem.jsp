<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Tell Us About Your Item:</h1>
		<form action="insertItem.jsp" method = "post">
		<table align="center" style="margin-top:5%; text-align:left;">
			<tr>
				<td>
					Item Name:
				</td>
				<td>
					<input type="text" name="iname" />
				</td>
			</tr>
			<tr>
				<td>
					Description:
				</td>
				<td>
					<textarea rows="5" cols="50" name="desc"></textarea>
					<!--  <input type="textarea" name="desc" /> -->
				</td>
			</tr>
			<tr>
				<td>
					Condition:
				</td>
				<td>
					<h4>Brand New</h4><input type="radio" name="cond" value="Brand New"/>
					<h4>Like New</h4><input type="radio" name="cond" value="Like New"/>
					<h4>Used</h4><input type="radio" name="cond" value="Used"/>
				</td>
			</tr>
			<tr>
				<td>
					Type of Game:
				</td>
				<td>
					<h5>Xbox One</h5><input type="radio" name="type" value="Xbox One" />
					<h5>Xbox 360</h5><input type="radio" name="type" value="Xbox 360" />
					<h5>Xbox</h5><input type="radio" name="type" value="Xbox" />
					
					<h5>Playstation 1</h5><input type="radio" name="type" value="Playstation 1" />
					<h5>Playstation 2</h5><input type="radio" name="type" value="Playstation 2" />					
					<h5>Playstation 3</h5><input type="radio" name="type" value="Playstation 3" />
					<h5>Playstation 4</h5><input type="radio" name="type" value="Playstation 4" />
					
					<h5>PC</h5><input type="radio" name="type" value="PC"/>
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" />		
		</div>
	</form>
</body>
</html>
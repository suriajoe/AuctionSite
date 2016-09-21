<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Questions</title>
</head>
<body>
	<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Post your Questions </h1>
	<form action = "insertQuestions.jsp" method = "post">
		<table align="center" style="margin-top:5%; text-align:left;"> 
			<tr>
			<td>
				Title:
			</td>
			</tr>
			<tr>
			<td>
				<input type = "text" name = "title" />
			</td>
			</tr>
			<tr>
			<td>
				Question:
			</td>
			</tr>
			<tr>
			<td>
				<textarea name="ques" cols="35" rows="10"></textarea>
			</tr>
		</table>
		<div style="text-align:center; margin:10%">
		<input type = "submit" />
		</div>
	</form>
	<%-- 
	<a href="indexloggedOn.jsp" style="text-align:center; margin:0%"> 
	<button>Home</button>
	</a>
	--%> 
</body>
</html>
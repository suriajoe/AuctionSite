<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Rep Answer</title>
</head>
<body>
	<h2 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Respond to the following question </h2>
	<%
		//ApplicationDAO dao = new ApplicationDAO();
	
		String title = (String)request.getParameter("t");
		String ques = (String)request.getParameter("q");
		int tid = Integer.parseInt(request.getParameter("ticket"));
		
		session.setAttribute("title",title);
		session.setAttribute("ques",ques);
		session.setAttribute("tid",tid);
		
		//int tid = 0;
		//tid = Integer.parseInt(objTid.trim());
	%>
		<p style = 'text-align:center; font-family:Sans-serif; font-size:14px; '>
		<b> Title: <%= title%> </b> </p>
		<p style = 'text-align:center; font-family:Sans-serif; font-size:12px;'>
		Question: <%= ques%></p>
		<p style = 'text-align:center; font-family:Sans-serif; font-size:12px;'>
		Ticket_id: <%= tid%></p>
		
	<form action = "insertAnswer.jsp" method = "post">	
		<table align="center" style="margin-top:5%; text-align:left;"> 
			<tr>
			<td>
				Answer:
			</td>
			</tr>
			<tr>
			<td>
				<textarea name="ans" cols="35" rows="10"></textarea>
			</tr>
		</table>
		<div style="text-align:center; margin:10%">
		<input type = "submit" />
		</div>
	</form>
</body>
</html>
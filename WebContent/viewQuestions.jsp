<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AuctionSite | Your Questions</title>
</head>
<body>
	<h2 style='text-align:center; font-family:Sans-serif; font-size:30px; text-decoration:underline; margin:5%;'>Your Questions</h2>
	
	<%
		ApplicationDAO dao = new ApplicationDAO();
	
		String sessEmail = (String)session.getAttribute("email");
		int qTid = 0;
		int aTid = 0;
		
		LinkedList<Question> q = dao.getQuestion();
		LinkedList<Answer> a = dao.getAnswer();

		for(int i = q.size()-1; i >= 0; i--){		
			
			if(sessEmail.equals(q.get(i).getEmail()))
			{	//display title and question
				//store question ticket_id
				qTid = q.get(i).getTid();
			%>
				<h3 style = 'text-align:center; font-family:Sans-serif; font-size:30px; '>
				Title: <%= q.get(i).getTitle() %></h3>
				<p style = 'text-align:center; font-family:Sans-serif; font-size:20px;'>
				Question: <%= q.get(i).getQuestion() %></p>
			<% 	
				for(int j = a.size()-1; j>=0; j--){
					//store answer ticket_id
					aTid = a.get(j).getTid();
					
					//if both tables have the same tid, then question is answered
					if(qTid == aTid)
					{
					%>	
						<p style = 'text-align:center; font-family:Sans-serif; font-size:20px;'>
						Answer: <%= a.get(j).getAnswer() %></p>
					<%
					}				
				}
			%>
				<hr width="50%"/>
			<%
			}
		}
		
	%>
	
	<%
	String admin = (String)session.getAttribute("admin?");
	String rep = (String)session.getAttribute("rep?");
	
	if(admin != null || rep != null){
	if(admin.equals("yes")){
		%>
		<div style="text-align:center;">
			<a href="indexAdmin.jsp" style="text-decoration:none;">
				<button style="margin:10px;">Home</button>
			</a>
		</div>
		<%
	}
	
	else if(rep.equals("yes")){
		%>
		<div style="text-align:center;">
			<a href="indexRep.jsp" style="text-decoration:none;">
				<button style="margin:10px;">Home</button>
			</a>
		</div>
		<%
	}
	else {
		%>
		<div style="text-align:center;">
			<a href="indexLoggedOn.jsp" style="text-decoration:none;">
				<button style="margin:10px;">Home</button>
			</a>
		</div>
		<%
	}
	}
	
%>
</body>
</html>
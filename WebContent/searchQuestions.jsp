<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AuctionSite | Search For All Questions</title>
</head>
<body>
	<h2 style='text-align:center; font-family:Sans-serif; font-size:30px; text-decoration:none;
	    margin:5%;'>Search Questions</h2>
		
<div style="text-align:center;">
	<a href="indexLoggedOn.jsp" style="text-decoration:none;">
		<button style="margin:10px;">Home</button>
	</a>
</div>
   
<div id="search-bar" style="text-align:center; margin-top: 5%; margin-bottom:5%;">

	<form action="searchQuestions.jsp">
		<input type="text" name="searchQues" placeholder="Search Here">
		<input type="submit" value="Search!">
	</form>
</div>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String search = request.getParameter("searchQues");
		int sqTid;
		int aTid;
		
		if(search == null)
		{
			search = "";
		}
		else if(search == "")
		{
			search = search;
		}
		else
		{
			LinkedList<Question> sq = dao.questionSearch(search);
			LinkedList<Answer> a = dao.getAnswer();
		
			for(int i = 0; i <= sq.size()-1; i++){
				
				sqTid = sq.get(i).getTid();
				%>
				<h3 style = 'text-align:center; font-family:Sans-serif; font-size:30px; '>
				Title: <%= sq.get(i).getTitle() %></h3>
				<p style = 'text-align:center; font-family:Sans-serif; font-size:20px;'>
				Question: <%= sq.get(i).getQuestion() %></p>
			<%
				for(int j = 0;j <= a.size()-1; j++){
					//store answer ticket_id
					aTid = a.get(j).getTid();
				
					//if both tables have the same tid, then question is answered
					if(sqTid == aTid)
					{
					%>	
						<p style = 'text-align:center; font-family:Sans-serif; font-size:20px;'>
						Answer: <%= a.get(j).getAnswer() %></p>
					<%
					}
					 
				}
			}
		}

	%>

</body>
</html>
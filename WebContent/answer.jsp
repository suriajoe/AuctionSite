<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Questions</title>
<style>
hr{
	display:block;
	margin-top:0.5em;
	margin-bottom:0.5em;
	margin-left: auto;
	margin-right: auto;
	border-style: inset;
	border-width: 2px;
}
</style>
</head>

<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
	
		String rep = (String)session.getAttribute("rep?");
		
		//String title;
		//String ques;
		Integer tid;
		Integer atid;
		
		if(rep != null)
		{
			if(rep.equals("no"))
			{
		        response.sendRedirect("error.jsp");
			}
		}
		else if(rep == null)
			response.sendRedirect("error.jsp");
				
		LinkedList<Question> q = dao.getQuestion();
		LinkedList<Answer> a = dao.getAnswer();
		
		ArrayList<Integer> tidArray = new ArrayList<Integer>();
		
		//Store the answer ticket_id in array to compare with question ticket_id
		for(int j = 0;j <= a.size()-1;j++)
		{
			atid = (Integer)a.get(j).getTid();
			tidArray.add(j, atid);
		}

		for(int i = 0; i <= q.size()-1; i++){
		
			//title = (String)q.get(i).getTitle();
			//ques = (String)q.get(i).getQuestion();
			tid = (Integer)q.get(i).getTid();

				//if the question tid does not exist in answer tid record, then post question
				if(tidArray.indexOf(tid) == -1)
				{
					%>
					<p style = 'text-align:left-align; font-family:Sans-serif; font-size:14px; '>
					<b> Title: <%= q.get(i).getTitle()%> </b> </p>
					<p style = 'text-align:left-align; font-family:Sans-serif; font-size:12px;'>
					Question: <%= q.get(i).getQuestion() %></p>
					<p style = 'text-align:left-align; font-family:Sans-serif; font-size:12px;'>
					Ticket_id: <%= q.get(i).getTid() %></p>
						
							 				
					<a href="ansResponse.jsp?t=<%= q.get(i).getTitle()%>&q=<%= q.get(i).getQuestion()%>&ticket=<%= tid%>" style="text-align:left; margin:0%"> 
					<button>respond</button>
					</a>
				
					<hr>		
					<%
				}
		}		
	%>

</body>
</html>
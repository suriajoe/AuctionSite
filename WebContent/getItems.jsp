<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site | Your Items</title>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String email = (String)session.getAttribute("email");
		String title = request.getParameter("iname");
		String desc = request.getParameter("desc");
		String condition = request.getParameter("cond");
		String version = request.getParameter("version");
	
		dao.insertConsoleItem(email, title, desc, condition, version);
		LinkedList<ConsItem> p = dao.getPlaystation();
		
		for(int i=0; i.size(); i++){
			%> 
			<%= p.get(i).getItemName() %>
			<%
		}
	
	
	
	%>

</body>
</html>
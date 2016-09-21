<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
	<h1 style="text-align:center; font-family:sans-serif;">Xbox Games On Auction:</h1>
<%
		ApplicationDAO dao = new ApplicationDAO();
		String title = request.getParameter("title");
		String version = request.getParameter("version");
		String cond = request.getParameter("condition");
	
		LinkedList<Auction> auc = dao.getAllAuctions();
		LinkedList<ConsItem> psResult = dao.getXboxSearchResult(title, version, cond);
		
		for(int j = 0; j <auc.size(); j++){
			for(int i=0; i<psResult.size(); i++){
				if(auc.get(j).getItemId() == psResult.get(i).getId()){
			%>
				<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= psResult.get(i).getName() %></h3>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= psResult.get(i).getVersion() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= psResult.get(i).getCond() %></p>
				<div style="text-align:center;">
				<form action="printXBAuction.jsp" method = "post">
					<input type="hidden" name="aid" value="<%= auc.get(j).getAuctionId() %>"> 
					<input type="submit" value="Go To Auction">
				</form>
				</div>
				<hr width="50%"/>
			<%
				}
			}
		}
	
	%>

</body>
</html>
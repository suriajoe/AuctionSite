<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction</title>
</head>
<body>
		<%
			ApplicationDAO dao = new ApplicationDAO();
			
			String auctID = request.getParameter("aid");
			int ID = Integer.parseInt(auctID);
			
			LinkedList<Auction> auc = dao.getAllAuctions();
			
			for(int i=0; i<auc.size(); i++){
				if(auc.get(i).getAuctionId() == ID){
					%>
					
					<%
					
				}
			}
		%>
</body>
</html>
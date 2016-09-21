<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
<%
		ApplicationDAO dao = new ApplicationDAO();

		int res;
		int aw;

		String email = (String)session.getAttribute("email");
		String reserve = request.getParameter("minprice");
		String autowin = request.getParameter("autowin");
		String itemName = request.getParameter("sellitem");
		
		
		if(reserve.equals("")){
			res = 0;
		}
		else{
			res = Integer.parseInt(reserve);
		}
		
		aw = Integer.parseInt(autowin);
		
		
		
		//Get the timestamp
		java.sql.Timestamp timeOpen = dao.getThaTimestamp();
		java.sql.Timestamp timeClose = dao.getNextWeek(); 		
 		
		 
 		dao.insertAuction(email, res, aw, timeOpen, timeClose);
 		response.sendRedirect("auctionSUCC.jsp");
						
		
%>
</body>
</html>
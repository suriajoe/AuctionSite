<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successful Bid</title>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String email = (String)session.getAttribute("email");
		String amount = request.getParameter("bidamount");
		String secret = request.getParameter("secret");
		String aucID = request.getParameter("aid");
		
		dao.insertBid(aucID, amount, secret, email);
		Bid bid = dao.addNewBid(aucID, amount, secret, email);
		Bid compHigh = dao.getHighestBid(aucID);
		
		if(compHigh == null){
			%><h3 style="font-family:sans-serif; text-align:center;">You are the first bid!</h3><%	
		}
		else{
			%><h3 style="font-family:sans-serif; text-align:center;">Your bid has been placed!</h3><%	
		}
	
	
	
	
	
	%>
</body>
</html>
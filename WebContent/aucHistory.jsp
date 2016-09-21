<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div style="color:#1a1a1a; 
			text-align:center; 
			margin: 15px;
			margin-top: 15%;
			">
			<p style="font-family:Sans-serif; font-size:30px"><b>List of auctions that have ended</b></p>
</div>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		LinkedList<Auction> a = dao.getAuctions();
		LinkedList<Item> j = dao.getYourItems();
		LinkedList<Bid> b = dao.getBids();
		
		for(int i=0 ; i<a.size(); i++){
			for(int e=0; e<j.size(); e++){
				for(int r=0; r<b.size(); r++){
					if((a.get(i).getTime() != null) 
							&& (j.get(e).getId() == a.get(i).getItemID()) 
							&& (a.get(i).getId() == b.get(r).getAuctionID())){
						%>
						<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= j.get(e).getItemName() %></h3>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Time Ended: <%= a.get(i).getTime() %></p>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Auction Winner: <%= a.get(i).getWinner() %></p>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Price Sold For: <%= b.get(r).getAmount() %></p>
						<hr width="50%"/>
						<%
					}
				}
			}
		}
	
	
	%>
</body>
</html>
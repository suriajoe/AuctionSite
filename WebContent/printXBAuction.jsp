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
			int highestB = 0;

			
			LinkedList<Auction> auc = dao.getAllAuctions();
			LinkedList<ConsItem> ps = dao.getXbox();
			Bid highest = dao.getHighestBid(auctID);
			if(highest==null){
				highestB = 0;
			}
			else{
				highestB = highest.getAmount();
			}
			
			
			for(int i=0; i<auc.size(); i++){
				for(int j=0; j<ps.size(); j++){
					if(auc.get(i).getAuctionId() == ID && ps.get(j).getId() == auc.get(i).getItemId()){
						%>
						<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= ps.get(j).getName() %></h3>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Description: <%= ps.get(j).getDesc() %></p>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= ps.get(j).getVersion() %></p>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= ps.get(j).getCond() %></p>
						<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Current Highest Bid: $<%= highestB %></p>
						<div style="text-align:center;">
						<form action="enterBid.jsp">
							<h3 style="text-align:center; font-family:Sans-serif">Enter your bidding limit $</h3><input type="text" name="secret"> 
							<h3 style="text-align:center; font-family:Sans-serif">Enter your bid: $</h3><input type="text" name="bidamount">  
							<input type="hidden" value="<%= auc.get(i).getAuctionId() %>" name="aid">
							<input type="submit" value="BID!">
						</form>
						</div>
						<%
					}
				}
			}
		%>
</body>
</html>
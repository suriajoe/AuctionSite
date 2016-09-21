<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site | Sort Items</title>
</head>
<body>
	<h3 style='text-align:center; font-family:Sans-serif; font-size:30px; text-decoration:none;
	    margin:5%;'>Click the box to sort Items</h3>
		
<div style="text-align:center;">
	<a href="indexLoggedOn.jsp" style="text-decoration:none;">
		<button style="margin:10px;">Home</button>
	</a>
</div>

<Form Action="sortedItems.jsp" Method="post">
	<select name="Games">
		<option value="PS">PS Games</option>
		<option value="Xbox">Xbox Games</option>
		<option value="PC">PC Games</option>
		<option value="new">Brand new</option>
		<option value="good">Like new</option>
		<option value="old">Used</option>
	</select>
	<input type="submit">
</Form>
<%
	ApplicationDAO dao = new ApplicationDAO();
	
	LinkedList<Auction> auc = dao.getAllAuctions();
	LinkedList<ConsItem> ps = dao.getPlaystation();
	LinkedList<ConsItem> xb = dao.getXbox();
	LinkedList<PCItem> pc = dao.getAllPC();
	
	String select = request.getParameter("Games");
	if(select == null)
	{
		select = "";
	}

    if(select.equals("PS"))
	{
	  for(int i=0; i<auc.size(); i++){
		for(int j=0; j<ps.size(); j++){
			if(ps.get(j).getId() == auc.get(i).getItemId())
			{
				%>
				<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= ps.get(j).getItemName() %></h3>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= ps.get(j).getVersion() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= ps.get(j).getCondition() %></p>
				<div style="text-align:center;">
				<form action="printPSAuction.jsp" method = "post">
					<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
					<input type="submit" value="Go To Auction">
				</form>
				</div>
				<hr width="50%"/>
				<% 
			}
		}
	  }
	}
	else if(select.equals("Xbox"))
	{
	  for(int i=0; i<auc.size(); i++){
		for(int j=0; j<xb.size(); j++){
			if(xb.get(j).getId() == auc.get(i).getItemId())
			{
				%>
				<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= xb.get(j).getItemName() %></h3>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= xb.get(j).getVersion() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= xb.get(j).getCondition() %></p>
				<div style="text-align:center;">
				<form action="printXbAuction.jsp" method = "post">
					<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
					<input type="submit" value="Go To Auction">
				</form>
				</div>
				<hr width="50%"/>
				<% 
			}
		  }
	   }
	}
	else if(select.equals("PC"))
	{
		for(int i=0; i<auc.size(); i++){
			for(int j=0; j<pc.size(); j++){
				if(pc.get(j).getId() == auc.get(i).getItemId())
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= pc.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>CPU Minimum: <%= pc.get(j).getCPU() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Graphics Requirement: <%= pc.get(j).getGfx() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>OS: <%= pc.get(j).getOS() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= pc.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPCAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
		}
	}
    
	else if(select.equals("new"))
    {
		for(int i=0; i<auc.size(); i++){
			for(int j=0; j<pc.size(); j++){
				if(pc.get(j).getId() == auc.get(i).getItemId() && (pc.get(j).getCondition()).equals("Brand New"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= pc.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>CPU Minimum: <%= pc.get(j).getCPU() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Graphics Requirement: <%= pc.get(j).getGfx() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>OS: <%= pc.get(j).getOS() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= pc.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPCAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
			for(int j=0; j<xb.size(); j++){
				if(xb.get(j).getId() == auc.get(i).getItemId() && (xb.get(j).getCondition()).equals("Brand new"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= xb.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= xb.get(j).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= xb.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printXBAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
			for(int j=0; j<ps.size(); j++){
				if(ps.get(j).getId() == auc.get(i).getItemId() && (ps.get(j).getCondition()).equals("Brand new"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= ps.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= ps.get(j).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= ps.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPSAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
		}
    }
	else if(select.equals("good"))
    {
		for(int i=0; i<auc.size(); i++){
			for(int j=0; j<pc.size(); j++){
				if(pc.get(j).getId() == auc.get(i).getItemId() && (pc.get(j).getCondition()).equals("Like New"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= pc.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>CPU Minimum: <%= pc.get(j).getCPU() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Graphics Requirement: <%= pc.get(j).getGfx() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>OS: <%= pc.get(j).getOS() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= pc.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPCAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
			for(int j=0; j<xb.size(); j++){
				if(xb.get(j).getId() == auc.get(i).getItemId() && (xb.get(j).getCondition()).equals("Like New"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= xb.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= xb.get(j).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= xb.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printXBAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
			for(int j=0; j<ps.size(); j++){
				if(ps.get(j).getId() == auc.get(i).getItemId() && (ps.get(j).getCondition()).equals("Like New"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= ps.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= ps.get(j).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= ps.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPSAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
		}
    }
	else if(select.equals("old"))
    {
		for(int i=0; i<auc.size(); i++){
			for(int j=0; j<pc.size(); j++){
				if(pc.get(j).getId() == auc.get(i).getItemId() && (pc.get(j).getCondition()).equals("Used"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= pc.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>CPU Minimum: <%= pc.get(j).getCPU() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Graphics Requirement: <%= pc.get(j).getGfx() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>OS: <%= pc.get(j).getOS() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= pc.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPCAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
			for(int j=0; j<xb.size(); j++){
				if(xb.get(j).getId() == auc.get(i).getItemId() && (xb.get(j).getCondition()).equals("Used"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= xb.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= xb.get(j).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= xb.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printXBAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
			for(int j=0; j<ps.size(); j++){
				if(ps.get(j).getId() == auc.get(i).getItemId() && (ps.get(j).getCondition()).equals("Used"))
				{
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= ps.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= ps.get(j).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= ps.get(j).getCondition() %></p>
					<div style="text-align:center;">
					<form action="printPSAuction.jsp" method = "post">
						<input type="hidden" name="aid" value="<%= auc.get(i).getAuctionId() %>"> 
						<input type="submit" value="Go To Auction">
					</form>
					</div>
					<hr width="50%"/>
					<% 
				}
			}
		}
    }
	
%>


</body>
</html>
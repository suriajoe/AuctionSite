<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site</title>
</head>
<body>
	<h1 style="font-family:sans-serif; text-align:center;">PC Games On Auction:</h1>
<%
		ApplicationDAO dao = new ApplicationDAO();
		String title = request.getParameter("title");
		String cond = request.getParameter("condition");
		
		String cpu = request.getParameter("cpureq");
		String ram = request.getParameter("ramreq");
		String hdd = request.getParameter("hddreq");
		String os = request.getParameter("os");
	
		
		LinkedList<Auction> auc = dao.getAllAuctions();
		LinkedList<PCItem> psResult = dao.getPcSearchResult(title, cond, cpu, ram, hdd, os);
		
		for(int j = 0; j <auc.size(); j++){
			for(int i=0; i<psResult.size(); i++){
				if(auc.get(j).getItemId() == psResult.get(i).getId()){
			%>
				<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= psResult.get(i).getName() %></h3>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= psResult.get(i).getCond() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= psResult.get(i).getCPU() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= psResult.get(i).getRAM() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= psResult.get(i).getHDD() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>OS: <%= psResult.get(i).getOS() %></p>
				<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>OS: <%= psResult.get(i).getID() %></p>
				<div style="text-align:center;">
				<form action="printPCAuction.jsp" method = "post">
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
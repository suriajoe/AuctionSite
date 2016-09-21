<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site | Your Items</title>
</head>
<body>

	<h2 style='text-align:center; font-family:Sans-serif; font-size:30px; text-decoration:underline; margin:5%;'>Your Items</h2>	

	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String seshEmail = (String)session.getAttribute("email");
		
		LinkedList<Item> i = dao.getYourItems();
		LinkedList<ConsItem> x = dao.getXbox();
		LinkedList<ConsItem> pl = dao.getPlaystation();
		LinkedList<PCItem> p = dao.getAllPC();
		
		
		for(int j = i.size()-1; j >= 0; j--){
			
			if(seshEmail.equals(i.get(j).getEmail())){
				//CHECK XBOX
				for(int f=0; f<x.size(); f++){
					
					if(x.get(f).getId() == i.get(j).getId()){
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= i.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= x.get(f).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'> <%= i.get(j).getDesc() %></p>
					<br>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= i.get(j).getCond() %></p>
					<hr width="50%"/>
					<%
					}
				}
				//CHECK PS
				for(int f=0; f<pl.size(); f++){
					
					if(pl.get(f).getId() == i.get(j).getId()){
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= i.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: <%= pl.get(f).getVersion() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'> <%= i.get(j).getDesc() %></p>
					<br>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= i.get(j).getCond() %></p>
					<hr width="50%"/>
					<%
					}
				}
				//CHECK PC
				for(int f=0; f<p.size(); f++){
					
					if(p.get(f).getId() == i.get(j).getId()){
					%>
					<h3 style='text-align:center; font-family:Sans-serif; font-size:30px;'>Game: <%= i.get(j).getItemName() %></h3>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>System: PC</p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'> <%= i.get(j).getDesc() %></p>
					<br>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Condition: <%= i.get(j).getCond() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Minimum CPU: <%= p.get(f).getCPU() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Minimum RAM: <%= p.get(f).getRAM() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Required Storage: <%= p.get(f).getHDD() %> GB</p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Minimum Graphics: <%= p.get(f).getGfx() %></p>
					<p style='text-align:center; font-family:Sans-serif; font-size:20px;'>Supported OS: <%= p.get(f).getOS() %></p>
					
					<hr width="50%"/>
					<%
					}
				}
				
			}
		}
	
	%>
	
	<%
	String admin = (String)session.getAttribute("admin?");
	String rep = (String)session.getAttribute("rep?");
	
	if(admin != null || rep != null){
	if(admin.equals("yes")){
		%>
		<div style="text-align:center;">
			<a href="indexAdmin.jsp" style="text-decoration:none;">
				<button style="margin:10px;">Home</button>
			</a>
		</div>
		<%
	}
	
	else if(rep.equals("yes")){
		%>
		<div style="text-align:center;">
			<a href="indexRep.jsp" style="text-decoration:none;">
				<button style="margin:10px;">Home</button>
			</a>
		</div>
		<%
	}
	else {
		%>
		<div style="text-align:center;">
			<a href="indexLoggedOn.jsp" style="text-decoration:none;">
				<button style="margin:10px;">Home</button>
			</a>
		</div>
		<%
	}
	}
	
%>
</body>
</html>
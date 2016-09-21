<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String name = request.getParameter("iname");
		String desc = request.getParameter("desc");
		String cond = request.getParameter("cond");
		String version = request.getParameter("type");
		
		String email = (String)session.getAttribute("email");
		
		if(cond.equals("Brand New")){
			
			if(version.equals("PC")){
				dao.insertConsoleItem(email, name, desc, cond, "PC", "PC");
				response.sendRedirect("insertPC.jsp");
			}
			
			if(version.equals("Playstation 3")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 4")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 2")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 1")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox 360")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox One")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			else{
				%><h1>Please Select A Gaming Platform</h1><%
			}
			
		}
		else if(cond.equals("Like New")){
			
			if(version.equals("PC")){
				dao.insertConsoleItem(email, name, desc, cond, "PC", "PC");
				response.sendRedirect("insertPC.jsp");
			}
			
			if(version.equals("Playstation 3")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 4")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 2")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 1")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox 360")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox One")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			else{
				%><h1>Please Select A Gaming Platform</h1><%
			}
			
			
		}
		else if(cond.equals("Used")){
			
			if(version.equals("PC")){
				dao.insertConsoleItem(email, name, desc, cond, "PC", "PC");
				response.sendRedirect("insertPC.jsp");
			}
			
			if(version.equals("Playstation 3")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 4")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 2")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Playstation 1")){
				dao.insertConsoleItem(email, name, desc, cond, "Playstation", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox 360")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox One")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			if(version.equals("Xbox")){
				dao.insertConsoleItem(email, name, desc, cond, "Xbox", version);
				response.sendRedirect("itemInsertSUCC.jsp");
			}
			
			else{
				%><h1>Please Select A Gaming Platform</h1><%
			}
			
			
		}
		else{
			%><h1>Please Select Your Item's Condition</h1><%

		}
	
			
	
	%>

</body>
</html>
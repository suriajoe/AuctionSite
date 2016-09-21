<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
	
		String email = (String)session.getAttribute("email");
	
		String name = request.getParameter("iname");
		String condition = request.getParameter("cond");
		String cpu = request.getParameter("cpureq");
		String ram = request.getParameter("ramreq");
		String hdd = request.getParameter("hddreq");
		String grafx = request.getParameter("gfxreq");
		String os = request.getParameter("os");
		
		if(!cpu.equals("") && !ram.equals("") && !hdd.equals("") && !grafx.equals("") && !os.equals("")){
			dao.insertPCItem(cpu, ram, hdd, grafx, os, email, title, condition);
			response.sendRedirect("itemInsertSUCC.jsp");
		}
		else
		{
			%><h2>Please enter all the details</h2><%
		}
	
	
	
	
	
	
	%>
</body>
</html>
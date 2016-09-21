<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		
		String repemail = request.getParameter("repemail");
		boolean itsIn = false;
		
		LinkedList<Person> p = dao.getAllPeople();
		//THE CHECK IN THE ACCOUNTS TABLE
		
		for(int i=0; i<p.size();i++){
			if(p.get(i).getEmail().equals(repemail) && !repemail.equals("")){
				dao.insertRep(repemail);
				response.sendRedirect("AccCreateSucc.jsp");
				itsIn = true;
			}
		}
			
		if(!itsIn)
			response.sendRedirect("insertNewCusRep.jsp");
	
	
	
	%>
</body>
</html>
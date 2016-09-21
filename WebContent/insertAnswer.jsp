<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"  import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	ApplicationDAO dao = new ApplicationDAO();
	
	Integer tid = (Integer) session.getAttribute("tid");
	String ans = (String)request.getParameter("ans");
	String email = (String)session.getAttribute("email");
	
	if(ans != null)
	{
		dao.insertAnswer(email,tid,ans);
		response.sendRedirect("indexRep.jsp");
	}
    else{
        response.sendRedirect("error.jsp");
     }	
	
%>	
</body>
</html>
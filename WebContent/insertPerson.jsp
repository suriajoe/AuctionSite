<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	ApplicationDAO dao = new ApplicationDAO();
	String firstname = request.getParameter("fname");
	String lastname = request.getParameter("lname");
	//String accountID = request.getParameter("accid");
	String password = request.getParameter("pass");
	String email = request.getParameter("email");
	String admin = request.getParameter("admin");
	
	String adminSesh = (String)session.getAttribute("admin?");

	if(!firstname.equals("") && !lastname.equals("") && !password.equals("") && !email.equals("")){
		dao.insertPerson(lastname, firstname, password, email);
		if(admin != null){
			if(admin.equals("yes")){
				dao.insertAdmin(email);
			}
		}
		
	}else if(firstname.equals("") || lastname.equals("") || password.equals("") || email.equals("")){
		response.sendRedirect("error.jsp");
	}
	
	
	if(adminSesh != null){
		if(adminSesh.equals("yes")){
			dao.insertRep(email);
		}
	}
	
	response.sendRedirect("AccCreateSucc.jsp");

	
%>			
</body>
</html>
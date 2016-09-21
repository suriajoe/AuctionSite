<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	ApplicationDAO dao = new ApplicationDAO();
			
		String YasEmail = "";
		String YasPass = "";
		String FN = "";
		
		boolean admin = false;
		boolean rep = false;
		
		String email = request.getParameter("email");
		String password = request.getParameter("pass");		
	
		LinkedList<Person> p = dao.getAllPeople();
		LinkedList<String> e = dao.getAllAdmins();
		LinkedList<String> c = dao.getAllReps();
		
		for(int i = 0; i < p.size(); i++){

			if(email.equals(p.get(i).getEmail())){
				YasEmail = p.get(i).getEmail();
				if(password.equals(p.get(i).getPassword())){
					YasPass = p.get(i).getPassword();
					FN = p.get(i).getFirstName();
				}
			}
		}			
		
		
		if(YasEmail.equals(email) && YasPass.equals(password) && !YasEmail.equals("") && !YasPass.equals("") && !FN.equals("")){
			//ADMIN CHECK
			for(int i = 0; i < e.size(); i++){
				if(email.equals(e.get(i))){
					session.setAttribute("email", email);
					session.setAttribute("first_name", FN);
					session.setAttribute("admin?", "yes");
					session.setAttribute("rep?", "no");
					admin = true;
					response.sendRedirect("indexAdmin.jsp");
				}
		
			}
			
			//REP CHECK
			for(int i = 0; i < c.size(); i++){
				if(email.equals(c.get(i))){
					session.setAttribute("email", email);
					session.setAttribute("first_name", FN);
					session.setAttribute("admin?", "no");
					session.setAttribute("rep?", "yes");
					rep = true;
					response.sendRedirect("indexRep.jsp");
				}
	
			}
			
			//IF NOT ADMIN AND NOT REP, REGuLAR USER
			if(!admin && !rep){
				session.setAttribute("first_name", FN);
				session.setAttribute("email", YasEmail);
				session.setAttribute("admin?", "no");
				session.setAttribute("rep?", "no");
				response.sendRedirect("indexLoggedOn.jsp");			
			}
		}
		else{
			response.sendRedirect("error.jsp");
		}
	
	%> 
		
	
</body>
</html>
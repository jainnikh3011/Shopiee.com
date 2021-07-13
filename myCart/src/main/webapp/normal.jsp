<%@ page import="com.entities.*"%>
<% 
	//checking if someone already logged in 
	User user =(User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","You Are Not Logged In!! Login First");
		response.sendRedirect("login.jsp");
		
		return;
		
	}
	else{
		// check if he/she is admin or not 
		if(!(user.getUserType().equals("normal"))){
			session.setAttribute("message","You Are Not A User!! Can't Access This Page");
			response.sendRedirect("login.jsp");
			
			return;
		}
		
	}
	




%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Panel</title>

<%@include file="components/common_css_js.jsp" %>
</head>
<body>

<%@include file="components/navbar.jsp" %>
<h1>This is normal user Panel</h1>

<%@include file="components/common_modals.jsp"%>
</body>
</html>
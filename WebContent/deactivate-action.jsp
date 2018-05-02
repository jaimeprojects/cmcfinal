<%@ page language="java" import="controller.*, entity.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Deactivate</title>
</head>
<body>
	<%
	
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	String username = request.getParameter("us");
	
	String[] user = dbc.getUser(username);
	String p = user[3];
	String f = user[0];
	String l = user[1];
	String t = user[4];
	String s = user[5];
	AdminFunctionalityController afc = new AdminFunctionalityController();
	Account a = new Account(f,l,username,p,t.charAt(0), s.charAt(0));
	afc.deactivate(a);
	response.sendRedirect("admin-home.jsp"); 
	%>
</body>
</html>
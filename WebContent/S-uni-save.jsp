<%@page language="java" import="controller.*, interaction.*, entity.*, java.util.*"%>
<%
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	Account currentUser = (Account)session.getAttribute("currentUser");
	String uniName = request.getParameter("schoolName");
	
	dbc.saveUniversity(currentUser.getUsername(), uniName);
	response.sendRedirect("user-home.jsp");

%>
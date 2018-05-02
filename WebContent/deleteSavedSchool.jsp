<%@page language="java" import="controller.*,java.util.*"%>

<%
    //out.println("delete user : " + request.getParameter("Username"));

	String uni = request.getParameter("schoolName");
	String us = request.getParameter("userName");

	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");

	dbc.deleteSavedSchool(us, uni);
	
	response.sendRedirect("user-home.jsp");
%>
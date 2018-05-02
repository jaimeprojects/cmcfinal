<%@page language="java" import="controller.*,java.util.*"%>

<%
    //out.println("delete user : " + request.getParameter("Username"));

	String uni = request.getParameter("schoolName");

	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");

	dbc.deleteUniversity(uni);
	
	response.sendRedirect("admin-home.jsp");
%>
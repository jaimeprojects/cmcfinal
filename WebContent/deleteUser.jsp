<%@page language="java" import="controller.*,java.util.*"%>

<%
    //out.println("delete user : " + request.getParameter("Username"));

	String un = request.getParameter("userName");

	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");

	dbc.deleteUser(un);
	
	response.sendRedirect("admin-home.jsp");
%>
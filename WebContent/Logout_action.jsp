<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page language="java" import="controller.*, interaction.*,java.util.ArrayList, entity.*"%>

    <%
    String u = request.getParameter("u");
	String p = request.getParameter("Password");
	
	Account currentUser = (Account)session.getAttribute("currentUser");
	AccountController ac = (AccountController)session.getAttribute("ac");
	ac.logout();
	currentUser.logOut();
	session.invalidate();
		
	response.sendRedirect("index.jsp");
    %>
    
    
    
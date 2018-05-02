<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="controller.*, interaction.*, entity.*"%>

<% 	String u = request.getParameter("userName");
	String p = request.getParameter("pwd");

	AccountController ac = (AccountController)session.getAttribute("ac");
	Account currentUser = (Account)session.getAttribute("currentUser");
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	AdminFunctionalityController afc = (AdminFunctionalityController)session.getAttribute("afc");
	String[] student = dbc.getUser(u);
	
	String fn = request.getParameter("fn");
	String ln = request.getParameter("ln");
	String pass = request.getParameter("pwd");
	char status;
	char type;
	
	if(fn ==null && ln.equals("") && pass.equals("") && request.getParameter("at").equals("") && request.getParameter("as").equals("")){
		
		response.sendRedirect("admin-home.jsp");
	}
	else{
		String t = request.getParameter("at");
		String s = request.getParameter("as");
		
		
		if(fn.equals("")){
			fn = student[0];
		}
		if(ln.equals("")){
			ln = student[1];
		}
		if(pass.equals("")){
			pass = student[3];
		}
		if(t.equals(""))
		{
			type = student[4].charAt(0);
		}
		else
		{
			type = t.charAt(0);
		}
		
		if(s.equals(""))
		{
			status = student[5].charAt(0);
		}
		else
		{
			status= s.charAt(0);
		}
		afc.editUser(u,fn,ln,pass,type,status);
		response.sendRedirect("admin-home.jsp");
	}
	
	%>
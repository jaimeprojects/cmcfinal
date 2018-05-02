
<%@page language="java" import="controller.*, interaction.*, entity.*"%>

<% 	String u = request.getParameter("userName");
	String p = request.getParameter("Password");

	AccountController ac = (AccountController)session.getAttribute("ac");
	Account currentUser = (Account)session.getAttribute("currentUser");
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	StudentFunctionalityController sfc = (StudentFunctionalityController)session.getAttribute("sfc");
	String[] student = dbc.getUser(u);

	String fn = request.getParameter("fn");
	String ln = request.getParameter("ln");
	String pass = request.getParameter("pwd");

	if(fn.equals("") && ln.equals("") && pass.equals("")){
	
		response.sendRedirect("user-home.jsp");
	}
	else{
		
		if(fn.equals("")){
			fn = student[0];
		}
		if(ln.equals("")){
			ln = student[1];
		}
		if(pass.equals("")){
			pass = student[3];
		}
		
	
	sfc.manageDetails(u,fn,ln,pass);
		response.sendRedirect("user-home.jsp");
	}
	
	
	%>


<%@page language="java" import="controller.*, interaction.*, entity.*"%>

<% 	
	String u = request.getParameter("Username");
	String p = request.getParameter("Password");
	
	 
	AccountController ac = new AccountController(u,p);
	session.setAttribute("ac", ac);
	
	DatabaseController dbc = new DatabaseController();
	session.setAttribute("dbc", dbc);
	String[] user = dbc.getUser(u);
	if (user[0].equals("No such user found"))
	{
		response.sendRedirect("login.jsp?Error=-2");
	}
	else
	{
	//String[] user = dbc.getUser(u);
	String f = user[0];
	String l = user[1];
	String t = user[4];
	String s = user[5];
	Account currentUser = new Account(f,l,u,p,t.charAt(0), s.charAt(0));
	
	session.setAttribute("currentUser", currentUser);
	
	
	int i = dbc.login(u, p);
	currentUser.login();
	if(i == 0){
		StudentFunctionalityController sfc = new StudentFunctionalityController();
		session.setAttribute("sfc", sfc);
		response.sendRedirect("user-home.jsp");
	}
	else if(i ==1){
		AdminFunctionalityController afc = new AdminFunctionalityController();
		session.setAttribute("afc", afc);
		response.sendRedirect("admin-home.jsp");
	}
	else if(i == -4){
		response.sendRedirect("login.jsp?Error=-4");
	}
	else if(i == -2){
		response.sendRedirect("login.jsp?Error=-2");
	}
	else if(i == -1){
		response.sendRedirect("login.jsp?Error=-1");
	}
	
	}

	%>
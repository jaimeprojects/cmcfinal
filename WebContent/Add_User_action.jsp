<%@page language="java" import="controller.*, interaction.*,java.util.ArrayList, entity.*"%>

<%
  DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");

  String firstName = request.getParameter("firstName");
  String lastName  = request.getParameter("lastName");
  String userName = request.getParameter("userName");
  String password = request.getParameter("password");
  char    type  = request.getParameter("type").charAt(0);
  char    status = request.getParameter("status").charAt(0);

  
  Account newStu = new Account(firstName,lastName,userName,password,type,status);
 // AdminFunctionalityController ac = new AdminFunctionalityController();
  dbc.addUser(newStu);
  response.sendRedirect("admin-home.jsp");
%>
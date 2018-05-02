<%@page language="java" import="controller.*, interaction.*,java.util.ArrayList, entity.*"%>

<%
 DatabaseController dbc = new DatabaseController();

  String firstName = request.getParameter("fn");
  String lastName  = request.getParameter("ln");
  String userName = request.getParameter("un");
  String password = request.getParameter("pwd");
  
  Account newStu = new Account(firstName,lastName,userName,password,'b','N');
  System.out.println(dbc.addUser(newStu));
  response.sendRedirect("index.jsp");
  
%>
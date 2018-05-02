<%@page language="java" import="controller.*, interaction.*,java.util.ArrayList, entity.*"%>
<%

	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");

    String uniName = request.getParameter("uniName");
    String state = request.getParameter("state");
    String location = request.getParameter("location");
    String control = request.getParameter("control");
    int numStu = Integer.parseInt(request.getParameter("numStu"));//number of students
    double perFemale = Double.parseDouble(request.getParameter("perFemale"));//percent female student
    double satVerbal = Double.parseDouble(request.getParameter("satVerbal"));//SAT Verbal score
    double satMath = Double.parseDouble(request.getParameter("satMath"));//SAT Math score
    double expenses = Double.parseDouble(request.getParameter("expenses"));
    double perFinancialAid = Double.parseDouble(request.getParameter("finAid"));//percent financial aid
    int numApp = Integer.parseInt(request.getParameter("numApp"));//number of applicants
    double numAdmitted = Double.parseDouble(request.getParameter("numAdmitted"));//number of students admitted to school
    double perEnrolled = Double.parseDouble(request.getParameter("perEnrolled"));//percent of enrolled student
    int academicScale = Integer.parseInt(request.getParameter("academicScale"));//scale 1-5 
    int socialScale = Integer.parseInt(request.getParameter("socialScale"));//scale 1-5
    int qualityOfLife = Integer.parseInt(request.getParameter("qualityOfLife"));//scale 1-5
    String emp1 = request.getParameter("emp1");
    String emp2 = request.getParameter("emp2");
    String emp3 = request.getParameter("emp3");
    
    UniversityController addUni = new UniversityController();
    addUni.addUniversity(uniName, state,location, control,numStu,perFemale, satVerbal, satMath, 
    		expenses, perFinancialAid, numApp, numAdmitted, perEnrolled, academicScale, socialScale, qualityOfLife, emp1, emp2, emp3);
    response.sendRedirect("admin-home.jsp");
%>
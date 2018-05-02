<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="controller.*, interaction.*, entity.*,java.util.*"%>

<% 	
	Account currentUser = (Account)session.getAttribute("currentUser");
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	AdminFunctionalityController afc = (AdminFunctionalityController)session.getAttribute("afc");
	
	
	String uniName = request.getParameter("uniName");
	University oldInfo = dbc.getUniversity(uniName);
	
	String state = request.getParameter("state");
	String location = request.getParameter("location");
	String control = request.getParameter("control");
	String numStu = request.getParameter("numStu");
	String fem = request.getParameter("fem");
	String satVerbal = request.getParameter("satVerbal");
	String satMath = request.getParameter("satMath");
	String expenses = request.getParameter("expenses");
	String finAid = request.getParameter("finAid");
	String numApp = request.getParameter("numApp");
	String numAdd = request.getParameter("numAdd");
	String numEnro = request.getParameter("numEnro");
	String acaSca = request.getParameter("acaSca");
	String socSca = request.getParameter("socSca");
	String qol = request.getParameter("qualityOfLife");
	String emp1 = request.getParameter("emp1");
	String emp2 = request.getParameter("emp2");
	String emp3 = request.getParameter("emp3");
	
	int inumStu;
	double dfem;
	double dsatVerbal;
	double dsatMath;
	double dexpenses;
	double dfinAid;
	int inumApp;
	double dnumAdd;
	double dnumEnro;
	int iacaSca;
	int isocSca;
	int iqol;
	
	
	
	
		if(uniName == null || uniName.equals("")){
			uniName = oldInfo.getUniversityName();
		}
		if(state == null || state.equals("")){
			state = oldInfo.getUniversityState();
		}
		if(location == null || location.equals("")){
			location = oldInfo.getLocationType();
		}
		if(control == null || control.equals(""))
		{
			control = oldInfo.getControl();
		}
		if(numStu == null || numStu.equals(""))
		{
			 inumStu = oldInfo.getNumOfStudents();
		}
		else
		{
			 inumStu = Integer.parseInt(numStu);
		}
		
		if(fem == null || fem.equals(""))
		{
			 dfem = oldInfo.getFemalePercentage();
		}
		else
		{
			 dfem = Double.parseDouble(fem);
		}
		if(satVerbal == null || satVerbal.equals(""))
		{
			 dsatVerbal = oldInfo.getSATVerbal() ;
		}
		else
		{
			 dsatVerbal = Double.parseDouble(satVerbal);
		}
		if(satMath == null || satMath.equals(""))
		{
			 dsatMath = oldInfo.getSATMath() ;
		}
		else
		{
			 dsatMath = Double.parseDouble(satMath);
		}
		if(expenses == null || expenses.equals(""))
		{
			 dexpenses = oldInfo.getExpenses() ;
		}
		else
		{
			 dexpenses = Double.parseDouble(expenses);
		}
		if(finAid == null || finAid.equals(""))
		{
			 dfinAid = oldInfo.getFinancialAid() ;
		}
		else
		{
			 dfinAid = Double.parseDouble(finAid);
		}
		if(numApp == null || numApp.equals(""))
		{
			 inumApp = oldInfo.getNumApplicants() ;
		}
		else
		{
			 inumApp = Integer.parseInt(numApp);
		}
		if(numAdd == null || numAdd.equals(""))
		{
			 dnumAdd = oldInfo.getNumAdmitted() ;
		}
		else
		{
			 dnumAdd = Double.parseDouble(numAdd);
		}
		if(numEnro == null || numEnro.equals(""))
		{
			 dnumEnro = oldInfo.getNumEnrolled() ;
		}
		else
		{
			 dnumEnro = Double.parseDouble(numEnro);
		}
		if(acaSca == null || acaSca.equals(""))
		{
			 iacaSca = oldInfo.getAcademicScale() ;
		}
		else
		{
			 iacaSca = Integer.parseInt(acaSca);
		}
		if(socSca == null || socSca.equals(""))
		{
			 isocSca = oldInfo.getSocialScale() ;
		}
		else
		{
			 isocSca = Integer.parseInt(socSca);
		}
		if(qol == null || qol.equals(""))
		{
			 iqol = oldInfo.getQualityOfLife() ;
		}
		else
		{
			 iqol = Integer.parseInt(qol);
		}
		
		
		ArrayList<String> newEmps = new ArrayList<String>();
		if(emp1 == null || emp1.equals("") && emp2 == null || emp2.equals("") && emp3 == null || emp3.equals(""))
		{
			newEmps = null;
		}
		else
		{
			if(emp1 != null || !emp1.equals(""))
			{
				newEmps.add(emp1);
			}
			if(emp2 != null || !emp2.equals(""))
			{
				newEmps.add(emp2);
			}
			if(emp3 != null || !emp3.equals(""))
			{
				newEmps.add(emp3);
			}
		}
		if (newEmps != null)
		{
			oldInfo.setEmphases(oldInfo.getUniversityName(), newEmps);
		}
		
		University newUni = new University(uniName, state, location, control, inumStu, dfem, dsatVerbal, dsatMath, dexpenses, dfinAid, inumApp, dnumAdd, dnumEnro, iacaSca, isocSca, iqol);
		
		dbc.editUniversity(newUni);
		
		response.sendRedirect("admin-home.jsp");
	
	%>
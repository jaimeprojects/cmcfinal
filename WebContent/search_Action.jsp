<%@page language="java" import="controller.*,java.util.*"%>

<%
    //out.println("delete user : " + request.getParameter("Username"));
	String uni = request.getParameter("uniName");
	if (uni == null)
	{
		uni = "";
	}
	String state = request.getParameter("stateSearch");
	if (state == null)
	{
		state = "";
	}
	String location = request.getParameter("location");
	if (location == null)
	{
		location = "";
	}
	String control = request.getParameter("control");
	if (control == null)
	{
		control = "";
	}
	String numStudents = request.getParameter("numStudents");
	if (numStudents == null)
	{
		numStudents = "0";
	}
	String numFemale = request.getParameter("numFemale");
	if (numFemale == null)
	{
		numFemale = "0";
	}
	String satVerbal = request.getParameter("satVerbal");
	if (satVerbal == null)
	{
		satVerbal = "0";
	}
	String satMath = request.getParameter("satMath");
	if (satMath == null)
	{
		satMath = "0";
	}
	String expenses = request.getParameter("expenses");
	if (expenses == null)
	{
		expenses = "0";
	}
	String numAid = request.getParameter("numAid");
	if (numAid == null)
	{
		numAid = "0";
	}
	String numApplicants = request.getParameter("numApplicants");
	if (numApplicants == null)
	{
		numApplicants = "0";
	}
	String numAccepted = request.getParameter("numAccepted");
	if (numAccepted == null)
	{
		numAccepted = "0";
	}
	String numEnrolled = request.getParameter("numEnrolled");
	if (numEnrolled == null)
	{
		numEnrolled = "0";
	}
	String acaScale = request.getParameter("acaScale");
	if (acaScale == null)
	{
		acaScale = "0";
	}
	String socScale = request.getParameter("socScale");
	if (socScale == null)
	{
		socScale = "0";
	}
	String qolScale = request.getParameter("qolScale");
	if (qolScale == null)
	{
		qolScale = "0";
	}
	
	SearchController sc = new SearchController();

	ArrayList<String> results = sc.search(uni, state, location, control, numStudents, numFemale, satVerbal, satMath, expenses, numAid, 
			numApplicants, numAccepted, numEnrolled, acaScale, socScale, qolScale);
	
	session.setAttribute("results", results);
	
	response.sendRedirect("results.jsp");
%>
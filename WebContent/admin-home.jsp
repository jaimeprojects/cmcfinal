<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*,java.util.ArrayList, entity.*"%>

<html>
<%
Account currentUser = (Account)session.getAttribute("currentUser");
if(currentUser == null || currentUser.getType() != 'a'){
	response.sendRedirect("login.jsp?Error=-7");
}
 else if (currentUser.getType() == 'a'){
	String u = request.getParameter("u");
	String p = request.getParameter("p");
	
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	
	String[] user = dbc.getUser(u);

	String[] fn = dbc.getUser(currentUser.getUsername());

	
	String first, last, pass, us, type, status;
	
	String[][] au = dbc.getUsers();
	String[][] uni = dbc.getListUniversities();
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alegreya+SC">
    <link rel="stylesheet" href="assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="assets/css/Table-with-search.css">
    <link rel="stylesheet" href="assets/css/Table-with-search.css">
    <link rel="stylesheet" href="assets/css/untitled-1.css">
    <link rel="stylesheet" href="assets/css/untitled-2.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-light clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="index.jsp" style="color:rgba(0,0,0,0.9);font-family:Montserrat, sans-serif;">CMC</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto"></ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="admin-home.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="search.jsp" style="color:rgba(0,0,0,0.5);">Search</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link login-page" href="Logout_action.jsp" style="color:rgba(0,0,0,0.5);">Log Out</a></li>
                
                </ul>
        </div>
        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
    </nav>
    <main class="page faq-page">
        <section class="clean-block clean-faq dark">
            <div class="container">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);">Welcome, <%=fn[0] %></h2>
                </div>
                <div class="block-content" style="background-color:rgba(255,255,255,0.72);">
                    <div class="faq-item">
                        <h4 class="question">Use section below to make changes and manage users and universites</h4>
                        <div class="answer"></div>
                    </div>
                    <div class="faq-item">
                        <div>
                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-1" style="color:rgb(0,0,0);">Universities</a></li>
                                <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-2" style="color:rgb(0,0,0);">Users</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane" role="tabpanel" id="tab-1">
                                    <p>Manage Universities<a class="btn btn-primary float-right" type="button" href="A-add-uni.jsp"style="background-color:rgb(148,201,134);width:173px;">Add University</a></p>
                                    <%for(int i = 0; i < uni.length; i++)
                                	{
                                		String name = uni[i][0];
                                	
                                	%>
                                   
                                    
                                    <div class="row" id="<%= i%>">
                                        <div class="col">
                                            <p><%= name %></p>
                                        </div>
                                        <div class="col"></div>
                                        <div class="col">
                                            <div class="btn-toolbar">
                                                <div class="btn-group" role="group">
                                                <a class="btn btn-primary" style="background-color:rgb(50,181,142);"href='A-edit-uni.jsp?schoolName=<%=name%>' type="submit">Edit</a>
                                                <a class="btn btn-primary" style="background-color:rgb(54,51,45);" href="uniPage.jsp?schoolName=<%=name%>"type="submit">View</a>
                                                <a class="btn btn-primary" style="background-color:rgb(187,34,34);" href='deleteUniversity.jsp?schoolName=<%=name%>'type="submit">Delete</a>
                                                
                                                </div>
                                                
                                                <div class="btn-group"
                                                    role="group"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <%} %>
                                </div>
                                <div class="tab-pane active" role="tabpanel" id="tab-2">
                                    <p>Manage Users<a class="btn btn-primary float-right" role="button" href="Add_User.jsp" style="width:173px;background-color:rgb(148,201,134);">Add User</a></p>
                                    <div class="row">
                                        <div class="col" style="height:30px;">
                                            <h5>Name</h5>
                                        </div><div class="col" style="height:30px;">
                                            
                                        </div>
                                        <div class="col" style="height:30px;">
                                            <h5>Username</h5>
                                        </div><div class="col" style="height:30px;">
                                            
                                        </div>
                                        <div class="col">
                                            <h5>Password</h5>
                                        </div><div class="col" style="height:30px;">
                                            
                                        </div>
                                        <div class="col" style="height:30px;">
                                            <h5>Type</h5>
                                        </div><div class="col" style="height:30px;">
                                            
                                        </div>
                                        <div class="col" style="height:30px;">
                                            <h5>Status</h5>
                                        </div>
                                        <div class="col" style="height:30px;">
                                            
                                        </div>
                                        <div class="col" style="height:30px;">
                                            <h5>Actions</h5>
                                        </div>
                                        <div class="col" style="height:30px;">
                                            
                                        </div>
                                        <div class="col" style="height:30px;">
                                            
                                        </div>
                                    </div>
                                    <%for(int i = 0; i < au.length; i++)
                                	{
                                		
                                	
                                			first = au[i][0];
                                			last = au[i][1];
                                			us = au[i][2];
                                			pass = au[i][3];
                                			type = au[i][4];
                                			status = au[i][5];
                                		
                                		%><div class="row"><div class="col">
                                            <p><%= first + " " + last %></p>
                                        </div> <%

                                        %> <div class="col">
                                            <p><%= us %></p>
                                        </div><%
                                		%> <div class="col">
                                            <p><%= pass %></p>
                                        </div><%
                                        %><div class="col">
                                            <p><%= type %></p>
                                        </div><%
                                        %><div class="col">
                                        <p><%= status %></p>
                                    </div><%
                                    
                                
                                        %>
                                        
                                        <div class="col">
                                            <div class="btn-toolbar">
                                                <div class="btn-group" role="group">
                                                <a class="btn btn-primary" href='A-edit-user.jsp?userName=<%=us%>' type="submit" style="background-color:rgb(50,181,142);">Edit</a>
                                                <a class="btn btn-primary" href='deleteUser.jsp?userName=<%=us%>'type="submit" style="background-color:rgb(187,34,34);">Delete</a>
                                                <a class="btn btn-primary" href='deactivate-action.jsp?us=<%=us%>' type="submit" style="background-color:rgb(218,26,95);">Deactivate</a></div>
                                                
                                                <div class="btn-group" role="group"></div>
                                            </div>
                                          </div>
                                          </div>
                                          <%
                                		
                                	}
                                		%>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </section>
    </main>
    <footer class="page-footer dark" style="background-color:rgb(43,47,49);">
        <div class="footer-copyright" style="background-color:rgb(34,36,37);color:rgb(255,255,255);">
            <p style="font-family:'Alegreya SC', serif;">© 2018 Copyright</p>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/login.js"></script>
    <script src="assets/js/Table-with-search.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
<%} %>
</html>
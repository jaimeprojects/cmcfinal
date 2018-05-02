<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*, entity.*, java.util.*"%>

<html>
<%
Account currentUser = (Account)session.getAttribute("currentUser");
if(currentUser.getType() != 'u'){
	response.sendRedirect("login.jsp?Error=-7");
}
 else if (currentUser.getType() == 'u'){
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	String username = request.getParameter("userName");

	String[] student = dbc.getUser(username);
 
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
        <div class="container"><a class="navbar-brand logo" href="user-home.jsp" style="color:rgba(0,0,0,0.9);">User Home</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto"></ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="search.jsp" style="color:rgba(0,0,0,0.5);">Search</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link login-page" href="Logout_action.jsp" style="color:rgba(0,0,0,0.5);">Log out</a></li>
                    
        </div>
        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
    </nav>
    <main class="page payment-page">
        <section class="clean-block payment-form dark">
            <div class="container">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Edit User</h2>
                    <p style="color:rgb(255,255,255);">Make Appropriate Changes Below or not at all!</p>
                </div>
                <form action="S-EditUser-action.jsp" name="S-EditUser-action">
                    <div class="products">
                        <h3 class="title" style="font-family:'Alegreya SC', serif;">Student Information</h3>
                        <div class="item"></div>
                        <div class="item">
                            <div class="form-row" style="margin:8px;">
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;">First Name</p>
                                </div>
                                <div class="col"><input name="fn" class="form-control" type="text" style="font-family:'Alegreya SC', serif;background-color:rgb(202,217,231);" placeholder="<%= student[0] %>"></div>
                            </div>
                            <div class="form-row" style="margin:8px;">
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;">Last Name</p>
                                </div>
                                <div class="col"><input name="ln" class="form-control" type="text" style="font-family:'Alegreya SC', serif;background-color:#cad9e7;" placeholder ="<%= student[1] %>" ></div>
                            </div>
                            <div class="form-row" style="margin:8px;">
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;">User Name</p>
                                </div>
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;"><%= student[2] %></p>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;">Password</p>
                                </div>
                                <div class="col"><input name="pwd" class="form-control" type="text" style="font-family:'Alegreya SC', serif;background-color:#cad9e7;" placeholder="<%= student[3] %>"></div>
                            </div>
                            <div class="form-row" style="margin:8px;">
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;">Account Type</p>
                                </div>
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;"><%= student[4] %></p>
                                </div>
                            </div>
                            <div class="form-row" style="margin:8px;">
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;">Account Status</p>
                                </div>
                                <div class="col">
                                    <p style="font-family:'Alegreya SC', serif;"><%= student[5] %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input name="userName" value= <%=student[2]%> type="hidden">
                    <div class="card-details"><button class="btn btn-primary" type="submit" style="width:214px;background-color:rgb(187,107,60);font-family:Montserrat, sans-serif;font-size:13px;">Submit Changes</button></div>
                </form>
            </div>
        </section>
    </main>
    <footer class="page-footer dark">
        <div class="footer-copyright">
            <p style="font-family:'Alegreya SC', serif;">© 2018 Copyright Text</p>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/login.js"></script>
    <script src="assets/js/Table-with-search.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
<% } %>
</html>
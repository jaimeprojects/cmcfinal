<%@page language="java" import="controller.*, interaction.*, entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<%

ArrayList<String> results = (ArrayList)session.getAttribute("results"); 

Account currentUser = (Account)session.getAttribute("currentUser");

%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
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
                    <%if( currentUser == null || !currentUser.isLoggedIn()){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="index.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
                <%} else if(currentUser.getType() == 'a'){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="admin-home.jsp" style="color:rgba(0,0,0,0.5);">Home</a>
                <%} else {%><li class="nav-item" role="presentation"><a class="nav-link login-page" href="user-home.jsp" style="color:rgba(0,0,0,0.5);">Home</a><%} %>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="search.jsp" style="color:rgba(0,0,0,0.5);">Search</a></li>
                    <%if( currentUser == null || !currentUser.isLoggedIn()){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="login.jsp" style="color:rgba(0,0,0,0.5);">Log In</a></li>
                <% }else{ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="Logout_action.jsp" style="color:rgba(0,0,0,0.5);">Log Out</a><%} %>
                </ul>
                
               
        </div>
        </div>
    </nav>
    <main class="page catalog-page">
        <section class="clean-block clean-catalog dark">
            <div class="container">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Results</h2>
                    <p style="color:rgb(255,255,255);">Here are some universites that will match your tastes!</p>
                </div>
                <div class="content" style="background-color:rgba(173,108,43,0.56);">
                <%for(String o : results){ %>
                    <div class="row">
                        <div class="col">
                            <p style="color:rgb(255,255,255);"><%=o %></p>
                        </div>
                                        
                                        <div class="col justify-content-center align-items-center align-content-center align-self-center">
                                            <div class="btn-toolbar align-content-center align-self-center" style="padding:0px;margin:0px;">
                                                <div class="btn-group justify-content-center align-items-center align-content-center" role="group">
                                                <a class="btn btn-primary" href="uniPage.jsp?schoolName=<%= o%>" type="button" style="background-color:rgb(54,51,45);">View</a>
                                                <%if(currentUser != null && currentUser.getType() == 'u') {%>
                                                <a class="btn btn-primary" href="S-uni-save.jsp?schoolName=<%= o%>" type="button" style="background-color:rgb(218,108,32);">Save</a>
                                                <%} %></div>
                                                <div
                                                    class="btn-group" role="group"></div>
                                        </div>
                                    </div>
                                </div>
                                <% }%> 
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
<%session.removeAttribute("results"); %>
</html>
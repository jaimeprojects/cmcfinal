<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*, entity.*, java.util.*"%>
<html>
<%
Account currentUser = (Account)session.getAttribute("currentUser");

	
	if(currentUser == null || currentUser.getType() != 'u'){
		response.sendRedirect("login.jsp?Error=-7");
	}
     else if (currentUser.getType() == 'u'){
    	 String u = request.getParameter("u");

    	 String p = request.getParameter("p");

    	 DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");

    	 String[] userInfo = dbc.getUser(currentUser.getUsername());
	StudentInteraction sfc = new StudentInteraction(userInfo[0], userInfo[1], userInfo[3]);
	//String[][] savedUni = dbc.getSavedByUser();
	ArrayList<String> savedUni = sfc.viewSavedUniversities(userInfo[2]);



%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home</title>
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
<!-- Start of LiveChat (www.livechatinc.com) code -->
<script type="text/javascript">
window.__lc = window.__lc || {};
window.__lc.license = 9722830;
(function() {
  var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
  lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
})();
</script>
<!-- End of LiveChat code -->
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-light clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="index.jsp" style="color:rgba(0,0,0,0.9);font-family:Montserrat, sans-serif;">Student Home</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto"></ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
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
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Welcome, <%= userInfo[0] %></h2>
                </div>
                <div class="block-content" style="background-color:rgba(255,255,255,0.72);">
                    <div class="faq-item">
                        <h4 class="question" style="font-family:Montserrat, sans-serif;">Use section below to make changes and manage users and universites</h4>
                        <div class="answer"></div>
                    </div>
                    <div class="faq-item">
                        <div>
                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1" style="color:rgb(0,0,0);">My Saved Schools</a></li>
                                <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-2" style="color:rgb(0,0,0);">Profile</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <p>Manage Universities</p>
                                    <%for(String o : savedUni){
                                    	
                                    	%>
                                    <div class="row">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;"><%= o %></p>
                                        </div>
                                        <div class="col"></div>
                                        <div class="col justify-content-center align-items-center align-content-center align-self-center">
                                            <div class="btn-toolbar align-content-center align-self-center" style="padding:0px;margin:0px;">
                                                <div class="btn-group justify-content-center align-items-center align-content-center" role="group">
                                                <a class="btn btn-primary" href="uniPage.jsp?schoolName=<%= o%>" type="button" style="background-color:rgb(54,51,45);">View</a>
                                                
                                                <a class="btn btn-primary" href="deleteSavedSchool.jsp?schoolName=<%= o%>&userName=<%= userInfo[2]%>" type="button" style="background-color:rgb(187,34,34);">Delete</a>
                                                </div>
                                                <div
                                                    class="btn-group" role="group"></div>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab-2">
                                <div class="row">
                                    <div class="col" style="height:30px;">
                                        <h5 style="font-family:'Alegreya SC', serif;">Name</h5>
                                    </div>
                                    <div class="col" style="height:30px;">
                                        <h5 style="font-family:'Alegreya SC', serif;">Username</h5>
                                    </div>
                                    <div class="col">
                                        <h5 style="font-family:'Alegreya SC', serif;">Password</h5>
                                    </div>
                                    <div class="col" style="height:30px;">
                                        <h5 style="font-family:'Alegreya SC', serif;">Type</h5>
                                    </div>
                                    <div class="col" style="height:30px;">
                                        <h5 style="font-family:'Alegreya SC', serif;">Status</h5>
                                    </div>
                                    <div class="col" style="height:30px;">
                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <p style="font-family:'Alegreya SC', serif;"><%= userInfo[0] + " " + userInfo[1] %>&nbsp;</p>
                                    </div>
                                    <div class="col">
                                        <p style="font-family:'Alegreya SC', serif;"><%= userInfo[2] %></p>
                                    </div>
                                    <div class="col">
                                        <p style="font-family:'Alegreya SC', serif;"><%= userInfo[3] %></p>
                                    </div>
                                    <div class="col">
                                        <p style="font-family:'Alegreya SC', serif;"><%= userInfo[4] %></p>
                                    </div>
                                    <div class="col">
                                        <p style="font-family:'Alegreya SC', serif;"><%= userInfo[5] %></p>
                                    </div>
                                     
                                    <div class="col">
                                            <div class="btn-toolbar">
                                                <div class="btn-group" role="group">
                                                <a class="btn btn-primary" href='S-edit-user.jsp?userName=<%=userInfo[2]%>' type="submit" style="background-color:rgb(50,181,142);">Edit</a>
                                                
                                            </div>
                                          </div>
                                </div>
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
<% }%>
</html>
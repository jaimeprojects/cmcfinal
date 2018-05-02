<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*, entity.*, java.util.*"%>
<html>
<%
Account currentUser = (Account)session.getAttribute("currentUser");


%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMC Home</title>
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
        <div class="container"><a class="navbar-brand logo" href="index.jsp" style="color:rgba(0,0,0,0.9);font-family:Montserrat, sans-serif;">CMC</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto"></ul>
                <ul class="nav navbar-nav ml-auto">
                    <%if( currentUser == null || !currentUser.isLoggedIn()){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="index.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
                <% }else if(currentUser.getType() == 'a'){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="admin-home.jsp" style="color:rgba(0,0,0,0.5);">Home</a>
                <%} else {%><li class="nav-item" role="presentation"><a class="nav-link login-page" href="user-home.jsp" style="color:rgba(0,0,0,0.5);">Home</a><%} %>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="search.jsp" style="color:rgba(0,0,0,0.5);">Search</a></li>
                    <%if( currentUser == null || !currentUser.isLoggedIn()){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="login.jsp" style="color:rgba(0,0,0,0.5);">Log In</a></li>
                <% }else{ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="Logout_action.jsp" style="color:rgba(0,0,0,0.5);">Log Out</a><%} %></ul>
        </div>
        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
    </nav>
    <main class="page landing-page">
        <section class="clean-block clean-hero" style="background-image:url(&quot;assets/img/scenery/uni.jpg&quot;);color:rgba(9, 162, 255, 0.25);">
            <div class="text">
                <h2 style="font-size:57px;font-family:'Alegreya SC', serif;">Welcome to</h2>
                <h2 style="font-size:57px;font-family:'Alegreya SC', serif;">Choose My College</h2>
                <p style="font-size:30px;font-family:'Alegreya SC', serif;">Find and Save University Recommendations!</p>
            </div>
        </section>
        <section class="clean-block clean-info dark">
            <div class="container">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Information about the Website</h2>
                    <p></p>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-6"><img class="img-thumbnail" src="assets/img/scenery/group.jpg"></div>
                    <div class="col-md-6" style="background-color:rgba(120,67,29,0.52);">
                        <h3 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Creators</h3>
                        <div class="getting-started-info">
                            <p style="color:rgb(255,255,255);">This website was developed and designed by Jaime Vega, Vue Xiong, Ramon Angeles, Jonathan First, and James Heidelberger</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="clean-block slider dark"></section>
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

</html>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="search.jsp" style="color:rgba(0,0,0,0.5);">Search</a></li>
                </ul>
        </div>
        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
    </nav>
    <main class="page login-page">
        <section class="clean-block clean-form dark">
            <div class="container">
                <div class="block-heading">
                <%
	String error = request.getParameter("Error");
                if(error == null){
                	%> <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Let's Get Started</h2> <%
                }
if(error != null)
{
	if (error.equals("-1"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Incorrect username was entered. Try Again</h2><%
		
	}
	else if (error.equals("-2"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Incorrect username/password was entered. Try Again</h2><%
		
	}
	else if (error.equals("-3"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">There was a problem accessing the database, Contact Administrator</h2><%
		
	}
	else if (error.equals("-4"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">You are not logged in</h2><%
	}
	else if (error.equals("-5"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Username does not exist</h2><%
	}
	else if (error.equals("-7"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">You do not have access to this page!</h2><%
	}
	else if (error.equals("-8"))
	{
		%><h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Login to View University Details</h2><%
	}
}
%>
                    
                </div>
                <form style="background-color:rgba(137,39,28,0.86);" action="Login_action.jsp" name="Login">
                    <div class="form-group"><label for="username" style="font-family:Montserrat, sans-serif;color:rgb(255,255,255);">Username</label>
                    <input name="Username" input class="form-control item" type="text" id="username" style="background-color:rgb(202,217,231);font-family:'Alegreya SC', serif;"></div>
                    <div
                        class="form-group"><label for="password" style="color:rgb(255,255,255);">Password</label>
                        <input name="Password" input class="form-control" type="password" id="password" style="background-color:rgb(202,217,231);"></div>
                        <button class="btn btn-primary" type="submit" role="submit" style="background-color:rgb(105,63,41);font-family:'Alegreya SC', serif;">Login</button>
                        <a class="btn btn-primary" type="submit" href="register.jsp" role="submit" style="background-color:rgb(105,63,41);font-family:'Alegreya SC', serif;">Register</a></form>
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

</html>
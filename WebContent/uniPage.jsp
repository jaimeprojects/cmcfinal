<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*,java.util.ArrayList, entity.*"%>
<html>
<%

Account currentUser = (Account)session.getAttribute("currentUser");
if(currentUser == null || !currentUser.isLoggedIn()){
	response.sendRedirect("login.jsp?Error=-8");
}
else{
	DatabaseController dbc = (DatabaseController)session.getAttribute("dbc");
	String uniName = request.getParameter("schoolName");
	
	University uni = dbc.getUniversity(uniName);
	String uName = uni.getUniversityName();
	String uLoc = uni.getUniversityState();
	
		for(int j =0; j<uName.length(); j++){
			if(uName.charAt(j) == ' '){
				uName = uName.substring(0,j) + "+" + uName.substring(j+1);
			}
		}
		for(int k = 0; k<uLoc.length(); k++){
			if(uLoc.charAt(k) == ' '){
				uLoc = uLoc.substring(0,k) + "+" + uLoc.substring(k+1);
			}
		}
			
			ArrayList<String> recommended = dbc.getRecommendedSchools(uni);
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View University</title>
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
        <div class="container"><a class="navbar-brand logo" href="index.jsp" style="color:rgba(0,0,0,0.9);">CMC</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
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
                
                    
                </ul>
        </div>
        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
    </nav>
    <main class="page product-page">
        <section class="clean-block clean-product dark">
            <div class="container">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;"><%=uni.getUniversityName() %></h2>
                    
                </div>
                <div class="block-content">
                    <div class="product-info"></div>
                    <div class="product-info">
                        <div class="row">
                            <div class="col"><iframe
  width=100%
  height="400"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB8tasHHk3Sb3R-rThyylxyw6bxMsKY9-s&q=<%=uName %>,<%=uLoc %>" allowfullscreen>
</iframe></div>
                            <div class="col">
                                <h2 style="font-family:'Alegreya SC', serif;">University Description</h2>
                                <p class="text-left">State : <%= uni.getUniversityState()%></p>
                                <p class="text-left">Location Type : <%=uni.getLocationType()%></p>
                                <p class="text-left">Control : <%=uni.getControl()%></p>
                                <p class="text-left">Number of Students : <%=uni.getNumOfStudents()%> </p>
                                <p class="text-left">Female % : <%=uni.getFemalePercentage()%></p>
                                <p class="text-left">SAT Verbal : <%=uni.getSATVerbal()%></p>
                                <p class="text-left">SAT Math : <%=uni.getSATMath()%></p>
                                <p class="text-left">Expenses : <%=uni.getExpenses()%></p>
                                <p class="text-left">Number of Applicants : <%=uni.getNumApplicants()%></p>
                                <p class="text-left">Number Admitted : <%=uni.getNumAdmitted()%></p>
                                <p class="text-left">Number Enrolled : <%=uni.getNumEnrolled()%></p>
                                <p class="text-left">Academic Scale : <%=uni.getAcademicScale()%></p>
                                <p class="text-left">Social Scale : <%=uni.getSocialScale()%></p>
                                <p class="text-left">Quality of Life : <%=uni.getQualityOfLife()%></p>
                                <p class="text-left">School Emphasis : <%
                                
                                ArrayList<String> yo = dbc.getEmphasis(uName);
                                
           
                                	for(int i = 1; i < yo.size(); i+=2){
                                		
                                		out.println(yo.get(i) + " ,");
                                	}
                                	
                                %></p>
                                   <%if(currentUser.getType() == 'u') {%>
                                                <a class="btn btn-primary" href="S-uni-save.jsp?schoolName=<%= uName%>" type="button" style="background-color:rgb(218,108,32);">Save</a>
                                                <%} %></div>
                        </div>
                    </div>
                    <div class="clean-related-items">
                        <h3 style="font-family:'Alegreya SC', serif;">Related Schools</h3>
                                <%for(String o : recommended){
                                	
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
                                            <%if(currentUser.getType() == 'u'){%>
                                                <a class="btn btn-primary" href="S-uni-save.jsp?schoolName=<%= o%>" type="button" style="background-color:rgb(218,108,32);">Save</a>
                                                <%}%>
                                            </div>
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
<%} %>
</html>
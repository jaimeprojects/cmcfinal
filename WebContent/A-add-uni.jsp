<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*, entity.*, java.util.*"%>
<%
Account currentUser = (Account)session.getAttribute("currentUser");
if(currentUser == null || currentUser.getType() != 'a'){
	response.sendRedirect("login.jsp?Error=-7");
}

%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add University</title>
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
        <div class="container"><a class="navbar-brand logo" href="index.jsp" style="color:rgba(0,0,0,0.9);">CMC</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto"></ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation" style="color:rgb(0,0,0);"><a class="nav-link" href="admin-home.jsp" style="color:rgba(0,0,0,0.5);">Home</a></li>
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
    <main class="page payment-page">
        <section class="clean-block payment-form dark">
            <div class="container">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;">Add a University</h2>
                    <h3 class="title" style="color:rgb(255,255,255);padding:0px;margin:34px;">University Information</h3>
                    <p>Make Appropriate Changes Below or not at all!</p>
                </div>
                <form action="Add_University_Action.jsp" name="AddUni">
                    <div class="products" style="margin:-96px;width:784px;padding:44px;">
                        <div class="item"></div>
                        <div class="item">
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">University</p>
                                        </div>
                                        <div class="col"><input name="uniName" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">State</p>
                                        </div>
                                        <div class="col"><input name="state" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Location</p>
                                        </div>
                                        <div class="col"><input name="location"class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Control</p>
                                        </div>
                                        <div class="col"><input name="control" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Number of Students</p>
                                        </div>
                                        <div class="col"><input name="numStu" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">% Female</p>
                                        </div>
                                        <div class="col"><input name="perFemale" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">SAT Verbal</p>
                                        </div>
                                        <div class="col"><input name="satVerbal"class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">SAT Math</p>
                                        </div>
                                        <div class="col"><input name="satMath" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Expenses</p>
                                        </div>
                                        <div class="col"><input name="expenses" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Financial Aid</p>
                                        </div>
                                        <div class="col"><input name="finAid" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;"># of Applicants</p>
                                        </div>
                                        <div class="col"><input name="numApp" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;"># Admitted</p>
                                        </div>
                                        <div class="col"><input name="numAdmitted" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;"># Enrolled</p>
                                        </div>
                                        <div class="col"><input name="perEnrolled" class="form-control" type="text" style="background-color:#cad9e7;"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Academic Scale</p>
                                        </div>
                                        <div class="col"><input name="academicScale" class="form-control" type="text" style="background-color:#cad9e7;"placeholder="1-5"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Social Scale</p>
                                        </div>
                                        <div class="col"><input name="socialScale" class="form-control" type="text" style="background-color:#cad9e7;"placeholder="1-5"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Quality of Life</p>
                                        </div>
                                        <div class="col"><input name="qualityOfLife" class="form-control" type="text" style="background-color:#cad9e7;"placeholder="1-5"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col">
                                            <p style="font-family:'Alegreya SC', serif;">Emphasis</p>
                                        </div>
                                        <div class="col"><input name="emp1" class="form-control" type="text" style="background-color:#cad9e7;"placeholder="add emphases"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col"> </div>
                                        <div class="col"><input name="emp2" class="form-control" type="text" style="background-color:#cad9e7;"placeholder="add emphases"></div>
                                    </div>
                                    <div class="form-row" style="margin:8px;">
                                        <div class="col"> </div>
                                        <div class="col"><input name="emp3" class="form-control" type="text" style="background-color:#cad9e7;"placeholder="add emphases"></div>
                                    </div>
                                </div>                        
                            </div>
                            <div class="card-details"><button class="btn btn-primary" type="submit" style="width:214px;background-color:rgb(187,107,60);">Add University</button>
                            <a class="btn btn-primary" type="submit" href="admin-home.jsp"style="width:214px;background-color:rgb(187,107,60);">Cancel</a></div>
                           
                        </div>
                    </div>
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

</html>
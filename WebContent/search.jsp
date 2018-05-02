<!DOCTYPE html>
<%@page language="java" import="controller.*, interaction.*,java.util.*, entity.*"%>
<html>
<%Account currentUser = (Account)session.getAttribute("currentUser"); %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search for Schools</title>
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
    <style>
* {
  box-sizing: border-box;
}
body {
  font: 16px Arial;  
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}
input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}
input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}
input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
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
                    <%if(currentUser != null && currentUser.isLoggedIn()){ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="Logout_action.jsp" style="color:rgba(0,0,0,0.5);">Log Out</a></li>
                   <%} else{ %><li class="nav-item" role="presentation"><a class="nav-link login-page" href="login.jsp" style="color:rgba(0,0,0,0.5);">Log In</a><%} %></ul>
        </div>
        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </div>
    </nav>
    <main class="page catalog-page">
        <section class="clean-block clean-catalog dark">
            <div class="container" style="background-color:rgba(249,172,91,0.25);">
            <form autocomplete="off" action="search_Action.jsp">
                <div class="block-heading">
                    <h2 style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;font-size:47px;">Search Universities</h2>
                    <p style="color:rgb(255,255,255);font-family:'Alegreya SC', serif;font-size:27px;">Use the section below to find schools that match your taste!</p>
                </div><button class="btn btn-primary" type="submit" style="width:332px;background-color:rgb(114,85,95);font-family:'Alegreya SC', serif;">Search</button>
                <div class="content"></div>
                <div class="row">
                    <div class="col" style="padding:10px;"><input id="uniName"  style="text-transform:uppercase" type="text" name="uniName" placeholder="Enter University Name Here"></div>
                    <div class="col" style="padding:10px;"><input id="stateSearch" type="text" name="stateSearch" placeholder="Enter State Here"></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="location" name= "location">
                    <option>Select Location Type</option>
                    <option>URBAN</option>
                    <option>SMALL-CITY</option>
                    <option>FOREIGN</option>
                    </select></div>
                </div>
                <div class="row">
                    <div class="col" style="padding:10px;"><select class="form-control" id="control" name ="control">
                    <option>Select Control Type</option>
                    <option>CITY</option>
                    <option>STATE</option>
                    <option>PRIVATE</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="numStudents" name ="numStudents">
                    <option>Select Number Of Students</option>
                    <option>Above 40000</option>
                    <option>40000</option>
                    <option>30000</option>
                    <option>20000</option>
                    <option>10000</option>
                    <option>5000</option>
                    <option>3000</option>
                    <option>2000</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="numFemale" name = "numFemale">
                    <option>Select Percentage Female</option>
                    <option>100</option>
                    <option>80</option>
                    <option>60</option>
                    <option>40</option>
                    <option>20</option>
                    <option>0</option>
                    </select></div>
                </div>
                <div class="row">
                    <div class="col" style="padding:10px;"><select class="form-control" id="satVerbal" name="satVerbal">
                    <option>Select SAT Verbal Score</option>
                    <option>800</option>
                    <option>700</option>
                    <option>600</option>
                    <option>500</option>
                    <option>400</option>
                    <option>200</option>
                    <option>100</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="satMath" name="satMath">
                    <option>Select SAT Math Score</option>
                    <option>800</option>
                    <option>700</option>
                    <option>600</option>
                    <option>500</option>
                    <option>400</option>
                    <option>200</option>
                    <option>100</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="expenses" name="expenses">
                    <option>Select Expenses</option>
                    <option>40000</option>
                    <option>30000</option>
                    <option>20000</option>
                    <option>10000</option>
                    <option>5000</option>
                    <option>3000</option>
                    <option>2000</option>
                    </select></div>
                </div>
                <div class="row">
                    <div class="col" style="padding:10px;"><select class="form-control" id="numAid" name="numAid">
                    <option>Select Percentage Finanical Aid</option>
                    <option>100</option>
                    <option>80</option>
                    <option>60</option>
                    <option>40</option>
                    <option>20</option>
                    <option>0</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="numApplicants" name="numApplicants">
                    <option>Select Number of Applicants</option>
                    <option>Above 40000</option>
                    <option>40000</option>
                    <option>30000</option>
                    <option>20000</option>
                    <option>10000</option>
                    <option>5000</option>
                    <option>3000</option>
                    <option>2000</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="numAccepted" name="numAccepted">
                    <option>Select Percentage Accepted</option>
                    <option>100</option>
                    <option>80</option>
                    <option>60</option>
                    <option>40</option>
                    <option>20</option>
                    <option>0</option>
                    </select></div>
                </div>
                <div class="row">
                    <div class="col" style="padding:10px;"><select class="form-control" id="numEnrolled" name="numEnrolled">
                    <option>Select Percentage Enrolled</option>
                    <option>100</option>
                    <option>80</option>
                    <option>60</option>
                    <option>40</option>
                    <option>20</option>
                    <option>0</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="acaScale" name="acaScale">
                    <option>Select Academic Scale</option>
                    <option>5</option>
                    <option>4</option>
                    <option>3</option>
                    <option>2</option>
                    <option>1</option>
                    </select></div>
                    <div class="col" style="padding:10px;"><select class="form-control" id="socScale" name="socScale">
                    <option>Select Social Scale</option>
                    <option>5</option>
                    <option>4</option>
                    <option>3</option>
                    <option>2</option>
                    <option>1</option>
                    </select></div>
                </div>
                <div class="row">
                    <div class="col" style="padding:10px;"><select class="form-control" id="qolScale" name="qolScale">
                    <option>Select Quality of Life Scale</option>
                    <option>5</option>
                    <option>4</option>
                    <option>3</option>
                    <option>2</option>
                    <option>1</option>
                    </select></div>
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
    <script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
      });
}

var states = ["ALABAMA", "ALASKA", "ARIZONA", "ARKANSAS", "CALIFORNIA", "COLORADO", "CONNECTICUT", "DELAWARE", "FLORIDA", "GEORGIA", "HAWAII", "IDAHO", "ILLINOIS", "INDIANA", "IOWA", "KANSAS", "KENTUCKY", "LOUISIANA", "MAINE", "MARYLAND", "MASSACHUSETTS", "MICHIGAN", "MINNESOTA", "MISSISSIPPI", "MISSOURI", "MONTANA", "NEBRASKA", "NEVADA", "NEW HAMPSHIRE", "NEW JERSEY", "NEW MEXICO", "NEW YORK", "NORTH CAROLINA", "NORTH DAKOTA", "OHIO", "OKLAHOMA", "OREGON", "PENNSYLVANIA", "RHODE ISLAND", "SOUTH CAROLINA", "SOUTH DAKOTA", "TENNESSEE", "TEXAS", "UTAH", "VERMONT", "VIRGINIA", "WASHINGTON", "WEST VIRGINIA", "WISCONSIN", "WYOMING"];;

/*initiate the autocomplete function on the "myInput" element, and pass along the states array as possible autocomplete values:*/

autocomplete(document.getElementById("stateSearch"), states);



</script>
</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Intentional Relationships</title>
<link rel="icon" type="image/png" href="logo-no-text.png" />

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/round-about.css" rel="stylesheet">

<style>
.logo {
	width: 50px;
}
body {
    padding-top: 90px;
}
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}

</style>
</head>

<body style="background-color: #eeeeee; background-image: url('trasparent-texture.png');">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #5e5bb7;">
		<div class="container">
			<a id="logo" class="active navber-brand"
				href="/Intentional_Relationships/Home"> <img id="logo"
				class="logo" src="logo-no-text.png" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="/Intentional_Relationships/Home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/Intentional_Relationships/Matches">Matches</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/Intentional_Relationships/Login">Login</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">

		<!-- Introduction Row -->
		<h1 class="my-4">
			Your Matches! <small>See who is meant for you</small>
		</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint,
			explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam
			quod totam laudantium repudiandae obcaecati ea consectetur debitis
			velit facere nisi expedita vel?</p>

		<!-- Team Members Row -->
		<div class="row">
			<%@ page import="java.sql.DriverManager"%>
			<%@ page import="java.sql.ResultSet"%>

			<%@ page import="java.sql.Connection"%>
			<%@ page import="java.sql.Statement"%>
			<%
        try{
	      Class.forName("com.mysql.jdbc.Driver");

          Connection myConn = null;

          myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tmuir", "root", null);
          Statement mySts = myConn.createStatement();

          ResultSet myRes = mySts.executeQuery("SELECT * FROM `userData`");
	
          int i = 0;
          
          while(myRes.next() && i < 6){
            	out.println("<div class=\"col-lg-4 col-sm-6 text-center mb-4\"><img class=\"rounded-circle img-fluid d-block mx-auto\" src=\"http://placehold.it/200x200\" alt=\"\"><h3>" + myRes.getString("firstName") + " " + myRes.getString("lastName") + "<small><br>" + myRes.getString("username") + "</small></h3></div>");
				i++;
          }
        }
        catch(Exception ex){
          out.println("MySQL Error!");
        }
      %>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5" style="background-color: #5e5bb7;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2017</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>

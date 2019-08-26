<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%
    // Set response content type
    response.setContentType("text/html");
    // Set spanish language code.
    response.setHeader("Content-Language", "es");
    String title = "En Espaol";

%>

<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
<meta charset="utf-8" />
<title>Intentional Relationships</title>
<link rel="icon" type="image/png" href="logo-no-text.png" />

<link rel="stylesheet" type="text/css" href="style.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	background-color: #5e5bb7;
	background-image: url("trasparent-texture.png");
	background-repeat: repeat;
}

.picture-text {
	background-color: rgba(0, 0, 0, .5);
	color: #F2F7F2;
	font-size: 1.5em;
	height: auto;
	width: 1000px;
	transform: translate(-14%, -100%);
	-webkit-transform: translate(-14%, -100%);
}

.content-full {
	width: 1000px;
	transform: translate(-14%, 10%);
	-webkit-transform: translate(-14%, 10%);
	border-radius: 5px;
}

.content-mini {
	background-color: #F2F7F2;
	border-radius: 25em;
	padding: 1em;
	width: 90%;
}

.content-mini-text {
	background-color: #F2F7F2;
	color: #110A0E;
	font-size: 1.5em;
	height: auto;
	padding-top: 7em;
	transform: translate(0%, -50%);
	-webkit-transform: translate(0%, -50%);
	border-radius: .5em;
}

.content {
	background-color: #eeeeee;
	background-image: url("trasparent-texture.png");
	background-repeat: repeat;
}

.logo {
	width: 250px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class=""></div>
			<div class="navbar-header">
				<a class="active navber-brand" href="#welcome"> <img id="logo"
					class="logo" src="logo.png" />
				</a>
			</div>
			<ul class="nav navbar-nav" style="">
				<li><a href="#success_stories">Success Stories</a></li>
				<li><a href="#">Why you should join</a></li>
				<li><a href="/Intentional_Relationships/Login">Login</a></li>
				<li class="button button-warning"><a
					href="/Intentional_Relationships/Matches">Make Me Whole!</a></li>
			</ul>
			<div style="position: absolute; right: 10em;">
				<%@ page import="java.io.*,java.util.Locale" %>
				<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
				<% 
					Locale locale = new Locale("en", "US");
					out.println("<div>Current Language: " + locale.getLanguage().toUpperCase() + "</div>");
					
					if (request.getParameter("es") != null){
						locale = new Locale("es", "MX");
				  	}
					
				%>
				<button data-toggle="popover-en" data-trigger="focus" data-placement="bottom" data-content="This website is only supported in English">EN</button>
				<button href="#" data-toggle="popover-es" data-trigger="focus" data-placement="bottom" data-content="lo siento, este sitio web no est&#x00E1; traducido al ruso" style="padding: 0sem;">ES</button>
				<button href="#" data-toggle="popover-py" data-trigger="focus" data-placement="bottom" data-content="&#x0438;&#x0437;&#x0432;&#x0438;&#x043D;&#x0438;&#x0442;&#x0435;, &#x044D;&#x0442;&#x043E;&#x0442; &#x0441;&#x0430;&#x0439;&#x0442; &#x043D;&#x0435; &#x043F;&#x0435;&#x0440;&#x0435;&#x0432;&#x0435;&#x0434;&#x0435;&#x043D; &#x043D;&#x0430; &#x0440;&#x0443;&#x0441;&#x0441;&#x043A;&#x043E;&#x043C; &#x044F;&#x0437;&#x044B;&#x043A;&#x0435;">PY</button>
				<script>
					$(document).ready(function(){
					    $('[data-toggle="popover-en"]').popover();   
					});
				</script>
				<script>
					$(document).ready(function(){
					    $('[data-toggle="popover-es"]').popover(); 
					});
				</script>
				<script>	
					$(document).ready(function(){
					    $('[data-toggle="popover-py"]').popover();   
					});
				</script>
			</div>
		</div>
	</nav>
	<div id="content" class="container content">
		<div id="welcome" class="col-lg-offset-2 col-lg-8">
			<div class="text-center">
				<figure>
					<img class="content-full" src="sample-couple.jpg" />
					<div class="picture-text text-muted">
						<h1>Welcome</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
					</div>
				</figure>
			</div>
		</div>
		<div class="container"
			style="transform: translate(-5%, -7.5%); -webkit-transform: translate(-5%, -7.5%); width: 110%;">
			<div id="success_stories" class="text-center">
				<div class="col-lg-offset-1 col-lg-10" style="z-index: 1;">
					<figure class="col-lg-4">
						<img src="icon-sample.png" class="content-mini" />
					</figure>
					<figure class="col-lg-4">
						<img src="icon-sample.png" class="content-mini" />
					</figure>
					<figure class="col-lg-4">
						<img src="icon-sample.png" class="content-mini" />
					</figure>
				</div>
				<div class="col-lg-offset-1 col-lg-10"
					style="background-color: #F2F7F2; color: #110A0E; font-size: 1.5em; height: auto; padding-top: 7em; transform: translate(0%, -50%); -webkit-transform: translate(0%, -50%); border-radius: .5em;">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>
		</div>
		<div class="container"
			style="transform: translate(-5%, -15%); -webkit-transform: translate(-5%, -15%); width: 110%;">
			<div id="why_you_should_join" class="text-center">
				<div>
					<div class="col-lg-offset-1 col-lg-10 container">
						<figure class="col-lg-offset-6"
							style="width: 30%; -webkit-transform: translate(-50%); transform: translate(-50%);">
							<img src="icon-sample.png" class="content-mini"
								style="background-color: #5e5bb7;" />
						</figure>
					</div>
					<div class="col-lg-offset-1 col-lg-10 container"
						style="text-align: center; -webkit-transform: translate(0%, -40%); transform: translate(0%, -40%); z-index: 1;">
						<figure class="col-lg-offset-1 col-lg-4">
							<img src="icon-sample.png" class="content-mini"
								style="background-color: #5e5bb7;" />
						</figure>
						<figure class="col-lg-offset-2 col-lg-4">
							<img src="icon-sample.png" class="content-mini"
								style="background-color: #5e5bb7;" />
						</figure>
					</div>
				</div>
				<div class="col-lg-offset-1 col-lg-10"
					style="background-color: #F2F7F2; color: #110A0E; font-size: 3em; padding: 2em; padding-top: 4em; height: auto; transform: translate(0%, -50%); -webkit-transform: translate(0%, -50%); border-radius: .25em;">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
if computwer off
	then don be off; 
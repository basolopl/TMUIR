<html>
<head>
<meta charset="utf-8" />
<title>Intentional Relationships</title>
<link rel="icon" type="image/png" href="logo-no-text.png" />

<link rel="stylesheet" type="text/css" href="style.css" />

<script src="jquery-3.2.1.min.js"></script>

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
	background-color: #8E5572;
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
}

.content-full {
	width: 1000px;
	transform: translate(-14%, 10%);
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
	border-radius: .5em;
}

.content {
	background-color: #C2B97F;
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
				<li><a href="#">How to sign up</a></li>
			</ul>
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
			style="transform: translate(-5%, -7.5%); width: 110%;">
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
					style="background-color: #F2F7F2; color: #110A0E; font-size: 1.5em; height: auto; padding-top: 7em; transform: translate(0%, -50%); border-radius: .5em;">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>
		</div>
		<div class="container"
			style="transform: translate(-5%, -15%); width: 110%;">
			<div id="why_you_should_join" class="text-center">
				<div>
					<div class="col-lg-offset-1 col-lg-10 container">
						<figure class="col-lg-offset-6"
							style="width: 30%; transform: translate(-50%);">
							<img src="icon-sample.png" class="content-mini"
								style="background-color: #8E5572;" />
						</figure>
					</div>
					<div class="col-lg-offset-1 col-lg-10 container"
						style="text-align: center; transform: translate(0%, -40%); z-index: 1;">
						<figure class="col-lg-offset-1 col-lg-4">
							<img src="icon-sample.png" class="content-mini"
								style="background-color: #8E5572;" />
						</figure>
						<figure class="col-lg-offset-2 col-lg-4">
							<img src="icon-sample.png" class="content-mini"
								style="background-color: #8E5572;" />
						</figure>
					</div>
				</div>
				<div class="col-lg-offset-1 col-lg-10"
					style="background-color: #F2F7F2; color: #110A0E; font-size: 3em; padding: 2em; padding-top: 4em; height: auto; transform: translate(0%, -50%); border-radius: .25em;">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<html lang="en">
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

</style>
</head>

<body
	style="background-color: #eeeeee; background-image: url('trasparent-texture.png');">

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
					<li class="nav-item"><a class="nav-link" href="/Intentional_Relationships/Login">Login</span></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<%@ page import="com.tmuintentionalrelationships.BCrypt"%>
    <%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.ResultSet"%>

	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.PreparedStatement"%>
	<%
	try{
      Class.forName("com.mysql.jdbc.Driver");
         Connection myConn = null;
         
         myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tmuir", "root", null);
         
		  if (request.getParameter("register") != null){
			  String hashed = BCrypt.hashpw(request.getParameter("psw"), BCrypt.gensalt(12));
			  
	          PreparedStatement mySts = myConn.prepareStatement("INSERT INTO `userdata`(`username`, `password`, `firstName`, `lastName`) VALUES (?, ?, ?, ?)");
	          
	          mySts.setString(1, request.getParameter("uname"));
	          mySts.setString(2, hashed);
	          mySts.setString(3, request.getParameter("fname"));
	          mySts.setString(4, request.getParameter("lname"));			          
	
	          mySts.executeUpdate();
	  	  }

			
		if (request.getParameter("login") != null){
				  PreparedStatement mySts = myConn.prepareStatement("SELECT `password` FROM `userdata` WHERE `username` = ?");

		          mySts.setString(1, request.getParameter("uname"));
		          
		          ResultSet rs = mySts.executeQuery();
		
		          while(rs.next()){
		        	  if(BCrypt.checkpw(request.getParameter("psw"), rs.getString("password"))){
		        		  out.println("<div>good login</div>");
		        	  }
		          }
		  	  }
		  
      }
      catch(Exception ex){
      	  out.println("<div>" + ex + "</div>");
      }
	%>
	  	  
	  	  
	<div class="container text-center" style="background-color: #F2F7F2; border-radius: 1em; padding-bottom: 1em;">
		<div class="row" style="padding: 1em; text-align: center; display: block;">
    		<form id="" method="" action="">
			  <div class="imgcontainer" style="padding: 1em;">
			    <img src="http://placehold.it/200x200" alt="Avatar" class="avatar">
			  </div>
			
			  <div class="container">
			    <label><b>Username</b></label>
			    <input type="text" placeholder="Enter Username" name="uname" required>
			  </div>
			  <div class="container">
			    <label><b>Password</b></label>
			    <input type="password" placeholder="Enter Password" name="psw" required>
				
			    <button type="submit" name="login">Login</button>
			  </div>
			</form>
    		<form id="" method="" action="">
			  <div class="imgcontainer" style="padding: 1em;">
			    <img src="http://placehold.it/200x200" alt="Avatar" class="avatar">
			  </div>
			
			  <div class="container">			    
			    <label><b>First Name</b></label>
			    <input type="text" placeholder="First Name" name="fname" required>
			    
			    <label><b>Last Name</b></label>
			    <input type="text" placeholder="Last Name" name="lname" required>
				<div>
					<label><b>Username</b></label>
				    <input type="text" placeholder="Enter Username" name="uname" required>
				    
				    <label><b>Password</b></label>
				    <input type="password" placeholder="Enter Password" name="psw" required>
				</div>
				    <button type="submit" name="register">Register</button>
			  </div>
			</form>
    	</div>
	</div>
	
	<div class="container" style="background-color: #F2F7F2; border-radius: 1em; padding-bottom: 1em; transform: translate(0%, -100%);">
		
	</div>
	
	
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5" style="background-color: #5e5bb7;">
		<div class="container">
			<p class="m-1 text-center text-white">Copyright &copy; Your
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

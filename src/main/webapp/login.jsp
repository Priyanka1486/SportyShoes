<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
	</ul>
<h3>Login :</h3>
	<form action="login">	
		<label>Email</label><br />
		<input type="email" name="email" required="required"><br /><br />
		
		<label>Password</label><br>
		<input type="password" name="password" required="required"><br /><br />
		
		<input type="submit" value="login"> If new user <a href="registration.html" >Register</a> 
	</form>

</body>
</html>
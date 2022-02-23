<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head> 
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Admin </a></li>
	</ul>
<h3>Admin Login :</h3>
	<form action="adminlogin">	
		<c:set var="isAdmin" value="true" scope="session"></c:set>
		<label>Email</label><br />
		<input type="email" name="email" required="required"><br /><br />
		
		<label>Password</label><br>
		<input type="password" name="password" required="required"><br /><br />
		
		<input type="submit" value="login">
	</form>

</body>
</html>
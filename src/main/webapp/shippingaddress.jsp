<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shipping Address</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="home">Home</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
	<h1>Enter Shipping Address</h1>
	<form action="checkout">
	    <label for="society">Flat No and Society</label><br />
        <input type="text" id="fname" name="society" required="required" ><br /><br />
        
        <label for="city">City</label><br />
        <input type="text" id="city" name="city"  required="required" ><br /><br />
        
        <label for="pincode">Pin code</label><br />
        <input type="number" id="pincode" name="pincode" required="required"><br /><br />

        <label for="state">State</label><br />
        <input type="text" id="state" name="state" required="required"><br /><br />
	
	<input type="submit" value="Place Order">
	</form>
	
</body>
</html>
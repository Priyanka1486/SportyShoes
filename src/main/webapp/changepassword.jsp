<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<link rel="stylesheet" type="text/css" href="navbar.css" >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="category"> Category</a></li>
		<li><a href="products">Product</a></li>
		<li><a href="users">User</a></li>
		<li><a href="purchase">Purchase List</a></li>
		<li><a href="changepassword.jsp">Change Password</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
	<h3>Enter Password :</h3>
	<form action="changepassword" method="post">
		<label>Current Password</label><br />
		<input type="password" name="current_password" required="required"><br/><br />
		
		<label>New Password</label><br />
		<input type="password" name="new_password" required="required"><br/><br />
		
		<label>Confirm Password</label><br />
		<input type="password" name="confirm_password" required="required"><br/><br />
	
		<input type="submit" value="change Password">
	</form>

</body>
</html>
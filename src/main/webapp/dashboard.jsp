<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
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
		<li><a></a></li>
	</ul>
	<form action="searchuser">
		<h1>Total Users : <%= request.getAttribute("totaluser") %> </h1>
		<label for="User">Search User </label> <input type="search" name="searchname">
		<input type="submit" value="Search" />
	</form>

	<form action="searchorder">    
	   <h1>Total Orders : <%= request.getAttribute("totalorder") %> </h1>
	   <label for="category">Category :</label>
		<select name="category" id="category">
		  <option value="running">Running Shoes</option>
		  <option value="walking">Walking Shoes</option>
		  <option value="gym">Gym Shoes</option>
		  <option value="stylish">Stylish</option>
		</select><br /><br />
	<input type="search" name="searchdate" value="Date in mm-dd-yyyy format" autofocus="autofocus" onfocus="selected" >
	<input type="submit" value="Search" />
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
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
	</ul>

	<h1>Add New Product</h1>
	<form action="addnewproduct" method="post">
	    <label for="name">Product Name</label><br />
        <input type="text" id="name" name="name" pattern="[A-Z][a-z]*" title="Enter alphabets only" required="required" ><br /><br />
        
        <label for="price">Product Price</label><br />
        <input type="number" id="price" name="price" required="required" ><br /><br />
        
        <label for="category">Category :</label>
		<select name="category" id="category">
		  <option value="running">Running Shoes</option>
		  <option value="walking">Walking Shoes</option>
		  <option value="gym">Gym Shoes</option>
		  <option value="stylish">Stylish</option>
		</select><br /><br />
		<input type="submit" value="Submit">
	</form>
</body>
</html>
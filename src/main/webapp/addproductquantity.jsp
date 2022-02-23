<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product Quantity</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="category"> Category</a></li>
		<li><a href="products">Product</a></li>
		<li><a href="users">User</a></li>
		<li><a href="changepassword.jsp">Change Password</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>

	<h1>Add Product Quantity</h1>
	<form action="addproductquantity.jsp" >
		<label>Id</label><br />
		<input type="text" name="id" value="<%= request.getParameter("id") %>" readonly="readonly"><br /><br />
	    <label for="name">Product Name</label><br />
        <input type="text" id="name" name="name" value="<%= request.getParameter("name") %>" readonly="readonly" ><br /><br />
		<label for="name">Quantity</label><br />
		<input type="number" name="quantity"><br /><br />
		<input type="submit" value="Submit">
	</form>
</body>
</html>
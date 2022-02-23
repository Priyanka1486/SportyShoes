<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet" type="text/css" href="navbar.css">
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="admindashboard">Dashboard</a></li>
		<li><a href="category"> Category</a></li>
		<li><a href="products">Product</a></li>
		<li><a href="users">User</a></li>
		<li><a href="changepassword.jsp">Change Password</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
<form action="addnewproduct.jsp" >
	<h1>Product List</h1>
	<input type="submit" value="Add New"><br /><br />
	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Action</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr>
				<td>${product.id}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.quantity}</td>
				<td><a href="addproductquantity.jsp?id=${product.id}&name=${product.name}&quantity=${product.quantity}">Add Quantity</a></td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</body>
</html>
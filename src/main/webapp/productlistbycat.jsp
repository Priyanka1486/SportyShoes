<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="cartitems.jsp"> Cart</a></li>
		<li><a href="home">Home</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
	<h1>Product List</h1>
	<h2>Category : <%= request.getAttribute("category") %></h2>
	<form action="cartitems.jsp">
	<table>
		<tr>
			<th>Name</th>
			<th>Price</th>
			<th>Action</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td><a href="addtocart?id=${product.id}">Add to Cart</a></td>
			</tr>
		</c:forEach>
	</table><br />
	<input type="submit" value="Proceed">
	</form>	
</body>
</html>
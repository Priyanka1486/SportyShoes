<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Items</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="home">Home</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>

<form action="shippingaddress.jsp">
	<h1>Cart Items</h1>
	<table>
		<tr>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Action</th>
		</tr>
		<c:forEach var="cart" items="${carts}">
			<tr>
				<td>${cart.cartProduct.name}</td>
				<td>${cart.cartProduct.price}</td>
				<td>${cart.quantity}</td>
				<td>${cart.cartProduct.price * cart.quantity}</td>
				<c:set var="grandtotal" scope="request" value="${cart.cartProduct.price * cart.quantity + grandtotal}" ></c:set>
				<td><a href="removefromcart?id=${cart.cartProduct.id}">Remove</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td></td>
			<td></td>
			<c:set var="totalamount" scope="session" value="${grandtotal}" ></c:set>
			<td>Total Amount :</td><td> ${grandtotal}</td>
		</tr>
	</table><br />
	<input type="submit" value="checkout" >
</form>	
</body>
</html>
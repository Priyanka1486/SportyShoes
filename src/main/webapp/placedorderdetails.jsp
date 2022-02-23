<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page import="com.sportyshoes.controller.entities.Orders" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Placed Order Details</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="home">Home</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>

	<h1>Order Details</h1>
	<h2>Order Id : <% Orders o =(Orders)request.getAttribute("placedorder"); %>
	<%= o.getId() %>  </h2>
	<h3>Shipping Address : <%= o.getAddrs().getSociety()+" "+o.getAddrs().getCity()+" "+o.getAddrs().getPincode()+" "+o.getAddrs().getState()  %></h3>
		<table>
		<tr>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
		</tr>
		<c:forEach var="cart" items="${carts}">
			<tr>
				<td>${cart.cartProduct.name}</td>
				<td>${cart.cartProduct.price}</td>
				<td>${cart.quantity}</td>
				<td>${cart.cartProduct.price * cart.quantity}</td>
			</tr>
		</c:forEach>
		<tr>
			<td></td>
			<td>Total Amount :  </td>
			<td><%= o.getAmount() %></td>
			<td></td>
		</tr>
		<tr>
		</tr>
	</table>
</body>
</html>
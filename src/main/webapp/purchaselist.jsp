<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Purchase List</title>
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
	<h1>Purchase List : </h1>
	<table>
		<tr>
			<th>Id</th>
			<th>Date</th>
			<th>Address</th>
			<th>Amount</th>
			<th>Action</th>
		</tr>
		<c:forEach var="orders" items="${purchaselist}">
			<tr>
				<td>${orders.id}</td>
				<td>${orders.date}</td>
				<td>${orders.addrs.society}</td>
				<td>${orders.amount}</td>
				<td><a href="purchasedetails?id=${orders.id}" >View</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
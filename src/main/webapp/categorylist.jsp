<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category List</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
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
		<li><a href="purchase">Purchase List</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
<form action="addcategory.jsp">
	
	<h1>Category List</h1>
		<input type="submit" value="Add New"><br /><br />
	<table style="border:0px;padding: 0px;border-spacing: 0px; ">
		
		<tr style="background-color: #555;">
			<th>Id</th>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<c:forEach var="category" items="${categories}">
			<tr>
				<td>${category.id}</td>
				<td>${category.name}</td>
				<td><a href="deletecategory?id=${category.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</form>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="navbar.css"  >
</head>
<body>
	<ul>
		<li><a>Sportyshoes </a></li>
		<li><a>Welcome : <%= session.getAttribute("email") %></a></li>
		<li><a href="logout">Logout</a></li>
	</ul>
<h2>Categories</h2>
	<table>
		<tr>
			<th>Name</th>
		</tr>
		<c:forEach var="category" items="${categories}">
			<tr>
				<td><a href="productbycat?id=${category.id}" >${category.name}</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
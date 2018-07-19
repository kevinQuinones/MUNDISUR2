<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.*"%>
<% Employee x = (Employee)request.getAttribute("employee");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read</title>
<link rel="stylesheet" type="text/css" href="/Estilos/Estilo3.css">

</head>
<body>

<header> <h2> USUARIO</h2></header>
	
	<ul> 
		<li><a  href="../../index.html"> BEHIND</a></li>
	</ul>
	
	<div class="centro" align="center">
<table style="margin: 0 auto;">
	<thead>
<table >
	<tr>	  	
		<th>ID</th>
		<th> <%= x.getId()%> </th>
	</tr>
	<tr>
		<th>Name</th>
		<th> <%= x.getName()%> </th>
	</tr>
	<tr>
		<th>Email</th>
		<th> <%= x.getMail()%> </th>
	</tr>
	<tr>
		<th>Address</th>
		<th> <%= x.getAddress()%> </th>
	</tr>
	
	<tr>
		<th>Salary</th>
		<th> <%= x.getSalary()%> </th>
	</tr>
	<tr>
		<th>Gender</th>
		<th> <%= x.getGender()%> </th>
	</tr>
	<tr>
		<th>Age</th>
		<th> <%= x.getAge()%> </th>
	</tr>
	<tr>
		<th>Phone</th>
		<th> <%= x.getPhone()%> </th>
	</tr>
	

</table>

</div>
</body>
</html>
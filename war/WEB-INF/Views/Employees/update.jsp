<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.*"%>
<% Employee employee = (Employee)request.getAttribute("employee");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
<link rel="stylesheet" type="text/css" href="/Estilos/Estilo3.css">
</head>
<body>
	<header> <h1> ACTUALIZAR </h1></header>
	<ul> 
		<li><a  href="../../index.html"> INICIO</a></li>
	</ul>
	<br>
	<div class="centro" align="center">
	<table style="margin: 0 auto;">
	
	<table>
	
	<form method="get" action="/employees/update">
	<input type="hidden" name="action" value="Updated"/>
	<input type="hidden" name="employeeId" value="<%=employee.getId()%>"/>
		<thead>
			<tr>
				<th>Actualizar Datos</th>
			</tr>
		</thead>
	
			<tr>
				<th>Name: <input type="text" name="name" value="<%=employee.getName()%>" required ></th>
			</tr>
			<tr>
				<th>Mail: <input type="email" name="mail" value="<%=employee.getMail()%>" required ></th>
			</tr>
			<tr>
				<th>Address: <input type="text" name="address" value="<%=employee.getAddress()%>" required ></th>
			</tr>
			<tr>
				<th>Salary: <input type="number" name="salary" value="<%=employee.getSalary()%>" required ></th>
			</tr>
			<tr>
				<th>Gender: <input type="text" name="gender" value="<%=employee.getGender()%>" required ></th>
			</tr>
			<tr>
				<th>Age: <input type="number" name="age" value="<%=employee.getAge()%>" required ></th>
			</tr>
			<tr>
				<th>Phone: <input type="number" name="phone" value="<%=employee.getPhone()%>" required ></th>
			</tr>
			<tr>
				<th><input type="submit" value="enviar datos"></th>
			</tr>
		
	
	</form>
	</table>
</div>
</body>
</html>
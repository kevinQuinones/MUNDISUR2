<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%
	List<Employee> employees = (List<Employee>) request.getAttribute("employees");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employees</title>
<link rel="stylesheet" type="text/css" href="/Estilos/Estilo3.css">

</head>
<body>

	<header>
		<h1>Empleados</h1>
	</header>
	<ul>
		<li><a href="employees/add?action=creating">Añadir empleado</a></li>
	</ul>

	<ul>
		<li><a href='../'>Retroceder</a></li>
	</ul>
	<br>
	<center>
		<div class="centro">
			<table style="margin: 0 auto;">
				<thead>
					<table>
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Mail</th>
								<th>Address</th>
								<th>Salary</th>
								<th>Gender</th>
								<th>Age</th>
								<th>Status</th>
								<th>Phone</th>
								<th>READ</th>
								<th>UPDATE</th>
								<th>DELETE</th>
							</tr>
						</thead>
						<%
							for (int i = 0; i < employees.size(); i++) {
						%>
						<%
							Employee x = (Employee) employees.get(i);
						%>
						<tr>
							<td><%=x.getId()%></td>
							<td><%=x.getName()%></td>
							<td><%=x.getMail()%></td>
							<td><%=x.getAddress()%></td>
							<td><%=x.getSalary()%></td>
							<td><%=x.getGender()%></td>
							<td><%=x.getAge()%></td>
							<td><%=x.isStatus()%></td>
							<td><%=x.getPhone()%></td>
							<td><a
								href="employees/view?action=reading&employeeId=<%=x.getId()%>">read</a></td>
							<td><a
								href="employees/update?action=updating&employeeId=<%=x.getId()%>">update</a></td>
							<td><a
								href="employees/delete?action=deleting&employeeId=<%=x.getId()%>">delete</a></td>
						</tr>
						<% } %>
					</table>
					</div>
					</center>
					<br>
					<br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.products.IndexController"%>
<%@ page import="model.entity.*"%>
<%List<Product> users = (List<Product>)request.getAttribute("users");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel="stylesheet" type="text/css" href="../../indexEstilo.css"> 
		<title>Lista de Productos</title>
	</head>
	<body>
	 	 <header>
<div class="contenedor">
	<div id="marca">
		<h1> Productos</h1>
</div>
<nav>
	<ul>
		<li class="actual"><a href="../../index.html"> Inicio </a></li>
		<li><a href="/roles">Roles  </a></li>
		<li><a href="/users"> Usuarios</a></li>
		<li><a href="/access">Accesos  </a></li>
		<li><a href="/resources"> Recursos</a></li>
			<li><a href="/products"> Productos</a></li>
			<li><a href="/employees"> Empleados</a></li>	
		<li><a href="/products/saled"> Productos mas vendidos</a></li>		
		<li><a href="/users/login"> LogIn </a></li>
		<li><a href="/users/logout"> LogOut </a></li>
	</ul>
</nav>
</header>
		<div id="table">
			<% if (users.isEmpty()){ %>
				<p>No se encuentran productos</p>
			<%} else { %>
			<div  id="tabla">
				<table >
				<thead>
					<tr >
						<th>ID</th>
						<th>Nombre</th>
						<th>Costo de Fabrica </th>
						<th>Costo de Venta </th>
						<th>Cantidad</th>
						<th>Codigo</th>
						<th>Marca</th>
						<th>Ganancia</th>
					</tr>
					</thead>
				<% for (Product us: users){%>
				<tr >
						<td><a href="/products/view?id=<%=us.getId()%>"><%=us.getId()%></a></td>
						<td><%=us.getNombre() %></td>
						<td><%=us.getCostI() %></td>
						<td><%=us.getCostF() %></td>
						<td><%=us.getstock() %></td>
						<td><%=us.getCode() %></td>
						<td><%=us.getBrand() %></td>
						<td><%=us.getEarnings() %></td>
					</tr>
				<%} %>
				</table>
				</div>
			<%} %>
		</div>
			<a id="add"href="/products/add" title="Crear Producto" id="volver">Crear Productos</a>
			<a id="add"href="/products/saled" title="Mas vendidos" id="volver">Ver productos más vendidos</a>
			
	</body>
</html>
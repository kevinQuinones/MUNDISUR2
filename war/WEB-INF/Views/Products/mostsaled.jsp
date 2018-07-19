<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.products.SaledController"%>
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
			<%int cont=1; %>
				<table >
				<thead>
					<tr >
						<th>      </th>
						<th>Nombre</th>
						<th>Cantidad de ventas registradas</th>
						<th>Utilidades</th>
					</tr>
					</thead>
				<% for (int i=users.size()-1;i>=0;i--){%>
				<tr >
						<td><%=cont %></td>
						<td><%=users.get(i).getNombre() %></td>
						<td><%=users.get(i).getSaled() %></td>
						<td><%=users.get(i).getSaled()*users.get(i).getEarnings() %></td>
					</tr>
					<% cont++;%>
				<%} %>
				</table>
				</div>
			<%} %>
		</div>
			<a id="add"href="/products/add" title="Crear Producto" id="volver">Crear Productos</a>
	</body>
</html>
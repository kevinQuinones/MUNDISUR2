<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import ="model.entity.*" %>
	<%Product user = (Product)request.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel="stylesheet" type="text/css" href="../../viewEstilo.css"> 
		<title>Usuario: <%=user.getId() %></title>
		
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
		<a id="add"href="/products" title="Lista de Productos"  style="color:#ffffff;"> Lista de Productos</a>
		<div id="table">
			<h1 id="id" name="<%=user.getId() %>" style="color:#ffffff;">Producto: </h1>
			<table>
				<tr>
					<td>ID</td>
					<td><%=user.getId() %></td>
				</tr>
					<tr>
					<td>Nombre</td>
					<td><%=user.getNombre() %></td>
				</tr>
				<tr>
					<td>Costo de Fabrica</td>
					<td><%=user.getCostI() %></td>
				</tr>
				<tr>
					<td>Costo de Venta</td>
					<td><%=user.getCostF() %></td>
				</tr>
				<tr>
					<td>Cantidad</td>
					<td><%=user.getstock() %></td>
				</tr>	
				<tr>
					<td>Codigo</td>
					<td><%=user.getCode() %></td>
				</tr>
				<tr>
					<td>Marca</td>
					<td><%=user.getBrand() %></td>
				</tr>
			</table>
		</div>
		<br><br>
		<div id="action">
				<a href="/products/edit?id=<%=user.getId() %>" id="volver" >Editar</a>
				<form action="/products/delete" method="post">
					<input type="hidden" value="<%=user.getId() %>" name="id">
					<input type="submit" value="Eliminar">
				</form>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import ="model.entity.*" %>
	<%@page import ="java.util.Date" %>
	<%Product invoice = (Product)request.getAttribute("invoice"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Editar Usuario: <%=invoice.getId() %></title>
			<link rel="stylesheet" type="text/css" href="../../editEstilo.css"> 
			
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
			<form action="/products/edit" method="post">
				<h1>Editar </h1>
				 <label for="nombre"> Nombre:</label>
			    <input type="text" name="nombre" id="nombre" placeholder="nombre" value="<%=invoice.getNombre() %>" required> <br><br><br>
				<label for="costI"> Costo de fabrica:</label>
				<input type="number" name="costI" id="costoI" placeholder="Ingrese el costo de fabrica" value="<%=invoice.getCostI() %>" required> <br><br><br>
				<label for="costF"> Costo de venta:</label>
				<input type="number" name="costF" id="costoF" placeholder="Ingrese el costo de venta " value="<%=invoice.getCostF() %>" required> <br><br><br>
				<input type="hidden" name="id" value="<%=invoice.getId() %>">
				<label for="code"> Codigo:</label>
			    <input type="number" id="code" name="code" placeholder="Edite el codigo" value="<%=invoice.getCode() %>" required> <br><br><br>
			    <label for="stock"> Cantidad:</label>
			    <input type="number" id="stock" name="stock" placeholder="Edite la cantidad" value="<%=invoice.getstock() %>" required> <br><br><br>
			    <label for="brand"> Marca:</label>
			    <input type="text" id="brand" name="brand" placeholder="Edite la marca" value="<%=invoice.getBrand() %>" required> <br><br><br>
				<input type="submit" value="Editar">
			</form>
		</div>
			<a id="add"href="/products" title="Lista de Productos" style="color:#ffffff;"><b>Lista de Productos<b> </a>
	</body>
</html>
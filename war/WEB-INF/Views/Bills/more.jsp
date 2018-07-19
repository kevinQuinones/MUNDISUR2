<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.entity.*"%>
<%@page import="java.util.List"%>
<%
	List<Product> rs = (List<Product>) request.getAttribute("products");
	long idBill= (Long)(request.getAttribute("idBill"));  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../../indexEstilo.css"> 
<title>Ingrese otro producto</title>
</head>
<body>
<header>
		<div class="contenedor">
			<div id="marca">
				<h1>Facturas</h1>
			</div>
			<nav>
				<ul>
					<li class="actual"><a href="../index.html"> Inicio </a></li>
					<li><a href="/bills/add">Añadir </a></li>
					<li><a href="/bills"> Mostrar </a></li>
					<li><a href="/users"> Usuarios</a></li>
					<li><a href="/access">Accesos </a></li>
					<li><a href="/products">Productos </a></li>
					<li><a href="/resources">Recursos </a></li>
					<li><a href="/employees"> Empleados</a></li>	
					<li><a href="/products/saled"> Productos mas vendidos</a></li>	
					<li><a href="/users/login"> LogIn </a></li>
					<li><a href="/users/logout"> LogOut </a></li>
				</ul>
			</nav>
	</header>
	<form action="/bills/more" method="post" >

			<label>Seleccionar Producto: </label> <select name="product">
				<%
					for (Product r : rs) {
				%>
				<option value="<%=r.getId()%>"><%=r.getNombre() + "/" + r.getBrand()%></option>
				<%
					}
				%>
			</select> <br> <br> 
			<input type="number" name="quant"
				placeholder="Cantidad" required> <br> <br> <br>
			<input type="hidden" name="idBill" value="<%=idBill %>">
			<br><br><input type="radio"
				name="more" id="true" value="true" checked> <label
				for="true">Enviar</label> <input type="radio" name="more"
				id="false" value="false"> <label for="false">Añadir más compras</label><br>
			<br> <br> <input type="submit" value="Enviar" name="Enviar"><br><br>
				
	</form>

</body>
</html>
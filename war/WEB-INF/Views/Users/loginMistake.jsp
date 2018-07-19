<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Usuarios</title>
</head>
<body>
 <header>
<div class="contenedor">
	<div id="marca">
		<h1> Error al ingresar</h1>
</div>
<nav>
	<ul>
		<li class="actual"><a href="../../index.html"> Inicio </a></li>
		<li><a href="/roles">Roles  </a></li>
		<li><a href="/users"> Usuarios</a></li>
		<li><a href="/access">Accesos  </a></li>
		<li><a href="/resources"> Recursos</a></li>
		<li><a href="/bills"> Facturas</a></li>
		<li><a href="/employees"> Empleados</a></li>	
		<li><a href="/products"> Products</a></li>	
		<li><a href="/products/saled"> Productos mas vendidos</a></li>		
		<li><a href="/users/login"> LogIn </a></li>
		<li><a href="/users/logout"> LogOut </a></li>
	</ul>
</nav>
</header>
	<div id="table">
	<%String respuesta = (String)request.getAttribute("respuesta"); %>
	<%=respuesta %>
	</div>
</body>
</html>

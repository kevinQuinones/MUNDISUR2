<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Añadir Producto</title>
		<link rel="stylesheet" type="text/css" href="../../addEstilo.css"> 
		<script>
	function comprobar() {

		var costi = document.formu.costI.value;
		var costf = document.formu.costF.value;
		if (costf<costi) {
			alert("No es un Costo de venta valido!!");
			return false;
		} else {
			document.forms['formu']['Enviar'].disabled = true;
		}
		return true;
	}
</script>
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
		<li><a href="/employees"> Empleados</a></li>
		<li><a href="/bills">Facturas  </a></li>
		<li><a href="/products"> Productos</a></li>
		<li><a href="/products/saled"> Productos mas vendidos</a></li>	
	
		<li><a href="/users/login"> LogIn </a></li>
		<li><a href="/users/logout"> LogOut </a></li>
	</ul>
</nav>
</header>
		<div id="table">
			<form action="/products/add" method="post" name="formu"
			id="formu" onsubmit="return comprobar()">
				<h1>Crear</h1>
				<label for="code"> Codigo:</label>
				<input type="number" name="code" id="code" placeholder="Ingrese el código" required> <br><br><br>
				<label for="costI"> Costo de Fabrica:</label>
				<input type="number" name="costI"  step="any" id="costI" placeholder="Ingrese el costo de fábrica" required> <br><br><br>
				<label for="costF"> Costo de Venta:</label>
				<input type="number" name="costF"  step="any" id="costF" placeholder="Ingrese el costo de venta" required> <br><br><br>
				<label for="quant"> Cantidad:</label>
				<input type="number" name="quant" id="quant" placeholder="Ingrese la cantidad" required> <br><br><br>
				<label for="nombre"> Nombre:</label>
				<input type="text" name="nombre" id="nombre" placeholder="Ingrese el nombre" required> <br><br><br>
				<label for="brand"> Marca:</label>
				<input type="text" name="brand" id="brand" placeholder="Ingrese la marca " required> <br><br><br>
				<input type="submit" value="CREAR">
				<a id="add"href="/products" title="Ver Productos"  style="color:#000000;" >Ver todos los productos</a>
			</form>
		</div>
	</body>
</html>
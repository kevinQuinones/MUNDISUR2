<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creating employee</title>
<link rel="stylesheet" type="text/css" href="/Estilos/Estilo2.css">
</head>
<body>
	<ul> 
		<li><a  href="employees">INDEX</a></li>
	</ul>
	
	<ul> 
		<li><a href='../'>BEHIND</a></li>
	</ul>
	<br>

<header> <h2> CREATE EMPLOYEES</h2></header>
   
    <section class="cuerpo">
    	<form action="/employees/add" method ="Get">
    	<input type="hidden" name="action" value="Created"/>
 			<h3>
    		<label >Name</label>
    		<input type ="text" name ="name" id="itName" required> 
    		

    		<label >Mail</label>
    		<input type ="email" name ="mail"  id="itMail" required>

 			
 
    		<label >Address</label>
    		<input type ="text" name ="address" id="itAdress" required> 
    
    		
    		<label >Salary</label>
    		<input type ="number" name ="salary" id="itSalary" required> 
    		
    		
    		Hombre <input type="radio" name="gender" id="itGender"value="hombre" required />Mujer<input type="radio" name="gender"  id="itGender"value="mujer" required />
    		
    		
    		<label >Age</label>
    		<input type ="number" name ="age"  id="itAge"  required>
    		
    			
    		<label >Phone</label>
    		<input type ="number" name ="phone"  required>
    		

    		<input type ="submit" value="submit" >
    		 </h3>
    	</form>
	</section>	
    		<footer>				
    		</footer>
</body>
</html>
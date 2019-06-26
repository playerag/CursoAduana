<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!ServicioLocal servicio;%>
<%
	InitialContext ctx = new InitialContext();
	servicio = (ServicioLocal) ctx
			.lookup("java:global/02EJB/Servicio!cl.model.ServicioLocal");
%>
<c:set var="servicio" scope="page" value="<%=servicio%>" />
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body class="blue">
	<div class="row">
		<div class="col s6 offset-s3">
			<div class="card-panel">

		<p class="center-aling"> Registro clientes</p>
		<form action ="control.do" method ="post">
		
				<div class="input-field">
					<i class="material-icons prefix">account_circle</i> <input
						id="nombre" type="text" name="nombre" > <label
						for="nombre">Nombre</label>
				</div>
				<div class="input-field">
					<i class="material-icons prefix">account_circle</i> <input
						id="apellido" type="text" name="apellido"> <label
						for="apellido">apellido</label>
				</div>
				
				<div class="input-field">
					<i class="material-icons prefix">account_circle</i> <input
						id="rut" type="text" name="rut" > <label
						for="rut">Rut</label>
				</div>
			
				<button name="boton" value="guardar" type="submit" class="btn right">
				Guardar
					</button>
					<br></br>
		</form>			
					
				<table class="bordered hoverable">
					<tr>
						<td>Nombre</td>
						<td>apellido</td>
						<td>Rut</td>
						<th></th>
						<th></th>
						
					</tr>
					<c:forEach items="${servicio.clientes}" var="c">
						<tr>
							<Td>${c.nombre}</Td>
							<Td>${c.apellido}</Td>
							<Td>${c.rut}</Td>
							<td>
							<a href="actualizar.jsp?rut=${c.rut }&nombre=${c.nombre}&apellido=${c.apellido}" class ="btn-floating red">
								<i class="material-icons">mode_edit</i>
							</a>
							</td>
							
							
							
							<td>
							<a href="eliminar.jsp?rut=${c.rut }&nombre=${c.nombre}&apellido=${c.apellido}" class ="btn-floating red">
								<i class="material-icons"> delete</i>
							</a>
							</td>
							
							
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>
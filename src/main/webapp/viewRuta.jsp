<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ruta</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="/stylesheets/mainStyle.css"/>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
		  <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header">
		    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		      <span class="sr-only">Toggle navigation</span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		    </button>
		    <a class="navbar-brand" href="#">Walkers</a>
		  </div>

	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li>
	        	<a href="/index.jsp">Inicio<span class="sr-only">(current)</span></a>
	        </li>
	        <li class="active">
	        	<a href="/RutaServlet?action=listRuta">Mis senderos</a>
	        </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li>
				<%
		    		UserService userService = UserServiceFactory.getUserService();
		    		User user = userService.getCurrentUser();
		    		if (user != null) {
		        		pageContext.setAttribute("user", user);
				%>
			       		<p class="navbar-text">${fn:escapeXml(user.nickname)} 
			       	    	<a class="navbar-link" href="<%= userService.createLogoutURL("/") %>"><span class="glyphicon glyphicon-log-out"></span></a>
			       	    </p> 
				<%
					} else {
				%>
						<a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Sign in</a>
				<%
					}
				%>	
	      	</li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 panel panel-default">
				<h2 class="text-center"><c:out value="${ruta.nombre}" /></h2>
				<form action="/RutaServlet" method="post" class="form-horizontal">
				   	<br /><br />
				   	<div class="form-group">
						<label class="col-sm-2 control-label">Nombre</label>
						<div class="col-sm-8">			
							<input class="form-control" id="nombre" type="text" name="nombre" placeholder="Introduce el nombre" required="" disabled value="<c:out value="${ruta.nombre}" />"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Dificultad</label>
						<div class="col-sm-8">
							<input class="form-control" id="dificultad" type="number" min="5" max="10" name="dificultad" placeholder="Introduce la dificultad" required="" disabled value="<c:out value="${ruta.dificultad}" />" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Puntuación</label>
						<div class="col-sm-8">
							<input class="form-control" id="puntuacion" type="number" min="5" max="10" name="puntuacion" placeholder="Introduce la puntuación" required="" disabled value="<c:out value="${ruta.puntuacion}" />"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Información</label>
			        	<div class="col-sm-8">
			        		<textarea class="form-control" id="informacion" name="informacion" rows="5" placeholder="Introduce información de interés" required="" disabled><c:out value="${ruta.informacion}" /></textarea>
			        	</div>
			        </div>
			        <div class="form-group">
		    			<div class="col-sm-offset-2 col-sm-8">
							<a href="/RutaServlet?action=listRuta" class="btn btn-default center">Atrás</a>
						</div>
					</div>
					<input class="form-control" type="hidden" id="id" type="text" name="id" readonly="readonly" value="<c:out value="${ruta.id}" />" />
				</form>
    
    		</div>
    	</div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
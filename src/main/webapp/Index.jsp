<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Walkers</title>
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
		    	<a class="navbar-brand" href="/">Walkers</a>
		  	</div>
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="nav navbar-nav">
			    	<li class="active">
			        	<a href="/">Inicio<span class="sr-only">(current)</span></a>
			        </li>
			        <li>
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
					       	    	<a class="navbar-link" href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-out"></span></a>
					       	    </p> 
						<%
							} else {
						%>
								<a href="<%= userService.createLoginURL("/RutaServlet") %>"><span class="glyphicon glyphicon-log-in"></span> Sign in</a>
						<%
							}
						%>	
			      	</li>
				</ul>
		    </div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	<div class="container">
		<div class="starter-template">
			<div id="contenedor-logo">
				<img id="logo" src="stylesheets/logo.png" ALT="logo">
			</div>
			<h1>Walkers</h1>
	       	<h3>BIENVENIDO A LA RED SOCIAL DEDICADA AL MUNDO DEL SENDERISMO</h3>
	        <h4>Comienza la aventura...</h4>
	      	<p class="lead">Puedes añadir tus rutas preferidas <a href="/RutaServlet?action=insert"><span class="enlaceIndex">aquí</span></a><br>También puedes visualizar tus rutas en la pestaña <a href="/RutaServlet?action=listRuta"><span class="enlaceIndex">mis senderos</span></a></p>
	    </div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
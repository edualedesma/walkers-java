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
	<link rel="stylesheet" type="text/css" href="/stylesheets/bootstrap.min.css" />
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
	        <li class="active">
	        	<a href="#">Inicio<span class="sr-only">(current)</span></a>
	        </li>
	        <li>
	        	<a href="/AddRutaServlet?action=listRuta">Mis senderos</a>
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
			       		<p class="navbar-text">Dear ${fn:escapeXml(user.nickname)}, You can
			       	    	<a class="navbar-link" href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Sign out</a>
			       	    </p> 
				<%
					} else {
				%>
						<a href="<%= userService.createLoginURL(request.getRequestURI()) %>" class="btn btn-default navbar-btn">Sign in</a>
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
		
				<form action="/AddRutaServlet" method="post" class="form-horizontal">
				   	<br /><br />
				   	<div class="form-group">
						<label class="col-sm-2 control-label">Nombre</label>
						<div class="col-sm-8">			
							<input class="form-control" id="nombre" type="text" name="nombre" placeholder="Introduce your nickname"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Dificultad</label>
						<div class="col-sm-8">
							<input class="form-control" id="dificultad" type="text" name="dificultad" placeholder="Introduce the name of the  subjet" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Información</label>
			        	<div class="col-sm-8">
			        		<textarea class="form-control" id="informacion" name="informacion" rows="5" placeholder="Introduce your valuable comments about the subject"></textarea>
			        	</div>
			        </div>
			        <div class="form-group">
		    			<div class="col-sm-offset-2 col-sm-8">
							<button id="boton" type="submit" class="btn btn-default center">Añadir</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
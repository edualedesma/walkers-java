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
	<title>Mis rutas</title>
	<!--<link rel="stylesheet" type="text/css" href="/stylesheets/bootstrap.min.css" />-->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="/stylesheets/mainStyle.css"/>
</head>
<body>
	<div class="container">
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
			    <a class="navbar-brand" href="/Index.jsp">Walkers</a>
			  </div>
	
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li>
		        	<a href="/Index.jsp">Inicio<span class="sr-only">(current)</span></a>
		        </li>
		        <li class="active">
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
	
	

		<div class="row">
			<div class="col-md-6 col-md-offset-3 panel panel-default">
				<table class="table table-stripe table-hover">
			        <thead>
			            <tr>
			                <th>Id</th>
			                <th>Nombre</th>
			                <th>Información</th>
			                <th>Dificultad</th>
			                <th>Puntuación</th>
			                <th colspan=2>Action</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach items="${rutas}" var="ruta">
			                <tr>
			                    <td><c:out value="${ruta.id}" /></td>
			                    <td><c:out value="${ruta.nombre}" /></td>
			                    <td><c:out value="${ruta.informacion}" /></td>
			                    <td><c:out value="${ruta.dificultad}" /></td>
			                    <td><c:out value="${ruta.puntuacion}" /></td>
			                    <td><a href="AddRutaServlet?action=edit&id=<c:out value="${ruta.id}"/>"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td>
			                    <td><a href="AddRutaServlet?action=delete&id=<c:out value="${ruta.id}"/>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
    			<p><a class="btn btn-success" href="AddRutaServlet?action=insert"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Añadir ruta</a></p>
    		</div>
    	</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
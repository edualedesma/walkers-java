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
	        	<a href="#">Mis senderos</a>
	        </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li>
	      		<form action="/Registro.jsp" method="get" class="form-horizontal">
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
				</form>
	      	</li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
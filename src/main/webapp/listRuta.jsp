<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mis rutas</title>
</head>
<body>
	<table border=1>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Información</th>
                <th>BLABLA</th>
                <th>BLEBLE</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${rutas}" var="ruta">
                <tr>
                    <td><c:out value="${ruta.id}" /></td>
                    <td><c:out value="${ruta.nombre}" /></td>
                    <td><c:out value="${ruta.informacion}" /></td>
                    <td><c:out value="jajaja" /></td>
                    <td><c:out value="jejeje" /></td>
                    <td><a href="addRutaServlet?action=edit&id=<c:out value="${ruta.id}"/>">Update</a></td>
                    <td><a href="addRutaServlet?action=delete&id=<c:out value="${ruta.id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert">Add User</a></p>
</body>
</html>
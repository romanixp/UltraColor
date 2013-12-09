<%-- 
    Document   : main
    Created on : 26-nov-2013, 18:16:06
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/ultracolor.css'/>"/>
        <title>Administrador</title>
    </head>
    <body>
        <div id="contenedor" >
            <%@include file="/WEB-INF/include/header.jsp" %>
            
            
            <a href="<c:url value='/FinalizarSession' />">Salir</a>
            
            <table width="318">
                <tr>
                    <td width="67">Usuario:</td>
                    <td width="239">${sessionScope.personalTO.nombre}</td>
                </tr>
            </table>   
                
            <h2>Esta es la pagina principal de administracion</h2>
            <h3>Panel de administración</h3>
            <ul>
                <li><a href="">Productos</a></li>
                <li><a>Servicios</a></li>
                <li><a>Usuarios</a></li>
                <li><a href="gestion/gestionPersonal.jsp">Personal</a></li
                <li><a>Proveedores</a></li>
                <li><a>Reportes</a></li>
                <li><a href="<c:url value='/Pedido'/>">Pedidos</a></li>
            </ul>

            
            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>



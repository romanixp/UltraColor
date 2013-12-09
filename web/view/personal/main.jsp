<%-- 
    Document   : main
    Created on : 27-nov-2013, 10:25:57
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <link rel="stylesheet" type="text/css" href="../../css/ultracolor.css"/>

        <title>Personal</title>

    </head>
    <body>
        <div id="contenedor" >
            <%@include file="/WEB-INF/include/header.jsp" %>
            <a href="<c:url value='/FinalizarSession' />">Salir</a>
            <h2>Esta es la pagina principal del personal que hace la facturacion</h2>
            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

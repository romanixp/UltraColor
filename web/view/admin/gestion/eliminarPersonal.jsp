<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        <meta http-pathequiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/ultracolor.css'/>"/>
        <title>Consultar Personal</title>
    </head>
    <body>
        <div id="contenedor" >
            <!--Cabecera-->
            <%@include file="/WEB-INF/include/header.jsp" %>

            <h2>Eliminar Personal</h2>
            
            <table border="1">
                <tr>
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>Apellidos</td>
                    <td>DNI</td>
                    <td>Fecha Nacimiento</td>
                    <td>Dirección</td>
                    <td>Celular</td>
                    <td>Red privada</td>
                    <td>Observaciones</td>


                </tr>
                <c:forEach var="personalTO" items="${requestScope.personalTO}">
                    <tr>                        
                        <td>${personalTO.getCodigo() }</td>
                        <td>${personalTO.getNombre() }</td>
                        <td>${personalTO.getApellidos() }</td>
                        <td>${personalTO.getDni() }</td>
                        <td>${personalTO.getFechaNacimiento() }</td>
                        <td>${personalTO.getDireccion() }</td>
                        <td>${personalTO.getCelular() }</td>
                        <td>${personalTO.getRp() }</td>
                        <td>${personalTO.getCorreo() }</td>
                        <td>${personalTO.getObservaciones() }</td>                               
                    </tr>
                </c:forEach>  
            </table>

            <p>¿Está seguro de quitar a ${personalTO[0].getNombre()} ${personalTO[0].getApellidos()}?</p>

            <a href="<c:url value='gestionPersonal.jsp'/>">Cancelar</a>

            <a href="<c:url value='/EliminarPersonal?codigo=${personalTO[0].getCodigo()}&confirm=si'/>">Eliminar</a>


            <c:if test="${! empty requestScope.mensaje}">
                <div id="mensaje">Mensaje: ${requestScope.mensaje}</div>
            </c:if>
            <c:if test="${! empty requestScope.error}">
                <div class="error" id="error">Error: ${requestScope.error}</div>
            </c:if>
            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

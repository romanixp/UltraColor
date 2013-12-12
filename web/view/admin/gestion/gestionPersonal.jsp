<%-- 
    Document   : gestionPersonal
    Created on : 27-nov-2013, 13:06:57
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        <meta http-pathequiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/ultracolor.css'/>"/>
        <title>Gestion de personal</title>
    </head>
    <body>
        <div id="contenedor" >
            <c:if test="${! empty requestScope.mensaje}">
                <div id="mensaje">Mensaje: ${requestScope.mensaje}</div>
            </c:if>
            <c:if test="${! empty requestScope.error}">
                <div class="error" id="error">Error: ${requestScope.error}</div>
            </c:if>

            

            <h1>Gestion de personal</h1>
            
            <table width="318">
                <tr>
                    <td width="67">Usuario:</td>
                    <td width="239">${sessionScope.personalTO.nombre}</td>
                </tr>
            </table> 
            <a href="<c:url value='/view/admin/main.jsp' />">Volver principal</a>
            <ul>
                <li><a href="<c:url value='agregarPersonal.jsp'/>">Agregar personal</a></li>

                <form name="form1" method="post" action="<c:url value='/ConsultarPersonal'/>">                             
                    <li>
                        <input type="text" name="valor" id="valor" value="" >                    
                        <select name="campo" id="campo">
                            <option value="DNI" >DNI</option>                    
                            <option value="Nombre" >Nombre</option>                    
                            <option value="Apellido" >Apellido</option>                    
                        </select>
                        <input type="submit" name="buscarPersonal" id="buscarPersonal" value="consultar">
                    </li>
                </form>
            </ul>
            <c:if test="${ requestScope.tam > 0}">
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
                        <td>${ PersonalController}</td>

                    </tr>
                    <c:forEach var="personalTO" items="${requestScope.personalTO}">
                        <tr>      
                            <td> <input type="text" name="codigo" size="12" maxlength="5" I value="${personalTO.getCodigo() }" > </td>                            
                            <td>${personalTO.getNombre() }</td>
                            <td>${personalTO.getApellidos() }</td>
                            <td>${personalTO.getDni() }</td>
                            <td>${personalTO.getFechaNacimiento() }</td>
                            <td>${personalTO.getDireccion() }</td>
                            <td>${personalTO.getCelular() }</td>
                            <td>${personalTO.getRp() }</td>
                            <td>${personalTO.getCorreo() }</td>
                            <td>${personalTO.getObservaciones() }</td>                               
                            <td>     
                                <a href="<c:url value='/EditarPersonal?codigo=${personalTO.getCodigo()}&confirm=no'/>">
                                    <img title="Editar producto" alt="Editar producto" src="<c:url value='/images/iconos/editProd.png'/>"/>
                                </a>&nbsp;&nbsp;
                                <a href="<c:url value='/EliminarPersonal?codigo=${personalTO.getCodigo()}&confirm=no'/>">
                                    <img title="Borrar producto" alt="Borrar producto" src="<c:url value='/images/iconos/deleteProd.png'/>"/>
                                </a>

                            </td>
                        </tr>
                    </c:forEach>  
                </table>

            </c:if>
            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

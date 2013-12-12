<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/ultracolor.css'/>"/>
        <title>Consultar Personal</title>
    </head>
    <body>
        <div id="contenedor" >
            <!--Cabecera-->
            <%@include file="/WEB-INF/include/header.jsp" %>

            <h2>Editar Personal</h2>

            <div id="datos">
                <h3>Datos</h3>
                <form name="form12" method="post" action="<c:url value='/EditarPersonal'/>">
                    <c:forEach var="personalTO" items="${requestScope.personalTO}">
                        <table width="338">
                            <tr>
                                <td width="88">Codigo</td>
                                <td width="238">
                                    <input name="codigo" type="text" class="fieldEdit" id="codigo" value="${personalTO.getCodigo() }" onChange="javascript:this.value = this.value.toUpperCase()" size="25">
                                </td>
                            </tr>  
                            <tr>
                                <td width="88">Nombre</td>
                                <td width="238">
                                    <input name="nombre" type="text" class="fieldEdit" id="nombre" value="${personalTO.getNombre() }" onChange="javascript:this.value = this.value.toUpperCase()" size="25">
                                </td>
                            </tr>                       

                            <tr>
                                <td>Apellidos</td>
                                <td>
                                    <input name="apellidos" type="text" class="fieldEdit" id="apellidos" value="${personalTO.getApellidos() }" onChange="javascript:this.value = this.value.toUpperCase()" size="25">
                                </td>
                            </tr>
                            <tr>
                                <td>DNI</td>
                                <td>
                                    <input name="dni" type="text" class="fieldEdit" id="dni" value="${personalTO.getDni() }" size="8" maxlength="8">
                                </td>
                            </tr>
                            <tr>
                                <td>Fecha de Nacimiento</td>
                                <td>
                                    <input name="fechaNacimiento" type="text" class="fieldEdit" id="fechaNacimiento" value="${personalTO.getFechaNacimiento() }" size="10" maxlength="10" >
                                </td>
                            </tr>
                            <tr>
                                <td>Direccion</td>
                                <td>
                                    <input name="direccion" type="text" class="fieldEdit" id="direccion" value="${personalTO.getDireccion() }" onChange="javascript:this.value = this.value.toUpperCase()" size="30" maxlength="30">
                                </td>
                            </tr>
                            <tr>
                                <td>Celular</td>
                                <td>
                                    <input name="celular" type="text" class="fieldEdit" id="celular" value="${personalTO.getCelular() }" size="25" maxlength="30">
                                </td>
                            </tr>
                            <tr>
                                <td>Red Privada</td>
                                <td>
                                    <input name="rp" type="text" class="fieldEdit" id="rp" value="${personalTO.getRp() }" size="25" maxlength="30">
                                </td>
                            </tr>

                            <tr>
                                <td>Correo</td>
                                <td>
                                    <input name="correo" type="text" class="fieldEdit" id="correo" value="${personalTO.getCorreo() }" size="25" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <td>Observaciones</td>
                                <td>
                                    <input name="observaciones" type="text" class="fieldEdit" id="observaciones" value="${personalTO.getObservaciones() }" onChange="javascript:this.value = this.value.toLowerCase()" size="25" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input name="confirm" type="submit" class="button" id="grabar" value="Aceptar">
                                </td>
                            </tr>
                        </table>
                    </c:forEach>
                </form>
                <c:if test="${! empty requestScope.mensaje}">
                    <div id="mensaje">Mensaje: ${requestScope.mensaje}</div>
                </c:if>
                <c:if test="${! empty requestScope.error}">
                    <div class="error" id="error">Error: ${requestScope.error}</div>
                </c:if>

                <a href="<c:url value='gestionPersonal.jsp'/>">Cancelar</a>





            </div>

            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

<%-- 
    Document   : agregarPersonal
    Created on : 27-nov-2013, 20:58:48
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
        <title>Agregar personal</title>
    </head>
    <body>
        <div id="contenedor" >
            <!--Cabecera-->
            <%@include file="/WEB-INF/include/header.jsp" %>


            <div id="datos">
                <h3>Datos</h3>
                <form name="form11" method="post" action="<c:url value='/CrearPersonal'/>">
                    <table width="338">
                        <tr>
                            <td width="88">Nombre</td>
                            <td width="238">
                                <input required name="nombre" type="text" class="fieldEdit" id="nombre" onChange="javascript:this.value = this.value.toUpperCase()" size="25">
                            </td>
                        </tr>
                        <tr>
                            <td>Apellidos</td>
                            <td>
                                <input required name="apellidos" type="text" class="fieldEdit" id="apellidos" onChange="javascript:this.value = this.value.toUpperCase()" size="25">
                            </td>
                        </tr>
                        <tr>
                            <td>DNI</td>
                            <td>
                                <input required name="dni" type="text" class="fieldEdit" id="dni"  size="8" maxlength="8">
                            </td>
                        </tr>
                        <tr>
                            <td>Fecha de Nacimiento</td>
                            <td>
                                <input name="fechaNacimiento" type="text" class="fieldEdit" id="fechaNacimiento" size="10" maxlength="10" value="1992-11-11">
                            </td>
                        </tr>
                        <tr>
                            <td>Direccion</td>
                            <td>
                                <input name="direccion" type="text" class="fieldEdit" id="direccion" onChange="javascript:this.value = this.value.toUpperCase()" size="30" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <td>Celular</td>
                            <td>
                                <input name="celular" type="text" class="fieldEdit" id="celular" size="25" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <td>Red Privada</td>
                            <td>
                                <input name="rp" type="text" class="fieldEdit" id="rp" size="25" maxlength="30">
                            </td>
                        </tr>

                        <tr>
                            <td>Correo</td>
                            <td>
                                <input name="correo" type="text" class="fieldEdit" id="correo" size="25" maxlength="20">
                            </td>
                        </tr>
                        <tr>
                            <td>Observaciones</td>
                            <td>
                                <input name="observaciones" type="text" class="fieldEdit" id="observaciones" onChange="javascript:this.value = this.value.toLowerCase()" size="25" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input name="grabar" type="submit" class="button" id="grabar" value="Grabar">
                            </td>
                        </tr>
                    </table>
                </form>
                <a href="<c:url value='gestionPersonal.jsp'/>">Cancelar</a>
                
                <c:if test="${! empty requestScope.error}">
                    <div class="error" id="error">Error: ${requestScope.error}</div>
                </c:if>


            </div>



            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

<%-- 
    Document   : login
    Created on : 26-nov-2013, 18:03:16
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/ultracolor.css" />
        <title>Login</title>
    </head>
    <body>
        <div id="contenedor" >
        <%@include file="/WEB-INF/include/header.jsp" %>
        

        <form name="form1" method="post" action="<c:url value='/UsuarioController'/>">
            <table width="273">
                <tr>
                    <td width="58">Correo</td>
                    <td colspan="2">
                        <input name="correo" type="text" id="usuario" size="30" maxlength="30">		   
                    </td>
                </tr>
                <tr>
                    <td>Clave</td>
                    <td width="104">
                        <input name="clave" type="password" id="clave" size="15" maxlength="15">
                    </td>
                    <td width="95">
                        <input type="submit" name="conectar" id="conectar" value="Conectar">
                    </td>
                </tr>
            </table>
        </form>
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

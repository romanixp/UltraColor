<%-- 
    Document   : pedidos
    Created on : 09-dic-2013, 9:45:23
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

        <script src="<c:url value='/js/jquery.js'/>" type="text/javascript"></script>      
        <script src="<c:url value='/js/jquery.quickflip.js'/>" type="text/javascript"></script>              
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/tab.css'/>"/>        
        <script src="<c:url value='/js/tab.js'/>" type="text/javascript"></script>      

        <title>Pedidos</title>
    </head>
    <body>
        <div id="contenedor" >
            <!--Cabecera-->
            <%@include file="/WEB-INF/include/header.jsp" %>
            <h2>Pedidos</h2>

            <a href="<c:url value='/view/admin/main.jsp' />">Volver principal</a>

            <table width="318">
                <tr>
                    <td width="67">Usuario:</td>
                    <td width="239">${sessionScope.proveedorTO.nombre}</td>
                </tr>
            </table>               
                

            <select name="proveedor">
                <c:forEach var="proveedorTO" items="${requestScope.proveedorTO}">
                    <option value="${proveedorTO.getCodigo() }">${proveedorTO.getNombre()}</option>
                </c:forEach>  
            </select>
                

            <div id="flip-tabs" >
                <ul id="flip-navigation" >
                    <li class="selected"><a href="#" id="tab-0"  >Buscar</a></li>
                    <li><a href="#" id="tab-1" >Stock</a></li>

                </ul>
                <div id="flip-container" >
                    <div>
                        <ul class="orange">
                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                            <li>Cras congue venenatis interdum</li>
                            <li>Nunc quis tellus at eros aliquam hendrerit nec sed mauris</li>
                            <li>Phasellus ut erat sapien. Suspendisse ultrices vestibulum</li>
                            <li>Donec nec erat neque. Curabitur orci risus,</li>
                        </ul>
                    </div>
                    <div>
                        <ul class="green">
                            <li>Phasellus ut erat sapien. Suspendisse ultrices vestibulum</li>
                            <li>Donec nec erat neque. Curabitur orci risus,</li>
                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                            <li>Cras congue venenatis interdum</li>
                            <li>Nunc quis tellus at eros aliquam hendrerit nec sed mauris</li>					
                        </ul>
                    </div>                    
                </div>
            </div>
            <p>&nbsp</p>
            <p>&nbsp</p>
            <p>&nbsp</p>
            <p>&nbsp</p>
            <p>&nbsp</p>
            <p>&nbsp</p>
            <p>&nbsp</p>





            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

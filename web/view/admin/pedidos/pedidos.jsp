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
                    <td width="239">${sessionScope.personalTO.nombre}</td>
                </tr>
                <tr>
                    <td width="67">Correo</td>
                    <td width="239">${sessionScope.usuarioTO.correo}</td>
                </tr>
            </table>               


            <c:if test="${! empty requestScope.mensaje}">
                <div id="mensaje">Mensaje: ${requestScope.mensaje}</div>
            </c:if>
            <c:if test="${! empty requestScope.error}">
                <div class="error" id="error">Error: ${requestScope.error}</div>
            </c:if>




            <div id="flip-tabs" >
                <ul id="flip-navigation" >
                    <li class="selected"><a href="#" id="tab-0"  >Buscar</a></li>
                    <li><a href="#" id="tab-1" >Stock</a></li>

                </ul>
                <div id="flip-container" >
                    <div>
                        <ul class="orange">



                            <form name="form111" method="POST" action="<c:url value='/Pedido'/>">                             
                                <li>
                                    <input type="text" name="valor" id="valor" value="" >                    
                                    <select name="campo" id="campo">
                                        <option value="Nombre" >Nombre</option>                    
                                        <option value="Marca" >Marca</option>                    
                                        <option value="Codigo" >Codigo</option>                    
                                    </select>
                                    <input type="submit" name="buscarPersonal" id="buscarPersonal" value="consultar">
                                </li>
                            </form>

                            <form name="form" method="POST" action="<c:url value='/Pedido'/>">                             
                                <table border="1">                                
                                    <tr>
                                        <td>Codigo</td>
                                        <td>Nombre</td>
                                        <td>Stock</td>
                                        <td>Unidad de medida</td>
                                        <td>Precio de compra</td>
                                        <td>Precio de venta</td>
                                        <td>Marca</td>
                                        <td>Fecha de vencimiento</td>                                        

                                        <td>Cantidad</td>
                                        <td>Unidad de compra</td>

                                        <td></td>
                                    </tr>
                                    <c:forEach var="productoTO" items="${requestScope.productoTO}">
                                        <tr>                        
                                            <td> <input type="text" name="codigo" size="5" maxlength="5" I value="${productoTO.getCodigo() }" > </td>

                                            <td>${productoTO.getNombre() }</td>
                                            <td>${productoTO.getStock() }</td>
                                            <td>${productoTO.getUnidadMedida() }</td>
                                            <td>${productoTO.getPrecioCompra() }</td>
                                            <td>${productoTO.getPrecioVenta() }</td>
                                            <td>${productoTO.getMarca() }</td>
                                            <td>${productoTO.getFechaVencimiento() }</td>

                                            <td> <input type="text" name="cantidad" size="3" maxlength="3" > </td>
                                            <td> <input type="text" name="unidad" size="12" maxlength="30" I > </td>

                                            <td><input type="submit" name="add" value="Agregar"> </td>

                                        </tr>
                                    </c:forEach>  
                                </table>
                            </form>
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


            <p>Lista de Productos para pedir</p>
            <table border="1">                                
                <tr>
                    <td>Codigo</td>
                    <td>Producto</td>
                    <td>Cantidad</td>
                    <td>Unidad de compra</td>                    
                    <td></td>

                </tr>
                <c:forEach var="pedidoCompraTO" items="${sessionScope.canasta.getLista()}">
                    <tr>
                        <td>${pedidoCompraTO.getCodigo() }</td>
                        <td>${pedidoCompraTO.getProdCodigo() }</td>                        
                        <td>${pedidoCompraTO.getCantidad() }</td>
                        <td>${pedidoCompraTO.getUnidad() }</td>
                        <td>     
                            <a href="<c:url value='/Pedido?codigo=${pedidoCompraTO.getCodigo()}&add=no'/>">
                                <img widht="30px" height="30px"  title="Editar producto" alt="Quitar producto" src="<c:url value='/images/iconos/deleteProd.png'/>"/>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <form method="POST" action="">
                <p>Proveedor: 
                    <select name="proveedor">
                        <c:forEach var="proveedorTO" items="${requestScope.proveedorTO}">
                            <option value="${proveedorTO.getCodigo() }">${proveedorTO.getNombre()}</option>
                        </c:forEach>
                    </select>
                </p>
                <p>
                    <input type="submit" value="Pedir">
                </p>
            </form>


            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
</html>

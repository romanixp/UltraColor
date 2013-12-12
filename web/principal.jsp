<%-- 
    Document   : principal
    Created on : 08-dic-2013, 15:30:34
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.js" type="text/javascript"></script>        
        <script src="js/ajax.js" type="text/javascript"></script>        
        <link rel="stylesheet" type="text/css" href="css/ultracolor.css"/>






        <title>JSP Page</title>
    </head>

    <body>
        <a href="colores.jsp?color=verde" id="verde">hablame del verde</a>       
        <a href="colores.jsp?color=rojo">hablame del rojo</a>       
        <a href="colores.jsp?color=azul">hablame del azul</a>   

        <div id="hablame"></div>        
        <h3>Formulario de acceso</h3>

        <p> hola mundo<p>

        <table>
            <form action="">
                <tr>
                    <td width="200px">
                        Ingrese su correo
                    </td>
                    <td>
                        <div id="campo"><input type="text" onkeyup="sugerencias(this.value)"  />
                            <div id="txtHint"></div>  </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"  value="Aceptar"/></td>
                </tr>
            </form>
        </table>
        <!-- No puedo enviar parametros "name" de este modo -->
        <form name="form1"   method="GET" action="<c:url value='/a'/>" >

            <input type="image" id="cod" name="cod" value="01" src="images/iconos/insert.ico">

        </form>



        <form name="form" method="POST" action="<c:url value='/a'/>">                             
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
                
                    <tr>                        
                        <td> <input type="text" name="codigo" size="12" maxlength="30" I value="44" > </td>
                        <td>${productoTO.getNombre() }</td>
                        <td>${productoTO.getStock() }</td>
                        <td>${productoTO.getUnidadMedida() }</td>
                        <td>${productoTO.getPrecioCompra() }</td>
                        <td>${productoTO.getPrecioVenta() }</td>
                        <td>${productoTO.getMarca() }</td>
                        <td>${productoTO.getFechaVencimiento() }</td>

                        <td> <input type="text" name="cantidad" size="3" maxlength="3"  > </td>
                        <td> <input type="text" name="unidad" size="12" maxlength="30" I > </td>

                        
                        <td>     
                            <input type="submit" name="add" value="Agregar">
                            <a href="<c:url value='/a?codigo=44&add=si'/>">
                                <img widht="25px" height="25px"  title="Editar producto" alt="Agregar producto" src="<c:url value='/images/iconos/insert.ico'/>"/>
                            </a>
                        </td>  
                    </tr>
                
            </table>
        </form>












    </body>
</html>

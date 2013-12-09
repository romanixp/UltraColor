<%-- 
    Document   : principal
    Created on : 08-dic-2013, 15:30:34
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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









    </body>
</html>


<%-- 
    Document   : index
    Created on : 12-nov-2013, 11:24:48
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%= request.getRequestURL().toString()%>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="../css/ultracolor.css" media="screen, tv, projection" />
            
        <title>Ultra Color</title>        
    </head>
    <body>
        <div id="contenedor" >
            
            
            <!--Cabecera-->
            <%@include file="/WEB-INF/include/header.jsp" %>
            
            
            
            <a href="login.jsp">Identificate</a> <p> ó </p> <a>Registrate</a>
           
            <%@include file="/WEB-INF/include/footer.jsp" %>
        </div>
    </body>
    <!-- Pie de pagina -->
    
</html>

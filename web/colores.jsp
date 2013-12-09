<%-- 
    Document   : colores
    Created on : 08-dic-2013, 15:31:15
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<%  if (request.getParameter("color").equals("verde")) {%>            
<p>El verde es refrescante</p>          
<%}%>

<%  if (request.getParameter("color").equals("rojo")) {%>            
<p>El verde es muy pasional</p>          
<%}%>

<%  if (request.getParameter("color").equals("azul")) {%>    

<p>El azul es azul</p>          
<%}%>



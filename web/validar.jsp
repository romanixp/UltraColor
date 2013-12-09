<%-- 
    Document   : validar
    Created on : 08-dic-2013, 18:46:35
    Author     : Sistemas
--%>




<%@page import="dao.to.UsuarioTO"%>
<%@page import="Model.UsuarioModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UsuarioModel usuarioModel = new UsuarioModel();
    UsuarioTO usuarioTO = usuarioModel.consultarPorCorreo(request.getParameter("correo"));

    if (usuarioTO != null) {%>
    <div id="" style="width:180px;height:30px;background:red;border-radius:15px;position:absolute;-webkit-transform:translate(90px,-40px);opacity:0.5;z-index:-100 ;  "></div>
<%   } else {%>
    <div id="" style="width:180px;height:30px;background:green;border-radius:15px;position:absolute;-webkit-transform:translate(90px,-40px);opacity:0.5;z-index:-100;"></div>

<%   }%>




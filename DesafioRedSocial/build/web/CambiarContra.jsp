<%-- 
    Document   : CambiarContra
    Created on : 24-nov-2017, 11:35:02
    Author     : Conny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesion.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hermes</title>
    </head>
    <body>
         <%
            Usuario us = (Usuario) session.getAttribute("usuario");

            if (us != null) {
        %>
        <form action="cambiarContrasenia.do" method="post" >
            <input type="text" name="txtContrasenia" required=""/>
            <input type="hidden" name="idUs" value="<%=us.getId()%>"/>
            <input type="submit" name="btnCambiar" value="Cambiar Contraseña"/>
        </form>
        <%}%>
    </body>
</html>

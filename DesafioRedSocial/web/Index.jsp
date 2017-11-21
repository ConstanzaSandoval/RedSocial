<%-- 
    Document   : Index
    Created on : 20-nov-2017, 3:30:02
    Author     : Conny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Red Social</title>
    </head>
    <body>
        <form action="iniciarSesion.do" method="post">

            <input type="text" name="txtEmail" required=""/>
            <input type="password" name="txtContrasenia" required=""/>
            <input type="submit" name="btnIngresar" value="Iniciar Sesión"/>
        </form>
        Para registrarte gratis, haz click <a href="Registrar.jsp"> aquí </a>

        <%
            Error e = (Error) request.getSession().getAttribute("error");
            if (e != null) {
                out.println("<p>" + e.getMessage() + "</p>");
                request.getSession().removeAttribute("error");
            }
        %>    
    </body>
</html>

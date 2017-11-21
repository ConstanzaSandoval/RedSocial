<%-- 
    Document   : Inicio
    Created on : 21-nov-2017, 11:52:50
    Author     : Conny
--%>

<%@page import="model.Publicacion"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesion.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Hermes</title>

    </head>
    <body>
        <%                            if (u != null) {
                out.println("<h3><a href='Perfil.jsp'>" + u.getNombre() + "</a></h3>");
            }
        %>

        <table>
            <%
                Data d = new Data();

                for (Publicacion p : d.getPublicacionesSeguidos(u.getId())) {
                    out.println(p.getFecha());
                    out.println(p.getContenido());
                }
            %>
        </table>
    </body>
</html>

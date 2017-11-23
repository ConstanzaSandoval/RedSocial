<%-- 
    Document   : Inicio
    Created on : 21-nov-2017, 11:52:50
    Author     : Conny
--%>

<%@page import="model.ConsultaSeguidor"%>
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
        <form action="cerrarSesion.do">
            <input type="submit" value="Cerrar sesión"/>
        </form>
        <%                            if (u != null) {
                out.println("<h3><a href='Perfil.jsp'>" + u.getNombre() + "</a></h3>");
            }else{
                response.sendRedirect("Index.jsp");
            }
        %>

        <table>
            <%
                Data d = new Data();
                
                for (ConsultaSeguidor cs : d.getPublicacionesSeguidos(u.getId())) {
                    
                    
                    
                    out.print(cs.getUsuario()+": ");
                    out.println(cs.getFecha());
                    out.println("<br/>");
                    out.println(cs.getContenido());
                    out.println("<br/>");
                }
            %>
        </table>
    </body>
</html>

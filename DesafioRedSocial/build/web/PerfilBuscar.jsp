<%-- 
    Document   : PerfilBuscar
    Created on : 21-nov-2017, 11:47:30
    Author     : Conny
--%>

<%@page import="model.Publicacion"%>
<%@page import="model.Usuario"%>
<%@page import="model.Perfil"%>
<%@page import="model.Data"%>
<%@include file="Sesion.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Red Social</title>
    </head>
    <body>
        <a href="Inicio.jsp">Ir a inicio</a>
        
        <%                            if (u != null) {
                out.println("<h3><a href='Perfil.jsp'>" + u.getNombre()+"</a></h3>");
            }
        %>
        
        <br>
        
        <%
            String id = request.getParameter("id");
            Data d = new Data();
            Usuario us = d.getUsuario(Integer.parseInt(id));
            Perfil p = d.getPerfil(Integer.parseInt(id));
        %>
        
        <h1><%=us.getNombre()%></h1>

        <%
            
            out.println("Seguidores"+d.getCantSeguidores(us.getId())+"<br>");
            out.println(p.getDescripcion()+"<br>");
            
            for (Publicacion pub : d.getPublicaciones(us.getId())) {
                out.println("Publicado el: " + pub.getFecha());
                out.println(pub.getContenido() + "<br>");
            }
        %>

    </body>
</html>

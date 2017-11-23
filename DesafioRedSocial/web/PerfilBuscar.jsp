<%-- 
    Document   : PerfilBuscar
    Created on : 21-nov-2017, 11:47:30
    Author     : Conny
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <form action="cerrarSesion.do">
            <input type="submit" value="Cerrar sesión"/>
        </form>
        <a href="Inicio.jsp"> Home </a>
        
        <%                            if (u != null) {
                out.println("<h3><a href='Perfil.jsp'>" + u.getNombre() + "</a></h3>");
            }else{
                response.sendRedirect("Index.jsp");
            }
        %>

        <br>

        <%
            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                
                Data d = new Data();
                int idI = Integer.parseInt(id);
                
                Usuario us = d.getUsuario(idI);
                Perfil p = d.getPerfil(idI);
        %>

        <h1><%=us.getNombre()%></h1>

        <%

                out.println("Seguidores: " + d.getCantSeguidores(us.getId()) + "</br>");
                out.println("Seguidos: " + d.getCantSeguidos(us.getId()) + "</br>");
                out.println(p.getDescripcion() + "</br>");
                
                DateFormat date = new SimpleDateFormat("EEEEEEEEE dd 'de' MMMMM 'de' yyyy");    
                
                for (Publicacion pub : d.getPublicaciones(us.getId())) {
                    String fecha = date.format(pub.getFecha());
                    out.println("</br>");
                    out.print(" Publicado el: " + fecha ); 
                    out.print(pub.getContenido().toString() + "<br><br>" );
                    
                }
            }
        %>

    </body>
</html>

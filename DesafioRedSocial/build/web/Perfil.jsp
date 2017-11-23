<%-- 
    Document   : Perfil
    Created on : 19-nov-2017, 22:41:12
    Author     : Conny
--%>

<%@page import="model.Perfil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Seguidores"%>
<%@page import="model.Publicacion"%>
<%@page import="model.Usuario"%>
<%@page import="model.Data"%>
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

        <%
            Usuario u = (Usuario) session.getAttribute("usuario");

            if (u != null) {
                out.println("<h1>" + u.getNombre() + "</h1>");
                out.println("<h3> <a href = 'Inicio.jsp'> Home </a> </h3>");

                Data d = new Data();
                out.print("Seguidores: "+d.getCantSeguidores(u.getId())+"  ");
                out.println("Seguidos: "+d.getCantSeguidos(u.getId())+"<br>");
        %>

        <form action="buscar.do" method="post">
            Buscar: <input type="text" name="filtro" />
            <input type="submit" name="btnBuscar" value="Buscar"/>
        </form>
        <br>
        Descripción: 
        <form action="actualizarDescripcion.do" method="post">
            <%            Perfil per = d.getPerfil(u.getId());
            %>
            <input name="txtDescripcion" placeholder="Añadir una descripción" value="<%=per.getDescripcion()%>"/>
            <input type="hidden" value="<%=u.getId()%>" name="txtIdUsuario"/>
            <input type="submit" value="Añadir" name="btnAñadirDescripcion"/>
        </form> 
            <br/>
            <br/>
        Publicar:
        <form action="publicar.do" method="post" >

            <input type="text" name="txtPublicacion" />
            <input type="hidden" value="<%=u.getId()%>" name="idPerfil"/>
            <input type="submit" name="btnPublicar" value="Publicar"/>

        </form>
        <br>


        <%
                for (Publicacion p : d.getPublicaciones(u.getId())) {
                    out.println("Publicado el:" + p.getFecha());
                    out.println("<br><input type='text' value='" + p.getContenido() + "' readonly='readonly'/>");
                }
            }
        %>


       <!--<script src="js/jquery-3.2.1.min.js"></script>
        <script>
            function buscar() {

                var txtFiltro = $("#txtBuscar").val();

                $.ajax({
                    url: "buscar.do",
                    data: {
                        filtro: txtFiltro
                    },
                    success: function (result) {
                        $("#resultado").html(result);
                    }
                });
            }
        </script>-->
    </body>
</html>

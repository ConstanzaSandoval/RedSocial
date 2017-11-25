<%-- 
    Document   : Perfil
    Created on : 19-nov-2017, 22:41:12
    Author     : Conny
--%>

<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Seguidores"%>
<%@page import="model.Publicacion"%>
<%@page import="model.Usuario"%>
<%@page import="model.Data"%>
<%@include file="Sesion.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hermes</title>
    </head>
    <body style="background-color: #F0FFFF;" >
        <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            if (usuario != null) {
        %>

        <div class="card border-info mb-3" style="margin-left: 10px; position: fixed; width: 350px; height: 99%">

            <p class="card-text">
            <nav class="nav flex-column" >
                <ul class="nav flex-column">
                    <li class="nav-item" style="margin-top: 100px;margin-left: 15px;">
                        <a class="nav-link active" href="Inicio.jsp"><h4>TimeLine</h4></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <form action="Buscar.jsp" method="post">
                                <div class="col-lg-6">
                                    <div class="input-group" style="width: 300px;">
                                        <input  type="text" name="filtro"class="form-control" placeholder="Buscar..." aria-label="Buscar..." />
                                        <span class="input-group-btn" />
                                        <input type="submit" name="btnBuscar" value="Buscar" class="btn btn-secondary" style="width: 100px;"/>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </a>
                    </li>
                    <li class="nav-item" style="padding-top: 100px; margin-left: 15px;">
                        <a class="nav-link" href="CambiarContra.jsp">
                            <button class="btn btn-outline-info" name="btnCambiar" >Cambiar Contraseña</button>
                        </a>   
                    </li>
                    <li class="nav-item" style="padding-top: 100px; margin-left: 15px;">
                        <a class="nav-link" href="#">
                            <form action="cerrarSesion.do">
                                <input class="btn btn-outline-info" type="submit" value="Cerrar sesión"/>
                            </form>
                        </a>   
                    </li>
                </ul>
            </nav>

        </p>

    </div>




    <%
        Data d = new Data();
    %>
<center>

    <div class="card bg-light mb-3" style="max-width: 45rem; margin-left: 150px" >
        <div class="card-header"><h1> <%out.println(u.getNombre());%></h1></div>
        <div class="card-body">
            <h4 class="card-title"> <%
                out.print("Seguidores: <a href = 'VerSeguidores.jsp?idSeguidores=" + usuario.getId() + "'> " + d.getCantSeguidores(usuario.getId()) + "</a>  ");
                out.println("Seguidos: <a href = 'VerSeguidores.jsp?idSeguidos=" + usuario.getId() + "'>" + d.getCantSeguidos(usuario.getId()) + "</a><br>");
                %>
            </h4>
            <p class="card-text">
                Descripción: 
            <form action="actualizarDescripcion.do" method="post">
                <%            Perfil per = d.getPerfil(usuario.getId());
                %>
                <input type="text" name="txtDescripcion" placeholder="Añadir una descripción" value="<%=per.getDescripcion()%>"/>
                <input type="hidden" value="<%=usuario.getId()%>" name="txtIdUsuario"/>
                <input type="submit" value="Añadir" name="btnAñadirDescripcion"/>
            </form> 
            </p>
        </div>
    </div>


    <div class="form-row" style="width: 400px;">
        <div class="col">
            Publicar:
            <form action="publicar.do" method="post" >
                <input class="form-control" type="text" name="txtPublicacion" placeholder="Comparte algo con tus seguidores aquí!"/>
                <input type="hidden" value="<%=usuario.getId()%>" name="idPerfil"/>
                <input type="submit" name="btnPublicar" value="Publicar"/>

            </form>
        </div>
    </div>

    <br>
    <br>

    <%

        for (Publicacion p : d.getPublicaciones(usuario.getId())) {%>
    <div class="card border-secondary mb-3" style="max-width: 20rem;">
        <div class="card-header"> <%
            String fecha = p.getFecha();
            out.println("Publicado el " + fecha);%>
        </div>
        <div class="card-body text-secondary">

                <p class="card-text"> <h4><%
                    out.println(p.getContenido());%></h4>
            </p>
        </div>
    </div>
    <%
        }%>
</center>



<%
    } else {
        response.sendRedirect("Index.jsp");
    }
%>

</body>
</html>

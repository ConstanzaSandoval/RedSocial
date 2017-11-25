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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hermes</title>
    </head>
    <body style="background-color: #F0FFFF; ">

        <%                            if (u != null) {%>
        <div class="card border-info mb-3" style="margin-left: 10px; position: fixed; width: 350px; height: 99%; ">

            <p class="card-text">
            <nav class="nav flex-column" >
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="Perfil.jsp" style="margin-left: 20px;">
                            <%
                                out.println("<h3>" + u.getNombre() + "</h3>");
                            %>
                        </a>
                    </li> 
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
                        <a class="nav-link" href="#" style="margin-top: 200px;">
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
        String id = request.getParameter("id");

        Data d = new Data();
        int idI = Integer.parseInt(id);
        if (idI == u.getId()) {
            response.sendRedirect("Perfil.jsp?id=" + u.getId());
        } else {

            Usuario us = d.getUsuario(idI);
            Perfil p = d.getPerfil(idI);
    %>

<center>
    <div class="card bg-light mb-3" style="max-width: 45rem; margin-left: 150px; margin-top: 10px" >
        <div class="card-header"><h1> <%=us.getNombre()%></h1></div>
        <div class="card-body">
            <h4 class="card-title"> 
                <%
                out.print("Seguidores: <a href = 'VerSeguidores.jsp?idSeguidores=" + us.getId() + "'> " + d.getCantSeguidores(us.getId()) + "</a>  ");
                out.println("Seguidos: <a href = 'VerSeguidores.jsp?idSeguidos=" + us.getId() + "'>" + d.getCantSeguidos(us.getId()) + "</a><br>");
                %>
            </h4>
            <p class="card-text">
                Descripción: 

                <%            out.println(p.getDescripcion() + "</br>");
                %>

            </p>
        </div>
    </div>
    <h1>Publicaciones:</h1>
    <%for (Publicacion pub : d.getPublicaciones(us.getId())) {%>
    <div class="card border-secondary mb-3" style="max-width: 20rem;">
        <div class="card-header"> Publicado el :<%
            out.println(pub.getFecha());%>
        </div>
        <div class="card-body text-secondary">
            <p class="card-text">
            <h4><%
                out.println(pub.getContenido());
                %></h4>
            </p>
        </div>
    </div>
    <%}%>   
</center>



<%
        }
    } else {
        response.sendRedirect("Index.jsp");
    }
%>

</body>
</html>

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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Hermes</title>

    </head>
    <body>
        <%                            if (u != null) {%>
        <div class="card border-info mb-3" style="margin-left: 10px; position: fixed; width: 350px; height: 99%">

            <p class="card-text">
            <nav class="nav flex-column" >
                <ul class="nav flex-column">
                    <li class="nav-item" style="margin-left: 30px;">
                        <a class="nav-link" href="Perfil.jsp" >
                            <%
                                out.println("<h3><a href='Perfil.jsp'>" + u.getNombre() + "</a></h3>");%>
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
        } else {
            response.sendRedirect("Index.jsp");
        }
    %>

    <%
        Data d = new Data();

        for (ConsultaSeguidor cs : d.getPublicacionesSeguidos(u.getId())) {%>

    <center>
        <div class="card border-secondary mb-3" style="max-width: 30rem;">
            <div class="card-header"> <%
                out.print(cs.getUsuario() + ": ");
                out.println(cs.getFecha());
                %>
            </div>
            <div class="card-body text-secondary">

                <p class="card-text"> <h4><%
                    out.println(cs.getContenido());
                    %></h4>
                </p>
            </div>
        </div>
        <%
            }
        %>
    </center>

</body>
</html>

<%-- 
    Document   : VerSeguidores
    Created on : 23-nov-2017, 1:12:59
    Author     : Conny
--%>

<%@page import="model.Usuario"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesion.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hermes</title>
    </head>
    <body>
        <%Usuario usu = (Usuario) request.getSession().getAttribute("usuario");
            if (usu != null) {%>

        <div class="card border-info mb-3" style="margin-left: 10px; position: fixed; width: 350px; height: 99%; ">

            <p class="card-text">
            <nav class="nav flex-column" >
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="Perfil.jsp" style="margin-left: 20px;">
                            <%
                                out.println("<h3>" + usu.getNombre() + "</h3>");
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
<center>
<br>
    <%
        if ((request.getParameter("idSeguidores") != null)) {
            int id = Integer.parseInt(request.getParameter("idSeguidores"));

            Data d = new Data();

            for (Usuario us : d.getSeguidores(id)) {%>
      
    <a  style="width: 400px;" class="list-group-item list-group-item-action list-group-item-action" href="PerfilBuscar.jsp?id=<%=us.getId()%>"><%=us.getNombre()%></a></br>
    <%}
    } else if (request.getParameter("idSeguidos") != null) {
        int id = Integer.parseInt(request.getParameter("idSeguidos"));

        Data d = new Data();

        for (Usuario us : d.getSeguidos(id)) {%>
  
    <a style="width: 400px;" class="list-group-item list-group-item-action list-group-item-action"  href="PerfilBuscar.jsp?id=<%=us.getId()%>"><%=us.getNombre()%></a></br>

    <%}%>

</center>
<%
        } else {
            response.sendRedirect("Index.jsp");
        }
    } else {
        response.sendRedirect("Index.jsp");
    }

%>

</body>
</html>

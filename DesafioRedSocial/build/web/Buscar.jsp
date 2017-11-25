<%-- 
    Document   : Buscar
    Created on : 24-nov-2017, 15:03:41
    Author     : Conny
--%>


<%@page import="model.Seguidores"%>
<%@page import="model.Usuario"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String filtro = request.getParameter("filtro");
            Data d = new Data();

            Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u != null) {%>
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




    <%for (Usuario usu : d.buscarUsuario(filtro)) {

            if (usu.getId() != u.getId()) {%>

<center>
    <div class="input-group" style="width: 400px; margin-top: 20px; ">
        <br>
        <br>
        <a style="margin-left: 50px;" class="list-group-item list-group-item-action list-group-item-success" href="PerfilBuscar.jsp?id=<%=usu.getId()%>"><%=usu.getNombre()%></a>
        <%
            Seguidores s = new Seguidores();
            s.setPerfilSeguido(usu.getId());
            s.setPerfilSeguidor(u.getId());

            if (d.getSeguido(s) == null) {%>
        <span class="input-group-btn" >
            <form action="seguidores.do" method="post"> 
                <input type="hidden" name="txtIdSeguido" value=<%=usu.getId()%>  /> 
                <input type="hidden" name="txtIdSeguidor" value=<%=u.getId()%>  /> 
                <input type="hidden" name="txtFiltro" value=<%=request.getParameter("filtro")%> /> 
                <button style="margin-left: 10px;" class="btn btn-outline-secondary" type="submit" name="btnSeguir" >Seguir</button>
                <br>
                <br>
            </form >
        </span>
        <%
        } else {%>
        <form action="unfollow.do" method="post"> 
            <input type="hidden" name="txtIdSeguido" value=<%=usu.getId()%>  /> 
            <input type="hidden" name="txtIdSeguidor" value=<%=u.getId()%>  /> 
            <input type="hidden" name="txtFiltro" value=<%=request.getParameter("filtro")%> /> 
            <input  class="btn btn-outline-secondary" type="submit" name="btnUnfollow" value="Dejar de seguir"/> <br> <br>
        </form> 
    </div>
    <%
                    }
                }

            }   out.print("<br>");
        } else {
            response.sendRedirect("Index.jsp");
        }%>
</center>
</body>
</html>

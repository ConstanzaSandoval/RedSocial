<%-- 
    Document   : VerSeguidores
    Created on : 23-nov-2017, 1:12:59
    Author     : Conny
--%>

<%@page import="model.Usuario"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hermes</title>
    </head>
    <body>

        <%
            if ((request.getParameter("idSeguidores") != null)) {
                int id = Integer.parseInt(request.getParameter("idSeguidores"));

                Data d = new Data();

                for (Usuario us : d.getSeguidores(id)) {
                    out.println("- <a href='PerfilBuscar.jsp?id=" + us.getId() + "'>" + us.getNombre() + "</a></br> ");
                }
            } else if (request.getParameter("idSeguidos") != null) {
                int id = Integer.parseInt(request.getParameter("idSeguidos"));

                Data d = new Data();

                for (Usuario us : d.getSeguidos(id)) {
                    out.println("- <a href='PerfilBuscar.jsp?id=" + us.getId() + "'>" + us.getNombre() + "</a></br> ");
                }
            }else{
                response.sendRedirect("Index.jsp");
            }


        %>

    </body>
</html>

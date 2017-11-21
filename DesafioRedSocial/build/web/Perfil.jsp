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

        <%
            Usuario u = (Usuario) session.getAttribute("usuario");

            if (u != null) {
                out.println("<h1>" + u.getNombre() + "</h1>");

                Data d = new Data();


        %>

        Descripción:
        <form action="actualizarDescripcion.do" method="post">
            
            <textarea name='txtDescripcion' rows='10' cols='5'>
                <%            Perfil per = d.getPerfil(u.getId());%>
            </textarea>
            <input type="submit" value="Añadir" name="btnAñadirDescripcion"/>
            <input type="hidden" value="<%=per.getId()%>" name="txtIdPerfil"/>
        </form> 



        Publicar:
        <form action="publicar.do" method="post" >

            <input type="text" name="txtPublicacion" />
            <input type="hidden" value="<%=u.getId()%>" name="idPerfil"/>
            <input type="submit" name="btnPublicar" value="Publicar"/>

        </form>

        <table>
            <td>
                <%
                        for (Publicacion p : d.getPublicaciones(u.getId())) {

                            if (p.equals(null)) {
                                out.write("No hay publicaciones para mostrar");
                            } else {
                                out.write("<tr>");
                                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-YYYY HH:mm");
                                Date da = formatter.parse(p.getFecha());

                                /*String fechac []= da.toString().split("-");
                            SimpleDateFormat formatterH = new SimpleDateFormat("HH:mm");
                            Date daH = formatterH.parse(p.getFecha());
                        
                            out.write("Publicado el: "+ fechac[2]+" de "+fechac[1]+" del "+fechac[0]+" a las "+ daH+" hrs. <br>");
                                 */
                                out.write("Publicado el: " + da);
                                out.write(p.getContenido());
                                out.write("</tr>");
                            }
                        }
                    }

                %>
            <td>
        </table>

    </body>
</html>

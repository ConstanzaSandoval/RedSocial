<%-- 
    Document   : Sesion
    Created on : 21-nov-2017, 13:08:04
    Author     : Conny
--%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario u = (Usuario) request.getSession().getAttribute("usuario");

    if (u == null) {
        request.getSession().setAttribute("error", new Error("Ingrese sus datos"));
        request.getRequestDispatcher("Index.jsp").forward(request, response);
    }
%>

<%-- 
    Document   : Index
    Created on : 20-nov-2017, 3:30:02
    Author     : Conny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Red Social</title>
    </head>
    <body>
        <h1 style="margin-left: 20px;">Iniciar Sesión</h1>
        <div class="col-xs-4" style="position: fixed">
            <form action="iniciarSesion.do" method="post">
                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  type="text" name="txtEmail" placeholder="Correo" required="" />
                <br>
                <input class="form-control" id="inputPassword" type="password" name="txtContrasenia" placeholder="Contraseña" required=""/>
                <br>
                <input class="btn btn-default" type="submit" name="btnIngresar" value="Iniciar Sesión"/>
            </form>
        </div>
        <br>
        <br>
        <br>
        <div class="form-group" style=" margin-left: 10px; margin-top: 100px;">
            <p >Para registrarte gratis, haz click <a href="Registrar.jsp"> aquí </a> </p><br/>
        </div>

        <%
            Error e = (Error) request.getSession().getAttribute("error");
            if (e != null) { %>
            <div class="alert alert-danger" role="alert" style="width: 300px; margin-left: 20px;">
            <%
                out.println(e.getMessage());
            %>
        </div>    
        <%
                request.getSession().removeAttribute("error");
            }

        %>    

    </body>
</html>

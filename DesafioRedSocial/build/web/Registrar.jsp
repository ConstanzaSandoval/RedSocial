<%-- 
    Document   : Registrar
    Created on : 19-nov-2017, 22:38:30
    Author     : Conny
--%>
<%@page import="model.Sexo"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#fechaNacimiento").datepicker();
                $("#fechaNacimiento").datepicker({
                    dateFormat: "dd-mm-yy"
                });

                // Getter
                var dateFormat = $("#fechaNacimiento").datepicker("option", "dateFormat");

                // Setter
                $("#fechaNacimiento").datepicker("option", "dateFormat", "dd 'de' MM 'de' yy");
            });
        </script>

        <script>
            // español
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: '',
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0"
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

        </script>
    </head>
    <body>
        
    <center>
        <h1>Registrarse</h1>
        <form action="crearUsuario.do" method="post">
            <div class="form-group" style="width: 500px;">
                <br>
                Nombre: <input class="form-control" id="exampleInputPassword1" type="text" name="txtNombre" required=""/><br>
                Sexo: <select name='selSexo'>
                    <%
                        Data d = new Data();
                        for (Sexo s : d.getSexos()) {
                            out.println("<option value='" + s.getId() + "'>" + s.getNombre() + "</option>");
                        }
                    %>
                </select><br>
                <br>
                Fecha de nacimiento: <input  class="form-control" id="fechaNacimiento" name="txtFechaNacimineto" required="" readonly=""/><br> 
                Correo: <input class="form-control" id="exampleInputEmail1" type="text" name="txtCorreo" required=""/><br>
                Contraseña: <input class="form-control" id="exampleInputPassword1" type="password" name="txtContrasenia" required=""/> <br>
                <input class="btn btn-primary" type="submit" name="btnRegistrar" value="Registrar"/>
            </div>
        </form>
                <a href="Index.jsp">Volver</a>
    </center>
    
</body>
</html>

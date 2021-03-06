<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tabla Equipos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script language="javascript" type="text/javascript">
            
            function enviar(pagina) {
                document.equipos.action = pagina;
                document.equipos.submit();
            }
        </script>
    </head>
    <body id="equipos">
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
            try{
            %>
        <div id="stylized" class="myform">
            <h1>Datos del equipo</h1>
            <p>Datos personales:</p>
            <form name="form" method="get" action="insertarEquipos.jsp" onsubmit="return validar()">
                <label>Nombre<input type="text" name="nombre"/></label><br/><br/>
                <label>Liga <input type="text" name="liga"/></label><br/><br/>
                <label>Localidad <input type="text" name="localidad"/></label><br/><br/>
                <input type="submit" value="Aceptar">
            </form>
            <form name="equipos" action="" method="post">
                <input class="btn btn-sm btn-dark" type="button" value="Volver a equipos" onclick="enviar('NumeroEquipos.jsp')">
                <div class="spacer"></div>
            </form>
            <div style="color: red;">
                    <p>
                        <% if (session.getAttribute("codigoUsuario")==null) {
                            session.setAttribute("error", "Debe iniciar sesi??n para acceder a la p??gina de perfil." );
                            response.sendRedirect("index.jsp"); } } catch (Exception e){ out.print(e); } %>
                    </p>
            </div>

        </div>
    </body>
</html>
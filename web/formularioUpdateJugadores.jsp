<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Editar jugadores</title>
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
    <body id="jugadores"> 
        
        <%
            
            
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
                Statement s = conexion.createStatement();
                ResultSet resultado = s.executeQuery ("SELECT * FROM equipos");
                try{
        %>
            
        
        <div id="stylized" class="myform">
            <h1>Datos del equipo</h1>
            <p>Datos personales:</p>
            <form name="form" method="get" action="updateJugadores.jsp" onsubmit="return validar()">
                <label>Codigo<input type="text" name="numeroID"/></label><br/><br/>
                <label>Nombre<input type="text" name="nombre"/></label><br/><br/>
                <label>Equipo <select id="equipo" name ="codEquipo" onchange="quitarError(`equipo`, `errorEquipo`)">
                    <option value="0">--Elige nombre</option>
                    <%
            
            
            
                    while (resultado.next()){

                    String codEquipo = resultado.getString("codEquipo");
                    String nombre = resultado.getString("nombre");

                     out.println("<option value='"+codEquipo+"'>"+nombre+"</option>");
                    }

                    conexion.close();
            
            
                     %>
                   </select></label><br/>
                <input type="submit" value="Aceptar">
            </form>
            <form name="equipos" action="" method="post">
                <input class="btn btn-sm btn-dark" type="button" value="Volver a equipos" onclick="enviar('NumeroJugadores.jsp')">
                <div class="spacer"></div>
            </form>
                <div style="color: red;">
                    <p>
                        <% if (session.getAttribute("codigo")==null) {
                            session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil." );
                            response.sendRedirect("index.jsp"); } } catch (Exception e){ out.print(e); } %>
                    </p>
                </div>

        </div>
    </body>
</html>

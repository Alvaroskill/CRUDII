<%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.Connection" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Futbol</title>
            <link href="https://fonts.googleapis.com/css?family=Merienda" rel="stylesheet">
            <link href="styles.css" rel="stylesheet">
            <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
            <meta charset="utf-8">
            </script>
        </head>

        <body id="Bienvenida">
            <% Class.forName("com.mysql.jdbc.Driver"); Connection
                conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "" ); try{ %>
                <div id="wrapper">
                    <form action="logout.jsp">
                        <p>Loggeado como: <% out.print(session.getAttribute("Registrado")); %>
                        </p>
                        <button type="submit" class="btn btn-primary">LOGOUT</button>
                </div>
                </form>
                <div style="color: red;">
                    <p>
                        <% if (session.getAttribute("codigo")==null) {
                            session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil." );
                            response.sendRedirect("index.jsp"); } } catch (Exception e){ out.print(e); } %>
                    </p>
                </div>
                <div id="nav">
                    <a href="NumeroEquipos.jsp">Equipos</a>&#160; &#160;
                    <a href="NumeroJugadores.jsp">Jugadores</a>&#160; &#160;</a>
                </div>
        </body>

        </html>
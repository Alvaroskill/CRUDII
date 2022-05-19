<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Editar equipos</title>
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
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery ("SELECT * FROM equipos WHERE CodUsu=" + session.getAttribute("codigoUsuario"));
            try{
            %>
        <div id="stylized" class="myform">
            <h1>Datos del equipo</h1>
            <p>Datos personales:</p>
            <form name="form" method="get" action="updateEquipos.jsp">
                <input type="hidden" name="codEquipo" value="<%=request.getParameter("codEquipo")%>"
                <label>Nombre</label>
                <input type="text" name="nombre" value="<%=request.getParameter("nombre")%>"><br/><br/>
                <label>Liga</label>
                    <input type="text" name="liga" value="<%=request.getParameter("liga")%>"><br/><br/>
                <label>Localidad</label> 
                    <input type="text" value="<%=request.getParameter("localidad")%>" name="localidad"><br/><br/>
                <input type="submit" value="Aceptar">
            </form>
            <form name="equipos" action="" method="post">
                <input class="btn btn-sm btn-dark" type="button" value="Volver a equipos" onclick="enviar('NumeroEquipos.jsp')">
                <div class="spacer"></div>
            </form>
            <div style="color: red;">
                    <p>
                        <% if (session.getAttribute("codigoUsuario")==null) {
                            session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil." );
                            response.sendRedirect("index.jsp"); } } catch (Exception e){ out.print(e); } %>
                    </p>
                </div>
        </div>
    </body>
</html>
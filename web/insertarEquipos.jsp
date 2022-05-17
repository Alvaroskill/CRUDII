<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css" /> 
  <script language="javascript" type="text/javascript">
        function enviar(pagina){
        document.equipo.action = pagina;
        document.equipo.submit();
        }
</script>
    <title>Equipos de futbol</title>
  </head>
  <body id="equipos" >
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      
      String consultaNumEquipo = "SELECT * FROM equipos WHERE CodUsu=" + session.getAttribute("codigo");
      
      
    
      
      if (consultaNumEquipo == null) {
        out.println("Lo siento, no se ha podido dar de alta este equipo");
      } else {
        String insercion = "INSERT INTO equipos (nombre, liga, localidad, CodUsu) VALUES ('" + request.getParameter("nombre") + "',"
                        + Integer.valueOf(request.getParameter("liga")) + ", '"
                        + request.getParameter("localidad") + "', "
                        + session.getAttribute("codigo")+ ")";
        s.execute(insercion);
        out.println("Equipo dado de alta correctamente");
      }
      conexion.close();
    %>
<form name="equipo" action="" method="post">
    <input class="btn btn-sm btn-dark" type="button" value="Dar de alta otro equipo" onclick="enviar('equipos.jsp')">
</form>
  </body>
</html>
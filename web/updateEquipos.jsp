<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
    <title>Modificar Equipos</title>
  </head>
  <body id="equipos">
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      
      String insercion = "UPDATE equipos SET "
                           + "codEquipo='" + request.getParameter("codEquipo")
                           + "', nombre='" + request.getParameter("nombre")
                           + "', liga=" + request.getParameter("liga")
                           + ", localidad='" + request.getParameter("localidad")
                           + "' WHERE codEquipo=" + request.getParameter("codEquipo");
      s.execute(insercion);
      out.print("Equipo modificado correctamente");
      conexion.close();
      
    %>
    <br>
    <form name="equipo" action="" method="post">
        <a href="NumeroEquipos.jsp" class="btn btn-sm btn-dark">Volver</a>
    </form>
  </body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
</html> 


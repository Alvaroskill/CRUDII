<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Jugadores</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
<script language="javascript" type="text/javascript">

        function enviar(pagina){
        document.nombreDelFormulario.action = pagina;
        document.nombreDelFormulario.submit();
}
</script>
  </head>
  <body id="jugadores">
      <%
          try{
          
      %>
          
   <form name="inicio" action="" method="post">
        <input class="btn btn-sm btn-dark" type="button" value="Inicio" onclick="enviar('principal.jsp')">
   </form>
   <form name="nombreDelFormulario" action="" method="post">
        <input  class="btn btn-sm btn-dark" type="button" value="Dar de alta" onclick="enviar('jugadores.jsp')">
   </form>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
      Statement s = conexion.createStatement();
      ResultSet listado = s.executeQuery ("SELECT * FROM jugadores WHERE CodUsu=" + session.getAttribute("codigoUsuario"));
    %>
    <table>
      <tr></th><th>NumeroID</th><th>Nombre</th><th>Equipo</th>
    <% 
      while (listado.next()) {
          out.println("<tr><td>");
          out.println(listado.getString("numeroID") + "</td>");
          out.println("<td>" + listado.getString("nombre") + "</td>");
          int codEquipo = Integer.parseInt(listado.getString("codEquipo"));
          
          String consultaEquipo = ("SELECT * FROM equipos WHERE codEquipo=" + codEquipo);
          Statement s2 = conexion.createStatement();
          ResultSet nomEquipo = s2.executeQuery (consultaEquipo); 
          nomEquipo.next();
          out.println("<td>" + nomEquipo.getString("nombre") + "</td>");
          
    %>
      <td>
        
      <form method="get" action="deleteJugadores.jsp">
        <input type="hidden" name="numeroID" value="<%=listado.getString("numeroID") %>"/>
        <input class="btn btn-sm btn-dark" type="submit" value="Eliminar">
      </form>
      <form method="get" action="formularioUpdateJugadores.jsp">
         <input type="hidden" name="numeroID" value="<%=listado.getString("numeroID")%>">
         <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
         <input type="hidden" name="equipo" value="<%=listado.getString("codEquipo")%>">
        <input class="btn btn-sm btn-dark" type="submit" value="Modificar">
      </form>
      </td></tr>
    <%
      } // while   
     %>
            <div style="color: red;">
                    <p>
                        <% if (session.getAttribute("codigoUsuario")==null) {
                            session.setAttribute("error", "Debe iniciar sesi??n para acceder a la p??gina de perfil." );
                            response.sendRedirect("index.jsp"); } } catch (Exception e){ out.print(e); } %>
                    </p>
                </div>
    </table>
  </body>
</html>
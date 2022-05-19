<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
                Statement s = conexion.createStatement();
                Statement u = conexion.createStatement();
                ResultSet listadoUsuario = s.executeQuery("SELECT * FROM usuario");
                
                String nombre = request.getParameter("nombre");
                while (listadoUsuario.next()) {
                
                    //out.print(listadoUsuario);
                    if (request.getParameter("usuario").equals(listadoUsuario.getString("nombre")) && (request.getParameter("password").equals(listadoUsuario.getString("contrasena")))) {
                        session.setAttribute("Registrado", listadoUsuario.getString("nombre"));
                        session.setAttribute("contrasena", listadoUsuario.getString("contrasena"));
                        session.setAttribute("codigoUsuario", listadoUsuario.getString("CodUsu"));
                        response.sendRedirect("principal.jsp");
                    }
                       
                    
                }
                
            response.sendRedirect("index.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

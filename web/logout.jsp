<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%request.setCharacterEncoding("UTF-8");%>
        
        <% 
             try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol", "root", "");
                Statement s = conexion.createStatement();
                Statement u = conexion.createStatement();
                session.removeAttribute("Registrado");
                session.removeAttribute("codigoUsuario"); 
                session.removeAttribute("contrasena"); 
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        
        %>
    </body>
</html>
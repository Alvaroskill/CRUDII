<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login</title>
            <link href="./styles.css" rel="stylesheet" type="text/css"/>
            <link rel="shortcut icon" href="./favicon/faviconbola.ico" type="image/x-icon">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	</head>

        <body id="login">
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
            try{
            %>
              <section class="h-100 gradient-form">
                  <div class="container py-5 h-100" >
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                      <div class="card rounded-3 text-black">
                        <div class="row g-0">
                          <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">
                                <% if (session.getAttribute("usuario") !=null) { response.sendRedirect("index.jsp"); } %>
                              <div class="text-center">
                                <img src="./img/logoFutbol.png" style="width: 185px;" alt="logo">
                                <h4 class="mt-1 mb-5 pb-1">CheckFut</h4>
                              </div>

                              <form action="comprobacionlogin.jsp"> 
                                <div class="form-outline mb-4">
                                  <input type="text" name="usuario" placeholder="Inserte el usuario"/>

                                </div>

                                <div class="form-outline mb-4">
                                  <input type="password" name="password" placeholder="Inserte la contrasena"/>
                                  
                                </div>
                                    <input type="submit" value="Enviar">
                              </form>
                               <div style="color: red;">
				<p>
				<%
                                    if (session.getAttribute("codigoUsuario") == null) {
                                    session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil.");
                                    

                                }

                                    
                                    } catch (Exception e){
                                        out.print(e);
                                }   
                            
                            %>
				</p>
                                </div>
                            </div>
                          </div>
                          <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="px-3 py-4 p-md-5 mx-md-4">
                              <h4 class="mb-4">Últimas novedades</h4>
                              <p class="small mb-0">Hemos actualizado nuestra tabla de equipos y ahora puedes añadir las ligas que ha ganado cada uno.</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
	</body>

	</html>
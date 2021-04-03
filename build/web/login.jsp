<%-- 
    Document   : login
    Created on : 25 nov. 2020, 12:21:36
    Author     : Pei
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Database" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Hoja de estilos -->
        <link rel="styleSheet" href="css/miestilo.css" type="text/css">
        <link rel="styleSheet" href="css/main.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Login</title>
        
    </head>
    <body>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./home.html">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Login</li>
                </ol>
            </nav>
            <div class="d-flex">
                <div class="col-sm-4 d-flex flex-column">
                    <h1>Ingresar</h1>
                    <br>
                    <div>
                        <div class="dropdown-divider"></div>
                        <form class="px-4 py-3" action="login.jsp" method="POST">
                            <div class="form-group">
                                <label for="user">Usuario</label>
                                <input type="text" class="form-control" name="user" placeholder="tuUsuario123">
                            </div>
                            <div class="form-group">
                                <label for="clave">Contraseña</label>
                                <input type="password" class="form-control" name="clave" placeholder="Contraseña">
                            </div>
                            <div class="form-group">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="chequeo">
                                    <label class="form-check-label" for="chequeo">
                                    Recuérdame</label>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-success" name="btnInic" value="Ingresar" />
                        </form>
                        <div class="dropdown-divider"></div>
                        <div>¿No tenés cuenta? <a href="./registro.jsp">Registrate</a></div>
                        <div><a href="#">Olvidé mi contraseña</a></div>
                    </div>
                </div>
            </div>
        </div>
        <%
        Database db = new Database();
        
        if(request.getParameter("btnInic") !=null){
                String usu = request.getParameter("user");
                String contra = request.getParameter("clave");
                HttpSession sesion = request.getSession();
                switch(db.log(usu, contra)){
                case 1: 
                    sesion.setAttribute("nick", usu);
                    sesion.setAttribute("acceso", "1");
                    response.sendRedirect("admin/admin.jsp");
                    break;
                case 2:
                    sesion.setAttribute("nick", usu);
                    sesion.setAttribute("acceso", "2");
                    response.sendRedirect("cliente/cliente-ppal.jsp");
                    break;
                default:
                    out.write("El usuario no existe, o sus credenciales son incorrectas.");
                    break;
            }
        }
        
        if(request.getParameter("cerrar")!=null){
            session.invalidate();
        }
        %>
    </body>
</html>

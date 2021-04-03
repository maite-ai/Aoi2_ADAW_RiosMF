<%-- 
    Document   : cliente-ppal
    Created on : 25 nov. 2020, 11:51:12
    Author     : Pei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Hoja de estilos -->
        <link rel="styleSheet" href="css/miestilo.css" type="text/css">
        <link rel="styleSheet" href="css/main.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Zona cliente</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        
        if(sesion.getAttribute("acceso")==null){
            response.sendRedirect("./../index.html");
        }else{
            String acceso = sesion.getAttribute("acceso").toString();
        }        
        %>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./../home.html">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><%= sesion.getAttribute("nick")%></li>
                </ol>
            </nav>
            <div class="form-group">
                <h1>Bienvenido, <%= sesion.getAttribute("nick")%> <svg width="0.7em" height="0.7em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                </svg></h1>
                <p class="float-right"><a href="./index.html"><input type="submit" class="btn btn-success" value="Salir | Logout" /></a></p>
            </div>
            <br><div class="dropdown-divider"></div>
            <div class="d-flex">
                <div class="card d-flex flex-column">
                    <h3 class="card-header">Visitar tienda en línea</h3><br>
                    <div class="card-body">    
                        <p class="card-text">Para acceder al catálogo de productos, ingrese <a href="./catalcliente.jsp">aquí</a>.</p>
                    </div>
                </div>
                <div class="card d-flex flex-column">
                    <h3 class="card-header">Mis Datos</h3><br>
                    <div class="card-body">
                        <p class="card-text"><a href="./clienteadmin.jsp">En esta sección</a>, encontrará sus datos. Mantenga actualizada su información.</p> 
                    </div>
                </div>
            </div>
            <div class="dropdown-divider"></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

    </body>
</html>

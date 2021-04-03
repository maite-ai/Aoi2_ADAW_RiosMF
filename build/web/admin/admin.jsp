<%-- 
    Document   : admin
    Created on : 25 nov. 2020, 10:35:29
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
        <title>Administrador</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        
        if(sesion.getAttribute("acceso")==null){
            response.sendRedirect("./../index.html");
        }else{
            String acceso = sesion.getAttribute("acceso").toString();
            if(!acceso.equals("1")){
                response.sendRedirect("./../index.html");
            }
        }        
        %>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./home.html">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Admin</li>
                </ol>
            </nav>
            <div class="form-group">
                <h1>Sección de Admins! <svg width="0.7em" height="0.7em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                 <path fill-rule="evenodd" d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z"/>
                 <path fill-rule="evenodd" d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z"/>
                    </svg></h1>
                <p class="float-right"><a href="./../home.html?cerrar=true"><button type="submit" class="btn btn-success">Salir | Logout</button></a></p>
            </div>
            <br><div class="dropdown-divider"></div>
            <div class="d-flex">
                <div class="card d-flex flex-column">
                    <h3 class="card-header">Administración del catálogo de productos</h3><br>
                    <div class="card-body">    
                        <p class="card-text">Para acceder al catálogo de productos, ingrese <a href="./adm-catalogo.jsp">aquí</a>.</p>
                        
                    </div>
                </div>
                <div class="card d-flex flex-column">
                    <h3 class="card-header">Administración de usuarios</h3><br>
                    <div class="card-body">
                        <p class="card-text">Para acceder a la base de datos de clientes, ingrese <a href="./adm-cliente.jsp">aquí</a>.</p> 
                    </div>
                </div>
            </div>
            <div class="dropdown-divider"></div>
        </div>
    </body>
</html>

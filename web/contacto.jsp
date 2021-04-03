<%-- 
    Document   : contacto
    Created on : 25 nov. 2020, 11:53:49
    Author     : Pei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Hoja de estilos -->
        <link rel="styleSheet" href="css/miestilo.css" type="text/css">
        <link rel="styleSheet" href="css/main.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Contáctenos</title>
        
    </head>
    <body>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./home.html">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Contáctenos</li>
                </ol>
            </nav>
            <div class="d-flex">
                <div class="col-sm-6 d-flex flex-column">
                    <h1>Dejanos un comentario</h1><br>

                    <form>
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="apellido">Apellido</label>
                                <input type="text" class="form-control" id="apellido" placeholder="Ingrese su apellido">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label for="email">Correo electrónico</label>
                                <input type="email" class="form-control" id="email" placeholder="Ingrese su correo electrónico">
                            </div>
                        </div>   
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label for="domicilio">Domicilio</label>
                                <input type="text" class="form-control" id="domicilio" placeholder="Ingrese su domicilio">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-7">
                                <label for="provincia">Provincia</label>
                                <select id="provincia" class="form-control">
                                    <option selected>Elija una opción...</option>
                                    <option>Capital Federal</option>
                                    <option>Buenos Aires</option>
                                    <option>Catamarca</option>
                                    <option>Chaco</option>
                                    <option>Chubut</option>
                                    <option>Córdoba</option>
                                    <option>Corrientes</option>
                                    <option>Entre Ríos</option>
                                    <option>Formosa</option>
                                    <option>Jujuy</option>
                                    <option>La Pampa</option>
                                    <option>La Rioja</option>
                                    <option>Mendoza</option>
                                    <option>Misiones</option>
                                    <option>Neuquén</option>
                                    <option>Río Negro</option>
                                    <option>Salta</option>
                                    <option>San Juan</option>
                                    <option>San Luis</option>
                                    <option>Santa Cruz</option>
                                    <option>Santa Fe</option>
                                    <option>Santiago del Estero</option>
                                    <option>Tierra del Fuego</option>
                                    <option>Tucumán</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comentario">Comentario</label>
                            <textarea id="comentarios" class="form-control" rows="10"></textarea>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="gridCheck">
                                <label class="form-check-label" for="gridCheck"></label>
                                Quiero que me contacten
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Enviar</button>
                        <button type="reset" class="btn btn-success">Cancelar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

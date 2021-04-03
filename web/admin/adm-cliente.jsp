<%-- 
    Document   : adm-cliente
    Created on : 25 nov. 2020, 11:42:10
    Author     : Pei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Hoja de estilos -->
        <link rel="styleSheet" href="css/miestilo.css" type="text/css">
        <link rel="styleSheet" href="css/main.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Usuarios</title>
    </head>
    <body>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./../index.html">Home</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="./admin.jsp">Admin</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
                </ol>
            </nav>
            <div class="col-auto">
                <h1>Usuarios</h1>
                <p class="float-left"><a href="./admin.jsp"><button type="submit" class="btn btn-success">Volver</button></a></p>
                <p class="float-right"><a href="./addUser.jsp"><button type="submit" class="btn btn-success">Agregar Usuarios</button></a></p>
            </div>
            <br>
            <div class="d-flex table-responsive">
                
                <table class="table table-striped">
                <thead class="thead-dark" align="center">
                    <tr>
                        <th>Nombre de Usuario</th><th>Contraseña</th><th>Nombre</th>
                        <th>Apellido</th><th>DNI</th><th>Domicilio</th>
                        <th>E-mail</th><th>Acciones</th>
                    </tr>
                </thead>
                <%
                    Connection con = null;
                    Statement sta = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notebooks?user=root&password=");
                        sta = con.createStatement();
                        rs = sta.executeQuery("SELECT nick, passw, nombre, apellido, dni, direccion, email FROM cliente INNER JOIN usuario ON cliente.usuario = usuario.idUser");
                        while(rs.next()){
                            %>
                            <tr align="center">
                                <th><%=rs.getString(1)%></th>
                                <th><%=rs.getString(2)%></th>
                                <th><%=rs.getString(3)%></th>
                                <th><%=rs.getString(4)%></th>
                                <th><%=rs.getInt(5)%></th>
                                <th><%=rs.getString(6)%></th>
                                <th><%=rs.getString(7)%></th>
                                <th>
                                    <a href="./editarProd.jsp"><svg width="1.1em" height="1.1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg></a> |
                                    <a href="./eliminarProd.jsp"><svg width="1.1em" height="1.1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                    </svg></a>
                                </th>
                            </tr>
                            <%
                        } // fin While
                        sta.close();
                        rs.close();
                        con.close();
                    }catch(Exception e){
                        System.out.print("No se logró conectar a la base de datos");
                    }
                %>
                </table>
            </div>
        </div>
    </body>
</html>

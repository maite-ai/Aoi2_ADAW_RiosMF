<%-- 
    Document   : huawei
    Created on : 25 nov. 2020, 12:01:03
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
        <title>Huawei</title>
    </head>
    <body>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./../home.html">Home</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="./../catalogo.jsp">Catálogo</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Huawei</li>
                </ol>
            </nav>
            <h1>Catálogo de Productos</h1>
            <h2>Huawei</h2>
            <br>
            <div class="d-flex table-responsive">
                <table class="table table-striped">
                <thead class="thead-dark" align="center">
                    <tr>
                        <th>Código Producto</th><th>Imagen</th><th>Marca</th>
                        <th>Modelo</th><th>Descripción</th><th>Precio</th>
                        <th>Ver producto</th>
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
                        rs = sta.executeQuery("select * from producto where marca = \"Huawei\" order by codigo");
                        while(rs.next()){
                            %>
                            <tr align="center">
                                <th><%=rs.getString(1)%></th>
                                <th><%=rs.getString(2)%></th>
                                <th><%=rs.getString(3)%></th>
                                <th><%=rs.getString(4)%></th>
                                <th><%=rs.getString(5)%></th>
                                <th><%=rs.getDouble(6)%></th>
                                <th>
                                    <a href="./ver.jsp"><svg width="1.7em" height="1.7em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
                                <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
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

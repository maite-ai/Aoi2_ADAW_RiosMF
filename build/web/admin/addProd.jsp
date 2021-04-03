<%-- 
    Document   : addProd
    Created on : 25/11/2020, 13:52:23
    Author     : Pei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Hoja de estilos -->
        <link rel="styleSheet" href="css/miestilo.css" type="text/css">
        <link rel="styleSheet" href="css/main.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Agregar productos</title>
    </head>
    <body>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./../home.html">Home</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="./admin.jsp">Admin</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="./adm-catalogo.jsp">Catálogo</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Agregar Producto</li>
                </ol>
            </nav>
            <div class="col-auto">
                <h1>Agregar producto</h1>
                <p class="float-left"><a href="./admin.jsp"><button type="submit" class="btn btn-success">Volver</button></a></p>
            </div>
            <br>
            <div class="d-flex table-responsive">
                <form method="POST">
                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <label for="codProd">Código de producto</label>
                            <input type="text" class="form-control" id="codProd" placeholder="Código producto">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="marca">Marca</label>
                            <select id="marca" class="form-control">
                                <option selected>Elija una opción...</option>
                                <option>Dell</option>
                                <option>HP</option>
                                <option>Huawei</option>
                                <option>Lenovo</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <label for="modelo">Modelo</label>
                            <input type="text" class="form-control" id="modelo" placeholder="Nombre del modelo">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="precio">Precio</label>
                            <input type="text" class="form-control" id="precio" placeholder="Precio en dólares">
                        </div>
                    </div>   
                    <div class="form-row">
                        <div class="form-group col-sm-12">
                            <label for="desc">Descripción</label>
                            <textarea type="text" class="form-control" id="desc" placeholder="Procesador-RAM-Pantalla-SO" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <label for="imagen">Imágen</label>
                            <input type="text" class="form-control" id="imagen" placeholder="Imagen...">
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success" name="btnguardar" value="Guardar">
                    <input type="reset" class="btn btn-success" value="Limpiar formulario">           
                </form>
            </div>
        </div>
        <%
            if(request.getParameter("btnguardar")!=null){
                String cod = request.getParameter("codProd");
                String img = request.getParameter("imagen");
                String mar = request.getParameter("marca");
                String mod = request.getParameter("modelo");
                String des = request.getParameter("desc");
                double pre = Double.parseDouble(request.getParameter("precio"));
            
                Connection con=null;
                Statement st=null;
                ResultSet rs=null;
                   
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notebooks?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("insert into producto values ('"+cod+"','"+img+"','"+mar+"','"+mod+"','"+des+"',"+pre+")");
                    request.getRequestDispatcher("./adm-catalogo.jsp").forward(request, response);
                    st.close();
                    rs.close();
                    con.close();
                }catch(Exception e){
                    out.print(e+"");
                }
            }
           %>
    </body>
</html>

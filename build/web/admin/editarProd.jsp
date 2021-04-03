<%-- 
    Document   : editarProd
    Created on : 25/11/2020, 15:15:36
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
        <title>Modificar producto</title>
    </head>
    <body>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item" aria-current="page"><a href="./../home.html">Home</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="./admin.jsp">Admin</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="./adm-catalogo.jsp">Catálogo</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Modificar producto</li>
                </ol>
            </nav>
            <div class="col-auto">
                <h1>Modificar producto</h1>
                <p class="float-left"><a href="./adm-catalogo.jsp"><button type="submit" class="btn btn-success">al catálogo</button></a></p>
            </div>
            <%
                String code = request.getParameter("codigo");
                
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notebooks?user=root&password=");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM producto WHERE codigo='"+code+"'");
                    while(rs.next()){
                 %>
            <div class="d-flex table-responsive">
                <table class="table">
                    <tr>
                        <td>Código Producto</td>
                        <td><input type="text" class="form-control" name="codProd" value="<%= rs.getString(1)%>" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td>Imagen</td>
                        <td><input type="text" class="form-control" name="imagen" value="<%= rs.getString(2)%>"></td>
                    </tr>
                    <tr>
                        <td>Marca</td>
                        <td><input type="text" class="form-control" name="marca" value="<%= rs.getString(3)%>"></td>
                    </tr>
                    <tr>
                        <td>Modelo</td>
                        <td><input type="text" class="form-control" name="modelo" value="<%= rs.getString(4)%>"></td>
                    </tr>
                    <tr>    
                        <td>Descripción</td>
                        <td><input type="text" class="form-control" name="desc" value="<%= rs.getString(5)%>"></td>
                    </tr>
                    <tr>    
                        <td>Precio</td>
                        <td><input type="text" class="form-control" name="precio" value="<%= rs.getString(6)%>"></td>
                    </tr>
                    <tr>    
                        <th colspan="2">
                        <td><input type="submit" class="btn btn-success" name="btnguardar" value="Guardar cambios"></td>
                    </tr>
                </table>
            </div>
                <%
                    }
                }catch(Exception e){}
                    
                if(request.getParameter("btnguardar") !=null){
                    String cod = request.getParameter("codProd");
                    String img = request.getParameter("imagen");
                    String mar = request.getParameter("marca");
                    String mod = request.getParameter("modelo");
                    String des = request.getParameter("desc");
                    Double pre = Double.parseDouble(request.getParameter("precio"));
                    
                    st.executeUpdate("UPDATE producto SET codImagen='"+img+"', marca='"+mar+"', modelo='"+mod+"', descripcion='"+des+"', precio="+pre+" WHERE codigo='"+cod+"'");
                    request.getRequestDispatcher("./adm-catalogo.jsp").forward(request, response);
                    
                    st.close();
                    rs.close();
                    con.close();
                }
            %>
        </div>
            <br>
    </body>
</html>

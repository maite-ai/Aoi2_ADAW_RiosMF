<%-- 
    Document   : eliminarProd
    Created on : 25/11/2020, 16:05:07
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
        <title>Eliminar producto</title>
    </head>
    <body>
        <%
            String code=request.getParameter("codigo");
            
            Connection con= null;
            Statement st=null;
            ResultSet rs=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notebooks?user=root&password=");
                st=con.createStatement();
                st.executeUpdate("DELETE FROM producto WHERE codigo='"+code+"'");
                
                request.getRequestDispatcher("./admin.jsp").forward(request, response);
                st.close();
                rs.close();
                con.close();
            }catch(Exception e){
                out.print(e+"");
            }
            
        %>
    </body>
</html>

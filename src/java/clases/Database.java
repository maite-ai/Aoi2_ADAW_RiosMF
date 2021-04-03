/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.sql.*;
/**
 *
 * @author Pei
 */
public class Database {
    String driver;
    String url;
    String user;
    String contra;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
        
    public Database() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/notebooks";
        user = "root";
        contra = "";
    }
    
    public Connection getConnection(){
        return con;
    }
    
    public int log(String us, String pw){
        int acceso=0;
        String sql="SELECT acceso FROM usuario WHERE nick='"+us+"' AND passw='"+pw+"'";
        
        try {
            Class.forName(this.driver);
            con=DriverManager.getConnection(this.url, this.user, this.contra);
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
                acceso=rs.getInt(1);
            }
            con.close();
        }catch(ClassNotFoundException | SQLException e){}
        return acceso;
    }
    
}

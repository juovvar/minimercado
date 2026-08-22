//Conexión a la base de datos mediante JDBC
package mini_mercado.config;
import java.sql.Connection;
import java.sql.DriverManager;
public class Conexion {
    public static Connection getConexion(){
        Connection conexion = null;
        var baseDatos = "MiniMercadoDB";
        var url = "jdbc:mysql://localhost:4000/" + baseDatos;
        var usuario = "root";
        var password = "admin";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, password);
        } catch (Exception e) {
            System.out.println("Ocurrio un error al conectarse a la base de datos = " + e.getMessage());
        }
        return conexion;
    }

    public static void main(String[] args) {
        var conexion = Conexion.getConexion();
        if(conexion != null) System.out.println("Conexion exitosa = " + conexion);
        else System.out.println("Error al conectarse");
    }
}
package newpackage;

import java.sql.*;

public class ConnectionDao {
    private static Connection con;
    
    public static Connection getConnection() {        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rent_a_car?useUnicoude=true&useLegacyDatetimeCode=false&serverTimezone=Turkey","root","root");
            //con=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_36b3b4ea22d1c07?reconnect=trueuseUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey","ba951270d6de2a","2390d7fe");
        
        }catch(ClassNotFoundException | SQLException e){
        }
        return con;
    }   
}
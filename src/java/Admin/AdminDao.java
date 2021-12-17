package Admin;

import java.sql.*;

public class AdminDao {
    Connection con ;
    
     public AdminDao(Connection con) {
        this.con = con;
    }
    //admin login
    public Admin logAdmin(String email, String pass){
        Admin admin = null;
        try {            
            String query = "SELECT * FROM admin WHERE email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
            } else {
            }            
        } catch (SQLException e) {
        }
        return admin;
    }    
}
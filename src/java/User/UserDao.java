package User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    Connection con ; 

    public UserDao(Connection con) {
        this.con = con;
    }
    //for register user 
    public boolean saveUser(User user){
        boolean set = false;
        try{
           //Insert register data to database
           String query = "INSERT INTO user(name,email,password) VALUES(?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, user.getName());
           pt.setString(2, user.getEmail());
           pt.setString(3, user.getPassword());
           
           pt.executeUpdate();
           set = true;
        }catch(SQLException e){
        }
        return set;
    }
    //user login
    public User logUser(String email, String pass){
        User user = null;
        try {            
            String query = "SELECT * FROM user WHERE email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setU_id(rs.getInt("u_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            } else {
            }            
        } catch (SQLException e) {
        }
        return user;
    }    
    //list all users
    public List<User> listAllUsers() {        
        //create a list object
        List<User> users = new ArrayList<> ();        
        //create a connection
        try  {    
            String query = "SELECT * FROM user";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();            
            //run into table information
            while (rs.next()) {
                int u_id = rs.getInt("u_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");                 
                //User row = new User(id, name, email, password);
                //users.add(row);
                users.add(new User(u_id, name, email, password));   
            }
        } catch (SQLException e) {
        }
        return users;
    }    
    //delete users from database   
    public void deleteUser(String u_id){
        try{            
           String query= "DELETE FROM user WHERE u_id=?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, u_id);
           pt.execute();
            
        }catch(SQLException e){
        }
    }
}
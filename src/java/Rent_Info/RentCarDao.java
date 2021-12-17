package Rent_Info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentCarDao {
    Connection con ;
    
    public RentCarDao(Connection con) {
        this.con = con;
    }
    //add new rented
    public boolean saveRent(Rent rent){
        boolean set = false;
        //Insert register data to database
        String query = "INSERT INTO rent_info(plate,u_id,st_date,fin_date,r_price,r_durum) VALUES(?,?,?,?,?,?)";
        try{        
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, rent.getPlate());
           pt.setInt   (2, rent.getU_id());
           pt.setString(3, rent.getSt_date());
           pt.setString(4, rent.getFin_date());
           pt.setString(5, rent.getR_price());
           pt.setInt(6, rent.getR_durum());

           
           pt.executeUpdate();
           set = true;
        }catch(SQLException e){
        }
        return set;
    }
    //list all users
    public List<Rent> listAllRented() {        
        //create a list object
        List<Rent> rents = new ArrayList<> ();        
        //create a connection
        try  {    
            String query = "SELECT * FROM rent_info WHERE r_durum=1";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();            
            //run into table information
            while (rs.next()) {
                int r_id = rs.getInt("r_id");
                String plate = rs.getString("plate");
                int u_id = rs.getInt("u_id");
                String st_date = rs.getString("st_date");
                String fin_date = rs.getString("fin_date");
                String r_price = rs.getString("r_price");
                //Rent row = new User(id, name, email, password);
                //rents.add(row);
                rents.add(new Rent(r_id, plate, u_id, st_date, fin_date, r_price));   
            }
        } catch (SQLException e) {
        }
        return rents;
    }
    //select one car    
    public List<Rent> listedSelectedRented(String plate){
        List<Rent> rents = new ArrayList<> ();        
        try{
            String query = "SELECT * FROM rent_info WHERE r_durum=1 AND plate=?";            
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, plate);
            ResultSet rs= pst.executeQuery();            
            while(rs.next()){
                int r_id = rs.getInt("r_id");
                String plate1 = rs.getString("plate");
                int u_id = rs.getInt("u_id");
                String st_date = rs.getString("st_date");
                String fin_date = rs.getString("fin_date");
                String r_price = rs.getString("r_price");
                rents.add(new Rent(r_id, plate1, u_id, st_date, fin_date, r_price));
            }
        }catch(SQLException e){
        }
        return rents;
    } 
    //select rented car    
    public List<Rent> listedUserRented(int u_id){
        List<Rent> renteds = new ArrayList<> ();        
        try{
            String query = "SELECT * FROM rent_info WHERE u_id=? AND r_durum=1";            
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, u_id);
            ResultSet rs= pst.executeQuery();            
            while(rs.next()){
                int r_id1 = rs.getInt("r_id");
                String plate = rs.getString("plate");
                int u_id1 = rs.getInt("u_id");
                String st_tar = rs.getString("st_date");
                String fin_date = rs.getString("fin_date");
                String r_price = rs.getString("r_price");
                renteds.add(new Rent(r_id1, plate, u_id1, st_tar, fin_date, r_price));
            }
        }catch(SQLException e){
        }
        return renteds;
    }//select old rented car    
    public List<Rent> listedOldUserRented(int u_id){
        List<Rent> renteds = new ArrayList<> ();        
        try{
            String query = "SELECT * FROM rent_info WHERE u_id=? AND r_durum=0";            
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, u_id);
            ResultSet rs= pst.executeQuery();            
            while(rs.next()){
                int r_id1 = rs.getInt("r_id");
                String plate = rs.getString("plate");
                int u_id1 = rs.getInt("u_id");
                String st_tar = rs.getString("st_date");
                String fin_date = rs.getString("fin_date");
                String r_price = rs.getString("r_price");
                renteds.add(new Rent(r_id1, plate, u_id1, st_tar, fin_date, r_price));
            }
        }catch(SQLException e){
        }
        return renteds;
    }    
    //update r_durum from database   
    public boolean stopRented(Rent rent){   
        boolean test = false;
        try{            
           String query = "UPDATE rent_info SET r_durum=? WHERE r_id=?";
           PreparedStatement pt = this.con.prepareStatement(query);           
           pt.setInt(1, rent.getR_durum());
           pt.setInt(2, rent.getR_id());
           pt.executeUpdate();   
           test = true;
        }catch(SQLException e){
        }
        return test;
    }   
}
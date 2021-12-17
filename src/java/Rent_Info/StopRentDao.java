package Rent_Info;

import Car.Car;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StopRentDao {
    Connection con ;  

    public StopRentDao(Connection con) {
        this.con = con;
    }
    //edit car durum info
    public boolean editCarDurum(Car car){
        boolean test = false; 
        try{
            String query = "UPDATE car_info SET durum=? WHERE c_id=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, car.getDurum());
            pt.setInt(2, car.getC_id());
            
            pt.executeUpdate();
            test = true;
        }catch(SQLException e){
        }   
        return test;
    } 
}

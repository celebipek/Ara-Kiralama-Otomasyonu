package Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDao {
    Connection con;
    
    public CarDao(Connection con){
        this.con = con;
    }    
    //add new car
    public boolean saveCar(Car car){
        boolean set = false;   
        //Insert register data to database
        String query = "INSERT INTO car_info(plate,brand,color,price,durum) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, car.getPlate());
            pst.setString(2, car.getBrand());
            pst.setString(3, car.getColor());
            pst.setString(4, car.getPrice());       
            pst.setInt(5, 1);
            pst.executeUpdate();
            set=true;            
        } catch (SQLException e) {
        }
        return set;
    }
    //list all cars
    public List<Car> listAllCars() {        
        //create a list object
        List<Car> cars = new ArrayList<> ();        
        //create a connection
        try  {
            String query = "SELECT * FROM car_info";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();            
            //run into table information
            while (rs.next()) {
                int c_id = rs.getInt("c_id");
                String plate = rs.getString("plate");
                String brand = rs.getString("brand");
                String color = rs.getString("color");
                String price = rs.getString("price");    
                int durum = rs.getInt("durum");
                //Car row = new Car(plate, brand, color, price);
                //cars.add(row);
                cars.add(new Car(c_id, plate, brand, color, price, durum));    
            }
        } catch (SQLException e) {
        }
        return cars;
    }
    //list available car
    public List<Car> listAvailableCars() {        
        List<Car> cars = new ArrayList<> (); 
        try  {
            String query = "SELECT * FROM car_info WHERE durum=0";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();            
            //run into table information
            while (rs.next()) {
                int c_id = rs.getInt("c_id");
                String plate = rs.getString("plate");
                String brand = rs.getString("brand");
                String color = rs.getString("color");
                String price = rs.getString("price"); 
                //Car row = new Car(plate, brand, color, price);
                //cars.add(row);
                cars.add(new Car(c_id, plate, brand, color, price));    
            }
        } catch (SQLException e) {
        }
        return cars;
    }
    //list rented car
    public List<Car> listUnavailableCars() {        
        //create a list object
        List<Car> cars = new ArrayList<> ();        
        //create a connection
        try  {
            String query = "SELECT * FROM car_info WHERE durum=1";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();            
            //run into table information
            while (rs.next()) {
                int c_id = rs.getInt("c_id");
                String plate = rs.getString("plate");
                String brand = rs.getString("brand");
                String color = rs.getString("color");
                String price = rs.getString("price"); 
                int durum = rs.getInt("durum");
                //Car row = new Car(plate, brand, color, price);
                //cars.add(row);
                cars.add(new Car(c_id, plate, brand, color, price, durum));    
            }
        } catch (SQLException e) {
        }
        return cars;
    }
    //select one car    
    public Car selectOneCar(int c_id){
        Car bk = null;        
        try{
            String query = "SELECT * FROM car_info WHERE c_id=?";            
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, c_id);
            ResultSet rs= pst.executeQuery();
            
            while(rs.next()){
                int c_id1 = rs.getInt("c_id");
                String plate = rs.getString("plate");
                String brand = rs.getString("brand");
                String color = rs.getString("color");
                String price  = rs.getString("price");
                int durum = rs.getInt("durum");
                bk = new Car(c_id1,plate,brand,color,price,durum);
            }
        }catch(SQLException e){
        }
        return bk;
    }    
    //edit car info
    public boolean editCar(Car car){
        boolean test = false; 
        try{
            String query = "UPDATE car_info SET plate=?, brand=?, color=?, price=?, durum=? WHERE c_id=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, car.getPlate());
            pt.setString(2, car.getBrand());
            pt.setString(3, car.getColor());
            pt.setString(4, car.getPrice());
            pt.setInt(5, car.getDurum());
            pt.setInt(6, car.getC_id());
            
            pt.executeUpdate();
            test = true;
        }catch(SQLException e){
        }   
        return test;
    }
    //edit car durum info
    public boolean editCarDurum(Car car){
        boolean test = false; 
        try{
            String query = "UPDATE car_info SET durum=? WHERE plate=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, car.getDurum());
            pt.setString(2, car.getPlate());
            
            pt.executeUpdate();
            test = true;
        }catch(SQLException e){
        }   
        return test;
    }    
    //delete car info
    public void deleteCar(String c_id){
        try{            
           String query= "DELETE FROM car_info WHERE c_id=?";
           PreparedStatement pst = this.con.prepareStatement(query);
           pst.setString(1, c_id);
           pst.execute();
            
        }catch(SQLException e){
        }
    } 
}
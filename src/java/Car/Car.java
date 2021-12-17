package Car;

public class Car {
    int c_id;
    String plate;
    String brand;
    String color;
    String price;
    int durum;

    public Car() {
    }
    //superclass KiraBilgisi
    public Car(String plate) {
        this.plate = plate;
    }

    public Car(String plate, String brand, String color, String price) {
        this.plate = plate;
        this.brand = brand;
        this.color = color;
        this.price = price;
    }   
    
    public Car(String plate, String brand, String color, String price, int durum) {
        this.plate = plate;
        this.brand = brand;
        this.color = color;
        this.price = price;
        this.durum = durum;
    }

    public Car(int c_id, String plate, String brand, String color, String price) {
        this.c_id = c_id;
        this.plate = plate;
        this.brand = brand;
        this.color = color;
        this.price = price;
    }   
   
    public Car(int c_id, String plate, String brand, String color, String price, int durum) {
        this.c_id = c_id;
        this.plate = plate;
        this.brand = brand;
        this.color = color;
        this.price = price;
        this.durum = durum;
    }

    public Car(int c_id, int durum) {
        this.c_id = c_id;
        this.durum = durum;
    }

    public Car(String plate, int durum) {
        this.plate = plate;
        this.durum = durum;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int id) {
        this.c_id = id;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getDurum() {
        return durum;
    }

    public void setDurum(int durum) {
        this.durum = durum;
    }    
}
package Rent_Info;

public class Rent {
    int r_id;
    String plate;
    int u_id;
    String st_date;
    String fin_date;
    String r_price;
    int r_durum;

    public Rent() {
    }

    public Rent(int r_id) {
        this.r_id = r_id;
    }

    public Rent(String plate, int r_durum) {
        this.plate = plate;
        this.r_durum = r_durum;
    }

    public Rent(int r_id, int r_durum) {
        this.r_id = r_id;
        this.r_durum = r_durum;
    }

    public Rent(String plate, int u_id, String st_date, String fin_date, String r_price, int r_durum) {
        this.plate = plate;
        this.u_id = u_id;
        this.st_date = st_date;
        this.fin_date = fin_date;
        this.r_price = r_price;
        this.r_durum = r_durum;
    }

    public Rent(String plate, int u_id, String st_date, String fin_date, String r_price) {
        this.plate = plate;
        this.u_id = u_id;
        this.st_date = st_date;
        this.fin_date = fin_date;
        this.r_price = r_price;
    }

    public Rent(int r_id, String plate, int u_id, String st_date, String fin_date, String r_price) {
        this.r_id = r_id;
        this.plate = plate;
        this.u_id = u_id;
        this.st_date = st_date;
        this.fin_date = fin_date;
        this.r_price = r_price;
    }

    public Rent(int r_id, String plate, int u_id, String st_date, String fin_date, String r_price, int r_durum) {
        this.r_id = r_id;
        this.plate = plate;
        this.u_id = u_id;
        this.st_date = st_date;
        this.fin_date = fin_date;
        this.r_price = r_price;
        this.r_durum = r_durum;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getSt_date() {
        return st_date;
    }

    public void setSt_date(String st_date) {
        this.st_date = st_date;
    }

    public String getFin_date() {
        return fin_date;
    }

    public void setFin_date(String fin_date) {
        this.fin_date = fin_date;
    }

    public String getR_price() {
        return r_price;
    }

    public void setR_price(String r_price) {
        this.r_price = r_price;
    }

    public int getR_durum() {
        return r_durum;
    }

    public void setR_durum(int r_durum) {
        this.r_durum = r_durum;
    }
}
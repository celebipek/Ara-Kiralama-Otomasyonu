package Rent_Info;

import Car.Car;
import Car.CarDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import newpackage.ConnectionDao;

public class StopRentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {       
            //fetch rent_info data from pay.jsp
            int admin = Integer.parseInt(request.getParameter("admin"));
            int r_id = Integer.parseInt(request.getParameter("r_id"));
            int r_durum = Integer.parseInt(request.getParameter("r_durum")); 
            Rent rent = new Rent(r_id, r_durum);
            RentCarDao rentdao = new RentCarDao(ConnectionDao.getConnection());            
                              
            try{ 
                if (rentdao.stopRented(rent)){
                    if (admin == 1) {                    
                        response.sendRedirect("adminWelcomePage.jsp");
                    } else {
                        response.sendRedirect("userWelcomePage.jsp");
                    }
                }else{
                    out.println("Wrong Way");
                }   
            }catch(IOException e){
            }            
        }
    }
}
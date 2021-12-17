package Car;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import newpackage.ConnectionDao;

public class EditCarServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {                      
            //fetch data from form
            int c_id = Integer.parseInt(request.getParameter("c_id"));   
            String plate = request.getParameter("plate");
            String brand = request.getParameter("brand");
            String color = request.getParameter("color");          
            String price = request.getParameter("price");
            int durum = Integer.parseInt(request.getParameter("durum"));
            
            Car car = new Car();
            car.setC_id(c_id);
            car.setPlate(plate);
            car.setBrand(brand);
            car.setColor(color);
            car.setPrice(price);
            car.setDurum(durum);
            
            CarDao cardao = new CarDao(ConnectionDao.getConnection());
            boolean success = cardao.editCar(car);
            if(success){  
                response.sendRedirect("adminWelcomePage.jsp");
            }else{
                out.println(car);
                out.println("Smth Wrong");
            } 
        }
    }
}
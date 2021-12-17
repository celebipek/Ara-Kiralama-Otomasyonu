package Car;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import newpackage.ConnectionDao;

public class NewCarServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {        
            //fetch data from form
            String plate = request.getParameter("plate");
            String brand = request.getParameter("brand");
            String color = request.getParameter("color");
            String price = request.getParameter("price");
            Car car = new Car(plate, brand, color, price);
            try{
                CarDao cardao = new CarDao(ConnectionDao.getConnection());
                if (cardao.saveCar(car)){
                    response.sendRedirect("adminWelcomePage.jsp");
                }else{
                    out.println("Smth Wrong");
                }
            }catch(IOException e){
            }
        }
    }
}
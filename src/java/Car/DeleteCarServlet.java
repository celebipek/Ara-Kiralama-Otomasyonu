package Car;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import newpackage.ConnectionDao;

public class DeleteCarServlet extends HttpServlet {    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {            
            String c_id = request.getParameter("c_id");            
            try{
                CarDao carDel = new CarDao(ConnectionDao.getConnection());
                carDel.deleteCar(c_id);
                response.sendRedirect("adminWelcomePage.jsp");
            }catch(Exception e){
                e.printStackTrace();
            }            
            out.println("</body>");
            out.println("</html>");
        }
    }
}
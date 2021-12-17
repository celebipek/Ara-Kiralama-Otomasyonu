package User;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import newpackage.ConnectionDao;

public class DeleteUserServlet extends HttpServlet {    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {            
            String u_id = request.getParameter("u_id");            
            try{
                UserDao userDel = new UserDao(ConnectionDao.getConnection());
                userDel.deleteUser(u_id);
                response.sendRedirect("adminWelcomePage.jsp");
            }catch(IOException e){
            }    
        }
    }
}
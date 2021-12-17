package User;

import Admin.Admin;
import Admin.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import newpackage.ConnectionDao;

public class LoginUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String logEmail = request.getParameter("email");
            String logPass = request.getParameter("password");
            
            UserDao db = new UserDao(ConnectionDao.getConnection());
            User user = db.logUser(logEmail, logPass);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("logUser", user);
                
                Cookie cookie1 = new Cookie ("logEmail",logEmail);
                Cookie cookie2 = new Cookie ("logPass",logPass);
                cookie1.setMaxAge(10000);
                cookie2.setMaxAge(10000);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
                
                response.sendRedirect("userWelcomePage.jsp");
            } else {    
                out.println("User doesnt exist");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            } 
        }
    }
}
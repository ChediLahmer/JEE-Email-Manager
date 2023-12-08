package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserService;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();


        userService = new UserService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            try {
                String id = request.getParameter("id");
                int status = userService.deleteUser(id); 
                if (status == 1) {
                    response.sendRedirect("index.jsp");
                }   
            } catch (Exception e) {
                System.out.print(e);
            }
        } else {
            response.sendRedirect("auth.jsp");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        userService.closeConnection();
    }
}

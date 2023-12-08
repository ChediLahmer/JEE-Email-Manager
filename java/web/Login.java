package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import Service.UserService;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String login = request.getParameter("login");
        String passw = request.getParameter("pwd");

        try {
            User user = userService.loginUser(login, passw);

            if (user != null) {
                session.setAttribute("login", login);
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("auth.jsp");
            }
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        userService.closeConnection();
    }
}

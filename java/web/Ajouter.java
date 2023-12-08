package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.file.Matcher;

import Service.UserService;
import Model.User;
@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection con;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();

        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            try {
                String login = request.getParameter("login");
                String password = request.getParameter("pwd");
                String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(gmail|yahoo|hotmail).com$";


                Pattern pattern = Pattern.compile(emailRegex);
                java.util.regex.Matcher matcher = pattern.matcher(login);
                if (matcher.matches()) {
                if(userService.ajouter(login, password) == 1) {
                response.sendRedirect("index.jsp");}
                }else {
                	response.sendRedirect("ajouter.jsp");
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
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

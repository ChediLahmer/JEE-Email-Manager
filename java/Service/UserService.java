package Service;

import Model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private Connection con;

    public UserService() {
        // Initialize the database connection
        String url = "jdbc:mysql://localhost:3306/tp";
        String user = "root";
        String pwd = "20638109";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pwd);
        } catch (Exception e) {
            throw new RuntimeException("Error initializing database connection", e);
        }
    }

    public int deleteUser(String id) {
        try {
            PreparedStatement pst = con.prepareStatement("DELETE FROM Users WHERE id=?");
            pst.setString(1, id);
            int rowsAffected = pst.executeUpdate();
            pst.close();
            return rowsAffected;  // Return the number of rows affected
        } catch (Exception e) {
            throw new RuntimeException("Error deleting user", e);
        }
    }

    public int ajouter(String email, String password) {
        try {
            PreparedStatement pst = con.prepareStatement("INSERT INTO Users (email, password) VALUES (?,?)");
            pst.setString(1, email);
            pst.setString(2, password);
            pst.executeUpdate();
            pst.close();
            return 1;
        } catch (Exception e) {
            System.out.print(e);
            return 0;  // Return 0 in case of an exception
        }
    }

    public User loginUser(String email, String password) {
        try {
            PreparedStatement pst = con.prepareStatement("SELECT id FROM Users WHERE email=? AND password=?");
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            User user = null;
            if (rs.next()) {
                user = new User();
                user.setEmail(email);
                user.setPassword(password);
                user.setId(rs.getInt("id"));
            }

            rs.close();
            pst.close();

            return user;
        } catch (Exception e) {
            throw new RuntimeException("Error logging in user", e);
        }
    }

    public void closeConnection() {
        // Close the database connection when the service is no longer needed
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM Users");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));

                userList.add(user);
            }

            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }

}

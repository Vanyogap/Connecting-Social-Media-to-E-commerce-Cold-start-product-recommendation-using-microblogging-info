package network;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177215)
public class FileUploadDBSer extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/e_commerce";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String age = request.getParameter("age");
        String edu = request.getParameter("edu");
        String interest = request.getParameter("interest");
        String country = request.getParameter("country");
        String gen = request.getParameter("gen");
        String marital = request.getParameter("marital");
        System.out.println("User Reg :" + uname + email + pass + age + edu + interest + country + gen + marital);
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {

            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());


            inputStream = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO reg (uname, email, pass, age, edu, interest, country, gen, marital, photo) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, email);
            statement.setString(3, pass);
            statement.setString(4, age);
            statement.setString(5, edu);
            statement.setString(6, interest);
            statement.setString(7, country);
            statement.setString(8, gen);
            statement.setString(9, marital);

            if (inputStream != null) {
                statement.setBlob(10, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("index.jsp?reg=success");
            } else {
                response.sendRedirect("index.jsp?regg=Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
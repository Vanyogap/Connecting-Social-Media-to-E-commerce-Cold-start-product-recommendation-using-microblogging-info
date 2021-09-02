/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet("/Recommends")
@MultipartConfig(maxFileSize = 16177215)
public class Recommend extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/e_commerce";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

//        String gen = request.getParameter("gen");
//        String age = request.getParameter("age");
//        String marital = request.getParameter("marital");
//        String edu = request.getParameter("edu");
//        String interest = request.getParameter("interest");
        String cat=request.getParameter("cat");
        String content = request.getParameter("content");
        String rate = request.getParameter("rate");
        String pname = request.getParameter("pname");

//        System.out.println("User Recommend :" + gen + age + marital + edu + interest + content);
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
        System.out.println("User Recommend :" + cat+content);

        String sql="INSERT INTO recomend(content,rate,pname,photo,cat) values(?,?,?,?,?)";
//            String sql = "INSERT INTO recomend (gen, age, marital, edu, interest, content, rate, pname, photo) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
//            statement.setString(1, gen);
//            statement.setString(2, age);
//            statement.setString(3, marital);
//            statement.setString(4, edu);
//            statement.setString(5, interest);
            statement.setString(1, content);
            statement.setString(2, rate);
            statement.setString(3, pname);
            statement.setString(5, cat);

            if (inputStream != null) {
                statement.setBlob(4, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("recommend.jsp?msg=success");
            } else {
                response.sendRedirect("recommend.jsp?msg=Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
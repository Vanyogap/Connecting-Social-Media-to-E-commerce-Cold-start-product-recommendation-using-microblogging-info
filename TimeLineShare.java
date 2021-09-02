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
 
@WebServlet("/Timeline")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class TimeLineShare extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/e_commerce";
    private String dbUser = "root";
    private String dbPass = "root";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
          HttpSession session = request.getSession(true);
          String uid = (String) session.getAttribute("sssid");
          String name = (String) session.getAttribute("sssname");
          String content = request.getParameter("content");
          String cat = request.getParameter("cat");
          
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO timeline (uid, name, content, photo,cat) values (?, ?, ?, ?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uid);
            statement.setString(2, name);
            statement.setString(3, content);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            }
             statement.setString(5, cat);
            System.out.println("image upload sucess");
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                System.out.println("Image share on time line....");
                response.sendRedirect("share.jsp?msg=success");
            }else{
                response.sendRedirect("share.jsp?msgg=Failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Java4
 */
public class DbConnection {
    public static Connection getConnection()
    {
        Connection con = null;
        try{
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "root");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}

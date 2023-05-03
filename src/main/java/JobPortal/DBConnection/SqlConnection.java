/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JobPortal.DBConnection;

import JobPortal.Config;
import com.mysql.cj.jdbc.exceptions.CommunicationsException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {
    /**
     * Connect to MySQL server
     *
     * @return connection
     */
    public static Connection dbConnector() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(Config.getConfig("DB_URL"), Config.getConfig("DB_USER"), Config.getConfig("DB_PASS"));
        } catch (CommunicationsException ex) {
            throw new SQLException("Database service not found", ex);
        } catch (ClassNotFoundException | SQLException ex) {
            throw new SQLException("Failed to connect to database", ex);
        }
    }

}

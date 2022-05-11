/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.sql;

import java.sql.*;

public class SqlConnection {

    Connection conn = null;

    /**
     * Connect to MySQL server
     *
     * @return connection
     */
    public static Connection dbConnector() {
        try {

            String url = "jdbc:mysql://localhost:3306/jobportal";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, "root", "");

            return conn;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
    }

}

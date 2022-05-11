/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.Credentials.dao;

import java.sql.*;

import com.jobportal.project.Employee.Bean.Employee;
import com.jobportal.project.sql.SqlConnection;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class UserLoginDao {

    String query = "select * from employee where email=? and password=?";
    Connection con = null;

    /**
     * Check employee login
     * 
     * @param email
     * @param pass
     * @param session
     * @return
     */
    public boolean validate(String email, String pass, HttpSession session) {
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getString(10));
                System.out.println("UserID: " + e.getID());
                session.setAttribute("ID", e.getID());
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

}

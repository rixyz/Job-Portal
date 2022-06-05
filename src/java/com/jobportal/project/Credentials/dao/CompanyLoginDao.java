/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.Credentials.dao;

import com.jobportal.project.Company.Bean.Company;
import com.jobportal.project.Company.dao.CompanyDao;
import com.jobportal.project.sql.SqlConnection;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class CompanyLoginDao {

    Connection con = null;

    /**
     * Check COmpany Login
     *
     * @param email
     * @param pass
     * @param session
     * @return
     */
    public boolean validate(String email, String pass, HttpSession session) {
        System.out.println("validate Started");
        String query = "select * from companies where email=? and password=?";
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Company c = CompanyDao.getCompanyByEmail(email);
                session.setAttribute("ID", c.getCid());
                session.setAttribute("Name", c.getCname());
                session.setAttribute("Type", "Company");
                System.out.println("Login Successful");
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("validate failed");
        }
        return false;

    }

}

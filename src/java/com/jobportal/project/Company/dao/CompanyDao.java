package com.jobportal.project.Company.dao;

import com.jobportal.project.Company.Bean.Company;
import com.jobportal.project.sql.SqlConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CompanyDao {

    static Connection con = null;

    /**
     * Register New Company
     *
     * @param username
     * @param password
     * @param web
     * @param mail
     * @return status code
     */
    public int save(String username, String password, String web, String mail) {
        System.out.println("save Started");
        //Prepare Query
        String query = "INSERT INTO companies VALUES (?,?,?,?,null)";
        try {
            con = SqlConnection.dbConnector();
            //Prepare Statement
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, web);
            st.setString(4, mail);
            //Execute Statement
            int i = st.executeUpdate();
            System.out.println("save successful");
            return i;
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("save failed");
        }
        return 0;

    }

    /**
     * List Companies
     *
     * @return List of Company
     * @throws SQLException
     */
    public static List<Company> list() throws SQLException {

        List<Company> company = new ArrayList<>();
        try {
            con = SqlConnection.dbConnector();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM companies");
            while (rs.next()) {
                Company c = new Company();
                c.setUserName(rs.getString((1)));
                c.setPassword(rs.getString(2));
                c.setCname(rs.getString(3));
                c.setCemail(rs.getString(4));
                c.setCid(rs.getString(5));
                company.add(c);
            }
            return company;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Get company detail by ID
     *
     * @param cid
     * @return Company object
     */
    public static Company getCompanyById(String cid) {
        System.out.println("getCompanyById Started");
        Company c = new Company();
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM companies WHERE cid=?");
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setUserName(rs.getString((1)));
                c.setPassword(rs.getString(2));
                c.setCname(rs.getString(3));
                c.setCemail(rs.getString(4));
                c.setCid(rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    /**
     * Get company detail by email
     *
     * @param Uemail
     * @return Company Object
     */
    public static Company getCompanyByEmail(String Uemail) {
        System.out.println("getCompanyByEmail Started");
        Company c = new Company();
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM companies WHERE email=?");
            ps.setString(1, Uemail);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setUserName(rs.getString((1)));
                c.setPassword(rs.getString(2));
                c.setCname(rs.getString(3));
                c.setCemail(rs.getString(4));
                c.setCid(rs.getString(5));
            }
        } catch (SQLException er) {
            System.out.println(er);
        }
        return c;
    }

    /**
     * Delete a Company
     *
     * @param cid
     * @return status code
     */
    public int deleteCompany(String cid) {
        try {
            System.out.println("Delete Company");
            con = SqlConnection.dbConnector();
            String Query = "DELETE FROM companies WHERE cid=? ";
            PreparedStatement st = con.prepareStatement(Query);
            st.setString(1, cid);
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

}

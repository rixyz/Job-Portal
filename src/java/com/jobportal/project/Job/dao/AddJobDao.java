package com.jobportal.project.Job.dao;

import java.sql.*;

import com.jobportal.project.sql.SqlConnection;

public class AddJobDao {

    Connection con = null;

    /**
     *
     * @param loc
     * @param vac
     * @param ivl
     * @param deadline
     * @param salary
     * @param skill
     * @param mail
     * @return status code
     */
    public int update(String loc, String vac, String ivl, String deadline, String salary, String skill, String mail) {
        System.out.println("addJob Started");
        System.out.println(loc + " " + vac + " " + ivl + " " + deadline + " " + salary + " " + skill + " " + mail);
        //Prepare Query
        String query = "INSERT INTO jobpost VALUES(?,?,?,?,?,?,?,null)";
        try {
            con = SqlConnection.dbConnector();
            //Prepare Statement
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, loc);
            st.setString(2, vac);
            st.setString(3, ivl);
            st.setString(4, deadline);
            st.setString(5, salary);
            st.setString(6, skill);
            st.setString(7, mail);
            //Execute Statement
            int i = st.executeUpdate();
            System.out.println("Added job:dao.update");
            return i;
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Addjob failed");
        }
        return 0;
    }
}

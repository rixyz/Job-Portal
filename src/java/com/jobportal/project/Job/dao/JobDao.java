/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.Job.dao;

/**
 *
 * @author RIX
 */
import java.util.ArrayList;
import java.util.List;

import com.jobportal.project.Job.Bean.Job;
import com.jobportal.project.Job.Bean.TotalApplication;
import com.jobportal.project.sql.SqlConnection;

import java.sql.*;

public class JobDao {

    static Connection con = null;

    /**
     * List Jobs
     * 
     * @return Job List
     * @throws SQLException
     */
    public static List<Job> list() throws SQLException {
        List<Job> jobs = new ArrayList<>();
        try {
            con = SqlConnection.dbConnector();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM jobpost ORDER BY jid DESC");
            while (rs.next()) {
                Job j = new Job();
                j.setLocation(rs.getString("Location"));
                j.setVacancy(rs.getInt("Vacancy"));
                j.setDeadline(rs.getString("Deadline"));
                j.setSalary(rs.getString("Salary"));
                j.setIplace(rs.getString("Iplace"));
                j.setSkills(rs.getString("Skill"));
                j.setCompany(rs.getString("cid"));
                j.setJid(rs.getInt("jid"));
                jobs.add(j);
            }
            return jobs;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    /**
     * Get job by ID
     * 
     * @param jid
     * @return Job object
     */
    public static Job getJobById(String jid) {
        Job j = new Job();

        try {
            con = SqlConnection.dbConnector();
            PreparedStatement ps = con.prepareStatement("select * from jobpost where  jid=?");
            ps.setString(1, jid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                j.setLocation(rs.getString("Location"));
                j.setVacancy(rs.getInt("Vacancy"));
                j.setDeadline(rs.getString("Deadline"));
                j.setSalary(rs.getString("Salary"));
                j.setIplace(rs.getString("Iplace"));
                j.setSkills(rs.getString("Skill"));
                j.setCompany(rs.getString("cid"));
                j.setJid(rs.getInt("jid"));
                System.out.println("Get comp by id" + j);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return j;
    }

    /**
     * Apply user to job
     * 
     * @param Jid
     * @param Eid
     * @return status code
     */
    public int applyToJob(String Jid, String Eid) {
        try {
            con = SqlConnection.dbConnector();
            String exist = "select * from appliedjobs where jid=? and eid=?";
            PreparedStatement str = con.prepareStatement(exist);
            str.setString(1, Jid);
            str.setString(2, Eid);
            ResultSet rs = str.executeQuery();
            if (rs.next()) {
                return 2;
            }

            String query = "INSERT INTO appliedjobs VALUES (?,?,?)";
            PreparedStatement st = con.prepareStatement(query);
            System.out.println(Jid + " " + Eid);
            st.setString(1, Jid);
            st.setString(2, Eid);
            st.setString(3, "WAIT");
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * Unapply from job
     * 
     * @param Jid
     * @param Eid
     * @return
     */
    public int unapplyToJob(String Jid, String Eid) {
        try {
            System.out.println("Unapply Job");
            con = SqlConnection.dbConnector();
            String Query = "DELETE FROM appliedjobs WHERE jid=? and eid=? ";
            PreparedStatement st = con.prepareStatement(Query);
            st.setString(1, Jid);
            st.setString(2, Eid);
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     *
     * @return Application
     */
    public static List<TotalApplication> userAppliedJobs() {
        List<TotalApplication> TA = new ArrayList<>();
        try {
            con = SqlConnection.dbConnector();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from appliedjobs");

            while (rs.next()) {
                TotalApplication t = new TotalApplication();
                t.setJid(rs.getString("jid"));
                t.setEid(rs.getString("eid"));
                t.setApproved(rs.getString("Approved"));
                System.out.println("Dao pass" + t);
                TA.add(t);
            }
            return TA;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    /**
     * Accept or deny application
     * 
     * @param jid
     * @param eid
     * @param approve
     * @return status code
     */
    public int updateApprove(String jid, String eid, String approve) {
        try {
            System.out.println("Approve Job");
            con = SqlConnection.dbConnector();
            String Query = "UPDATE appliedjobs SET Approved =? WHERE jid=? and eid=? ";
            PreparedStatement st = con.prepareStatement(Query);
            st.setString(1, approve);
            st.setString(2, jid);
            st.setString(3, eid);
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * Delete Job
     * 
     * @param jid
     * @return status code
     */
    public int deleteJob(String jid) {
        try {
            System.out.println("Delete Job");
            con = SqlConnection.dbConnector();
            String Query = "DELETE FROM jobpost WHERE jid=? ";
            PreparedStatement st = con.prepareStatement(Query);
            st.setString(1, jid);
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

}

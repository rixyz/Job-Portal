package JobPortal.Service;

import JobPortal.Model.Job;
import JobPortal.Model.JobApplication;
import JobPortal.DBConnection.SqlConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobService {
    /**
     * Retrieves the total count of jobs that match the specified search criteria.
     *
     * @param search a string representing the search criteria.
     * @return the total count of jobs that match the specified search criteria.
     */
    public static int getJobCount(String search) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT COUNT(ID) AS total FROM jobpost WHERE Title LIKE ?")) {
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Retrieves a list of jobs that match the specified search criteria, starting from the specified index and up to the specified limit.
     *
     * @param start  the index of the first job to retrieve.
     * @param total  the maximum number of jobs to retrieve.
     * @param search a string representing the search criteria.
     * @return a list of jobs that match the specified search criteria.
     * @throws SQLException if an error occurs while retrieving the data from the database.
     */
    public static List<Job> getJobList(int start, int total, String search, String sort) throws SQLException {
        List<Job> jobs = new ArrayList<>();
        String query = String.format("SELECT jobpost.id AS ID, location, vacancy, iplace, deadline, salary, title, boosted, jobpost.About AS About, requirement, type, comid, location, vacancy, iplace, deadline, salary, title, boosted, jobpost.about, requirement, type, comid, companies.Name AS Company FROM jobpost JOIN companies  ON companies.ID = jobpost.ComID WHERE title LIKE ? ORDER BY %s LIMIT ?,?", sort);
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement(query)) {
            st.setString(1, "%" + search + "%");
            st.setInt(2, start - 1);
            st.setInt(3, total);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job j = new Job();
                j.setLocation(rs.getString("Location"));
                j.setVacancy(rs.getInt("Vacancy"));
                j.setDeadline(rs.getString("Deadline"));
                j.setSalary(rs.getString("Salary"));
                j.setIplace(rs.getString("Iplace"));
                j.setTitle(rs.getString("Title"));
                j.setComID(rs.getString("ComID"));
                j.setBoosted(rs.getInt("Boosted"));
                j.setID(rs.getString("ID"));
                j.setType(rs.getString("Type"));
                j.setCompany(rs.getString("Company"));
                jobs.add(j);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return jobs;
    }

    /**
     * Retrieves a list of jobs posted by the specified company.
     *
     * @param ComID the ID of the company whose jobs are to be retrieved.
     * @return a list of jobs posted by the specified company.
     * @throws SQLException if an error occurs while retrieving the data from the database.
     */
    public static List<Job> getJobList(String ComID) throws SQLException {
        List<Job> jobs = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT * FROM jobpost WHERE ComID=? ORDER BY Boosted DESC")) {
            st.setString(1, ComID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job j = new Job();
                j.setLocation(rs.getString("Location"));
                j.setVacancy(rs.getInt("Vacancy"));
                j.setDeadline(rs.getString("Deadline"));
                j.setSalary(rs.getString("Salary"));
                j.setIplace(rs.getString("Iplace"));
                j.setTitle(rs.getString("Title"));
                j.setComID(rs.getString("ComID"));
                j.setBoosted(rs.getInt("Boosted"));
                j.setID(rs.getString("ID"));

                jobs.add(j);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return jobs;
    }

    /**
     * Retrieves a job with the specified ID.
     *
     * @param JobID the ID of the job to retrieve.
     * @return the job with the specified ID.
     */
    public static Job getJobById(String JobID) {
        Job j = new Job();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT companies.name, jobpost.ID,jobpost.Title, jobpost.Location, jobpost.About, jobpost.Requirement, jobpost.ComID, jobpost.Vacancy, jobpost.Iplace, jobpost.Deadline, jobpost.Salary, jobpost.Boosted  FROM jobpost INNER JOIN companies ON jobpost.ComID = companies.ID WHERE jobpost.ID = ?")) {
            st.setString(1, JobID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                j.setLocation(rs.getString("Location"));
                j.setVacancy(rs.getInt("Vacancy"));
                j.setDeadline(rs.getString("Deadline"));
                j.setSalary(rs.getString("Salary"));
                j.setIplace(rs.getString("Iplace"));
                j.setTitle(rs.getString("Title"));
                j.setComID(rs.getString("ComID"));
                j.setBoosted(rs.getInt("Boosted"));
                j.setID(rs.getString("ID"));
                j.setCompany(rs.getString("Name"));
                j.setAbout(rs.getString("About"));
                j.setRequirement(rs.getString("Requirement"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return j;
    }

    /**
     * Retrieves the total count of job applications submitted to the specified company.
     *
     * @param ComID the ID of the company whose job applications are to be retrieved.
     * @return the total count of job applications submitted to the specified company.
     */
    public static int getAppliedCount(String ComID) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT COUNT(*) AS Count FROM appliedjobs JOIN jobpost ON jobpost.ID = appliedjobs.JobID WHERE ComID = ?")) {
            st.setString(1, ComID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return (rs.getInt("Count"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Retrieves a list of job applications submitted to the specified company.
     *
     * @param comId the ID of the company whose job applications are to be retrieved.
     * @return a list of job applications submitted to the specified company.
     */
    public static List<JobApplication> getCompanyApplications(String comId) {
        List<JobApplication> TA = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT JobID, EmpID, Approved, ComID FROM appliedjobs JOIN jobpost j ON j.ID = appliedjobs.JobID WHERE ComID = ? ORDER BY Approved DESC")) {
            st.setString(1, comId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                JobApplication t = new JobApplication();
                t.setJid(rs.getString("JobID"));
                t.setEid(rs.getString("EmpID"));
                t.setApproved(rs.getString("Approved"));
                t.setComID(rs.getString("ComID"));
                TA.add(t);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return TA;
    }

    /**
     * Retrieves a list of job applications for a given employee ID.
     *
     * @param EmpID The ID of the employee to retrieve job applications for.
     * @return A list of JobApplication objects representing job applications for the given employee.
     */
    public static List<JobApplication> getUserApplications(String EmpID) {
        List<JobApplication> TA = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT * FROM appliedjobs WHERE EmpID = ? ORDER BY Approved DESC ")) {
            st.setString(1, EmpID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                JobApplication t = new JobApplication();
                t.setJid(rs.getString("JobID"));
                t.setEid(rs.getString("EmpID"));
                t.setApproved(rs.getString("Approved"));
                TA.add(t);
            }

            return TA;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * Adds a new job to the database.
     *
     * @param job A Job object representing the job to be added.
     * @return An integer representing the status code of the operation.
     */
    public int addJob(Job job) {
        //Prepare Query
        String query = "INSERT INTO jobpost(Location, Vacancy, Iplace, Deadline, Salary, Title, Boosted, ComID, About, Requirement, Type) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        String Q = "UPDATE companies SET credit = credit - ? WHERE ID = ?";
        try (Connection con = SqlConnection.dbConnector()) {
            //Reduce Credit Statement
            PreparedStatement s = con.prepareStatement(Q);
            s.setInt(1, job.getBoosted());
            s.setString(2, job.getComID());
            s.executeUpdate();
            //Prepare Statement
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, job.getLocation());
            st.setInt(2, job.getVacancy());
            st.setString(3, job.getIplace());
            st.setString(4, job.getDeadline());
            st.setString(5, job.getSalary());
            st.setString(6, job.getTitle());
            st.setInt(7, job.getBoosted());
            st.setString(8, job.getComID());
            st.setString(9, job.getAbout());
            st.setString(10, job.getRequirement());
            st.setString(11, job.getType());
            //Execute Statement
            int i = st.executeUpdate();
            st.close();
            s.close();
            return i;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Applies a user to a job.
     *
     * @param JobID The ID of the job to apply to.
     * @param EmpID The ID of the employee applying for the job.
     * @return An integer representing the status code of the operation.
     */
    public int applyToJob(String JobID, String EmpID) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT EmpID FROM appliedjobs WHERE JobID=? AND EmpID=?")) {
            st.setString(1, JobID);
            st.setString(2, EmpID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return 2;

            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO appliedjobs (JobID, EmpID, Approved) VALUES (?,?,?)");
            ps.setString(1, JobID);
            ps.setString(2, EmpID);
            ps.setString(3, "WAIT");
            return ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Unapplies a user from a job.
     *
     * @param JobID The ID of the job to unapply from.
     * @param Eid   The ID of the employee to unapply.
     * @return An integer representing the status code of the operation.
     */
    public int unapplyToJob(String JobID, String Eid) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("DELETE FROM appliedjobs WHERE JobID=? AND EmpID=?")) {
            st.setString(1, JobID);
            st.setString(2, Eid);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Updates the approval status of a job application.
     *
     * @param JobID   The ID of the job to update.
     * @param EmpID   The ID of the employee whose application to update.
     * @param approve A string representing the new approval status (e.g. "APPROVED", "DENIED").
     * @return An integer representing the status code of the operation.
     */
    public int updateApprove(String JobID, String EmpID, String approve) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("UPDATE appliedjobs SET Approved =? WHERE JobID=? AND EmpID=?")) {
            st.setString(1, approve);
            st.setString(2, JobID);
            st.setString(3, EmpID);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Deletes a job from the database.
     *
     * @param JobID The ID of the job to delete.
     * @return An integer representing the status code of the operation.
     */
    public int deleteJob(String JobID) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("DELETE FROM jobpost WHERE ID=?")) {
            st.setString(1, JobID);
            return st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

}

package JobPortal.Service;

import JobPortal.Model.ReportData;
import JobPortal.Model.Sessions;
import JobPortal.DBConnection.SqlConnection;
import io.github.cdimascio.dotenv.Dotenv;
import io.github.cdimascio.dotenv.DotenvEntry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    /**
     * Retrieves the annual reports data, including employee count, company count, job count, application count,
     * success count, and month name for each month of the year.
     *
     * @return ReportData object containing the annual reports data
     */
    public static ReportData getAnnualReports() {
        ReportData data = new ReportData();
        int[] employeeCount = new int[12];
        int[] companyCount = new int[12];
        int[] jobCount = new int[12];
        int[] applicationCount = new int[12];
        int[] successCount = new int[12];
        String[] monthsName = new String[12];
        int i = 0;
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT employee_count, company_count, job_count, application_count, job_success, MONTH FROM report ORDER BY IF(MONTH > MONTH(CURRENT_DATE), MONTH - MONTH(CURRENT_DATE), MONTH + (12 - MONTH(CURRENT_DATE)))");
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                employeeCount[i] = rs.getInt("employee_count");
                companyCount[i] = rs.getInt("company_count");
                jobCount[i] = rs.getInt("job_count");
                applicationCount[i] = rs.getInt("application_count");
                successCount[i] = rs.getInt("job_success");
                monthsName[i] = '"' + new DateFormatSymbols().getMonths()[rs.getInt("month") - 1] + '"';
                i++;
            }
            data.setApplicationCount(applicationCount);
            data.setCompanyCount(companyCount);
            data.setSuccessCount(successCount);
            data.setJobCount(successCount);
            data.setEmployeeCount(employeeCount);
            data.setJobCount(jobCount);
            data.setMonths(monthsName);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return data;
    }

    /**
     * Retrieves a list of all active sessions in the system.
     *
     * @return List of Sessions objects representing the active sessions
     */
    public static List<Sessions> getActiveSessions() {
        List<Sessions> sessionsList = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT * FROM sessions ")) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Sessions s = new Sessions();
                s.setType(rs.getString("Type"));
                s.setId(rs.getString("UserID"));
                s.setTime(rs.getString("Time"));
                sessionsList.add(s);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return sessionsList;
    }

    /**
     * Sets a new session for the specified user and type, or updates the time of an existing session.
     *
     * @param id   String representing the user ID for the session
     * @param type String representing the type of session
     */
    public static void setSession(String id, String type) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("INSERT INTO sessions(UserID, Type, Time) VALUES (?,?,NOW())ON DUPLICATE KEY UPDATE TIME=NOW()")) {
            st.setString(1, id);
            st.setString(2, type);
            //Execute Statement
            System.out.println("Created session for " + type);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Clears all existing sessions from the system.
     */
    public static void clearSession() {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("TRUNCATE TABLE sessions")) {
            //Execute Statement
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Invalidates the specified session for the given user and type.
     *
     * @param ID   String representing the user ID for the session to be invalidated
     * @param type String representing the type of session to be invalidated
     */
    public static void invalidateSession(String ID, String type) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("DELETE FROM sessions WHERE UserID=? & TYPE=?")) {
            st.setString(1, ID);
            st.setString(2, type);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void setEnv() {
        Dotenv dotenv = Dotenv.load();
        for (DotenvEntry e : dotenv.entries()) {
            System.out.println(e);
        }
        System.out.printf(
                "Hello World. Shell is: %s. Name is: %s%n",
                System.getenv("SHELL"),
                dotenv.get("DB_URL")
        );
    }
}
